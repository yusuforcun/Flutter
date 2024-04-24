// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:math' as math;
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:vector_math/vector_math_64.dart';

import 'ink_well.dart';
import 'material.dart';

/// Begin a Material 3 ink sparkle ripple, centered at the tap or click position
/// relative to the [referenceBox].
///
/// This effect relies on a shader, and therefore hardware acceleration.
/// Currently, this is only supported by certain C++ engine platforms. The
/// platforms that are currently supported are Android, iOS, MacOS, Windows,
/// and Linux. Support for CanvasKit web can be tracked here:
///  - https://github.com/flutter/flutter/issues/85238
///
/// To use this effect, pass an instance of [splashFactory] to the
/// `splashFactory` parameter of either the Material [ThemeData] or any
/// component that has a `splashFactory` parameter, such as buttons:
///  - [ElevatedButton]
///  - [TextButton]
///  - [OutlinedButton]
///
/// The [controller] argument is typically obtained via
/// `Material.of(context)`.
///
/// If [containedInkWell] is true, then the effect will be sized to fit
/// the well rectangle, and clipped to it when drawn. The well
/// rectangle is the box returned by [rectCallback], if provided, or
/// otherwise is the bounds of the [referenceBox].
///
/// If [containedInkWell] is false, then [rectCallback] should be null.
/// The ink ripple is clipped only to the edges of the [Material].
/// This is the default.
///
/// When the ripple is removed, [onRemoved] will be called.
///
/// {@tool snippet}
///
/// For typical use, pass the [InkSparkle.splashFactory] to the `splashFactory`
/// parameter of a button style or [ThemeData].
///
/// ```dart
/// ElevatedButton(
///   style: ElevatedButton.styleFrom(splashFactory: InkSparkle.splashFactory),
///   child: const Text('Sparkle!'),
///   onPressed: () { },
/// )
/// ```
/// {@end-tool}
class InkSparkle extends InteractiveInkFeature {
  /// Begin a sparkly ripple effect, centered at [position] relative to
  /// [referenceBox].
  ///
  /// The [color] defines the color of the splash itself. The sparkles are
  /// always white.
  ///
  /// The [controller] argument is typically obtained via
  /// `Material.of(context)`.
  ///
  /// [textDirection] is used by [customBorder] if it is non-null. This allows
  /// the [customBorder]'s path to be properly defined if it was the path was
  /// expressed in terms of "start" and "end" instead of
  /// "left" and "right".
  ///
  /// If [containedInkWell] is true, then the ripple will be sized to fit
  /// the well rectangle, then clipped to it when drawn. The well
  /// rectangle is the box returned by [rectCallback], if provided, or
  /// otherwise is the bounds of the [referenceBox].
  ///
  /// If [containedInkWell] is false, then [rectCallback] should be null.
  /// The ink ripple is clipped only to the edges of the [Material].
  /// This is the default.
  ///
  /// Clipping can happen in 3 different ways:
  ///  1. If [customBorder] is provided, it is used to determine the path for
  ///     clipping.
  ///  2. If [customBorder] is null, and [borderRadius] is provided, then the
  ///     canvas is clipped by an [RRect] created from [borderRadius].
  ///  3. If [borderRadius] is the default [BorderRadius.zero], then the canvas
  ///     is clipped with [rectCallback].
  /// When the ripple is removed, [onRemoved] will be called.
  ///
  /// [turbulenceSeed] can be passed if a non random seed should be used for
  /// the turbulence and sparkles. By default, the seed is a random number
  /// between 0.0 and 1000.0.
  ///
  /// Turbulence is an input to the shader and helps to provides a more natural,
  ///  non-circular, "splash" effect.
  ///
  /// Sparkle randomization is also driven by the [turbulenceSeed]. Sparkles are
  /// identified in the shader as "noise", and the sparkles are derived from
  /// pseudorandom triangular noise.
  InkSparkle({
    required MaterialInkController controller,
    required RenderBox referenceBox,
    required super.color,
    required Offset position,
    required TextDirection textDirection,
    bool containedInkWell = true,
    RectCallback? rectCallback,
    BorderRadius? borderRadius,
    ShapeBorder? customBorder,
    double? radius,
    super.onRemoved,
    double? turbulenceSeed,
  }) : assert(containedInkWell || rectCallback == null),
       _color = color,
       _position = position,
       _borderRadius = borderRadius ?? BorderRadius.zero,
       _customBorder = customBorder,
       _textDirection = textDirection,
       _targetRadius = (radius ?? _getTargetRadius(referenceBox, containedInkWell, rectCallback, position)) * _targetRadiusMultiplier,
       _clipCallback = _getClipCallback(referenceBox, containedInkWell, rectCallback),
       super(controller: controller, referenceBox: referenceBox) {
    // InkSparkle will not be painted until the async compilation completes.
    _InkSparkleFactory.compileShaderIfNeccessary();
    controller.addInkFeature(this);

    // All animation values are derived from Android 12 source code. See:
    // - https://cs.android.com/android/platform/superproject/+/master:frameworks/base/graphics/java/android/graphics/drawable/RippleShader.java
    // - https://cs.android.com/android/platform/superproject/+/master:frameworks/base/graphics/java/android/graphics/drawable/RippleDrawable.java
    // - https://cs.android.com/android/platform/superproject/+/master:frameworks/base/graphics/java/android/graphics/drawable/RippleAnimationSession.java

    // Immediately begin animating the ink.
    _animationController = AnimationController(
      duration: _animationDuration,
      vsync: controller.vsync,
    )..addListener(controller.markNeedsPaint)
     ..addStatusListener(_handleStatusChanged)
     ..forward();

    _radiusScale = TweenSequence<double>(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: CurveTween(curve: Curves.fastOutSlowIn),
          weight: 75,
        ),
        TweenSequenceItem<double>(
          tween: ConstantTween<double>(1.0),
          weight: 25,
        ),
      ],
    ).animate(_animationController);

    // Functionally equivalent to Android 12's SkSL:
    //`return mix(u_touch, u_resolution, saturate(in_radius_scale * 2.0))`
    final Tween<Vector2> centerTween = Tween<Vector2>(
      begin: Vector2.array(<double>[_position.dx, _position.dy]),
      end: Vector2.array(<double>[referenceBox.size.width / 2, referenceBox.size.height / 2]),
    );
    final Animation<double> centerProgress = TweenSequence<double>(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.0),
          weight: 50,
        ),
        TweenSequenceItem<double>(
          tween: ConstantTween<double>(1.0),
          weight: 50,
        ),
      ],
    ).animate(_radiusScale);
    _center = centerTween.animate(centerProgress);

    _alpha = TweenSequence<double>(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.0),
          weight: 13,
        ),
        TweenSequenceItem<double>(
          tween: ConstantTween<double>(1.0),
          weight: 27,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.0, end: 0.0),
          weight: 60,
        ),
      ],
    ).animate(_animationController);

    _sparkleAlpha = TweenSequence<double>(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.0),
          weight: 13,
        ),
        TweenSequenceItem<double>(
          tween: ConstantTween<double>(1.0),
          weight: 27,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.0, end: 0.0),
          weight: 50,
        ),
      ],
    ).animate(_animationController);

    // Creates an element of randomness so that ink eminating from the same
    // pixel have slightly different rings and sparkles.
    _turbulenceSeed = turbulenceSeed ?? math.Random().nextDouble() * 1000.0;
  }

  void _handleStatusChanged(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      dispose();
    }
  }

  static const Duration _animationDuration = Duration(milliseconds: 617);
  static const double _targetRadiusMultiplier = 2.3;
  static const double _rotateRight = math.pi * 0.0078125;
  static const double _rotateLeft = -_rotateRight;
  static const double _noiseDensity = 2.1;

  late AnimationController _animationController;

  // The Android 12 version has these values calculated in the GLSL. They are
  // constant for every pixel in the animation, so the Flutter implementation
  // computes these animation values in software in order to simplify the shader
  // implementation and provide better performance on most devices.
  late Animation<Vector2> _center;
  late Animation<double> _radiusScale;
  late Animation<double> _alpha;
  late Animation<double> _sparkleAlpha;

  late double _turbulenceSeed;

  final Color _color;
  final Offset _position;
  final BorderRadius _borderRadius;
  final ShapeBorder? _customBorder;
  final double _targetRadius;
  final RectCallback? _clipCallback;
  final TextDirection _textDirection;

  /// Used to specify this type of ink splash for an [InkWell], [InkResponse],
  /// material [Theme], or [ButtonStyle].
  ///
  /// Since no [turbulenceSeed] is passed, the effect will be random for
  /// subsequent presses in the same position.
  static const InteractiveInkFeatureFactory splashFactory = _InkSparkleFactory();

  /// Used to specify this type of ink splash for an [InkWell], [InkResponse],
  /// material [Theme], or [ButtonStyle].
  ///
  /// Since a [turbulenceSeed] is passed, the effect will not be random for
  /// subsequent presses in the same position. This can be used for testing.
  static const InteractiveInkFeatureFactory constantTurbulenceSeedSplashFactory = _InkSparkleFactory.constantTurbulenceSeed();

  @override
  void dispose() {
    _animationController.stop();
    _animationController.dispose();
    super.dispose();
  }

  @override
  void paintFeature(Canvas canvas, Matrix4 transform) {
    assert(_animationController.isAnimating);

    // InkSparkle can only paint if its shader has been compiled.
    if (_InkSparkleFactory._shaderManager == null) {
      // Skipping paintFeature because the shader it relies on is not ready to
      // be used. InkSparkleFactory.compileShaderIfNeccessary must complete
      // before InkSparkle can paint.
      return;
    }

    canvas.save();
    _transformCanvas(canvas: canvas, transform: transform);
    if (_clipCallback != null) {
      _clipCanvas(
        canvas: canvas,
        clipCallback: _clipCallback!,
        textDirection: _textDirection,
        customBorder: _customBorder,
        borderRadius: _borderRadius,
      );
    }

    final Paint paint = Paint()..shader = _createRippleShader();
    if (_clipCallback != null) {
      canvas.drawRect(_clipCallback!(), paint);
    } else {
      canvas.drawPaint(paint);
    }
    canvas.restore();
  }

  double get _width => referenceBox.size.width;
  double get _height => referenceBox.size.height;

  /// All double values for uniforms come from the Android 12 ripple
  /// implementation from the following files:
  /// - https://cs.android.com/android/platform/superproject/+/master:frameworks/base/graphics/java/android/graphics/drawable/RippleShader.java
  /// - https://cs.android.com/android/platform/superproject/+/master:frameworks/base/graphics/java/android/graphics/drawable/RippleDrawable.java
  /// - https://cs.android.com/android/platform/superproject/+/master:frameworks/base/graphics/java/android/graphics/drawable/RippleAnimationSession.java
  Shader _createRippleShader() {
    const double turbulenceScale = 1.5;
    final double turbulencePhase = _turbulenceSeed + _radiusScale.value;
    final double noisePhase = turbulencePhase;
    final double rotation1 = turbulencePhase * _rotateRight + 1.7 * math.pi;
    final double rotation2 = turbulencePhase * _rotateLeft + 2.0 * math.pi;
    final double rotation3 = turbulencePhase * _rotateRight + 2.75 * math.pi;

    return _InkSparkleFactory._shaderManager!.shader(
      // The following uniforms are the same throughout the animation.
      uColor: _colorToVector4(_color),
      uSparkleColor: Vector4(1.0, 1.0, 1.0, 1.0),
      uBlur: 1.0,
      uMaxRadius: _targetRadius,
      uResolutionScale: Vector2(1.0 / _width, 1.0 / _height),
      uNoiseScale: Vector2(_noiseDensity / _width, _noiseDensity / _height),

      // The following uniforms update each frame of the animation.
      uCenter: _center.value,
      uRadiusScale: _radiusScale.value,
      uAlpha: _alpha.value,
      uSparkleAlpha: _sparkleAlpha.value,

      // The following uniforms are driven by the turbulence phase and change
      // each frame of the animation. These uniforms are uses to modify the
      // default (if these fields are unset or 0) circular outer ring to a
      // non-uniform shape that is more like an actual ink splash. In addition
      // to the positional based triangular noise created in the shader, these
      // uniforms also vary the appearance of the sparkles even when the same
      // location is tapped.
      uTurbulencePhase: turbulencePhase,
      uNoisePhase: noisePhase / 1000.0,
      uCircle1: Vector2(
        turbulenceScale * 0.5 + (turbulencePhase * 0.01 * math.cos(turbulenceScale * 0.55)),
        turbulenceScale * 0.5 + (turbulencePhase * 0.01 * math.sin(turbulenceScale * 0.55)),
      ),
      uCircle2: Vector2(
        turbulenceScale * 0.2 + (turbulencePhase * -0.0066 * math.cos(turbulenceScale * 0.45)),
        turbulenceScale * 0.2 + (turbulencePhase * -0.0066 * math.sin(turbulenceScale * 0.45)),
      ),
      uCircle3: Vector2(
        turbulenceScale + (turbulencePhase * -0.0066 * math.cos(turbulenceScale * 0.35)),
        turbulenceScale + (turbulencePhase * -0.0066 * math.sin(turbulenceScale * 0.35)),
      ),
      uRotation1: Vector2(math.cos(rotation1), math.sin(rotation1)),
      uRotation2: Vector2(math.cos(rotation2), math.sin(rotation2)),
      uRotation3: Vector2(math.cos(rotation3), math.sin(rotation3)),
    );
  }

  Vector4 _colorToVector4(Color color) {
    return Vector4(
        color.red / 255.0,
        color.blue / 255.0,
        color.green / 255.0,
        color.alpha / 255.0,
      );
  }

  /// Transforms the canvas for an ink feature to be painted on the [canvas].
  ///
  /// This should be called before painting ink features that do not use
  /// [paintInkCircle].
  ///
  /// The [transform] argument is the [Matrix4] transform that typically
  /// shifts the coordinate space of the canvas to the space in which
  /// the ink feature is to be painted.
  ///
  /// For examples on how the function is used, see [InkSparkle] and [paintInkCircle].
  void _transformCanvas({
    required Canvas canvas,
    required Matrix4 transform,
  }) {
    final Offset? originOffset = MatrixUtils.getAsTranslation(transform);
    if (originOffset == null) {
      canvas.transform(transform.storage);
    } else {
      canvas.translate(originOffset.dx, originOffset.dy);
    }
  }

  /// Clips the canvas for an ink feature to be painted on the [canvas].
  ///
  /// This should be called before painting ink features with [paintFeature]
  /// that do not use [paintInkCircle].
  ///
  /// The [clipCallback] is the callback used to obtain the [Rect] used for clipping
  /// the ink effect.
  ///
  /// If [clipCallback] is null, no clipping is performed on the ink circle.
  ///
  /// The [textDirection] is used by [customBorder] if it is non-null. This
  /// allows the [customBorder]'s path to be properly defined if the path was
  /// expressed in terms of "start" and "end" instead of "left" and "right".
  ///
  /// For examples on how the function is used, see [InkSparkle].
  void _clipCanvas({
    required Canvas canvas,
    required RectCallback clipCallback,
    TextDirection? textDirection,
    ShapeBorder? customBorder,
    BorderRadius borderRadius = BorderRadius.zero,
  }) {
    final Rect rect = clipCallback();
    if (customBorder != null) {
      canvas.clipPath(
          customBorder.getOuterPath(rect, textDirection: textDirection));
    } else if (borderRadius != BorderRadius.zero) {
      canvas.clipRRect(RRect.fromRectAndCorners(
        rect,
        topLeft: borderRadius.topLeft,
        topRight: borderRadius.topRight,
        bottomLeft: borderRadius.bottomLeft,
        bottomRight: borderRadius.bottomRight,
      ));
    } else {
      canvas.clipRect(rect);
    }
  }
}

class _InkSparkleFactory extends InteractiveInkFeatureFactory {
  const _InkSparkleFactory() : turbulenceSeed = null;

  const _InkSparkleFactory.constantTurbulenceSeed() : turbulenceSeed = 1337.0;

  // TODO(clocksmith): Update this once shaders are precompiled.
  static void compileShaderIfNeccessary() {
    if (!_initCalled) {
      FragmentShaderManager.inkSparkle().then((FragmentShaderManager manager) {
        _shaderManager = manager;
      });
      _initCalled = true;
    }
  }
  static bool _initCalled = false;
  static FragmentShaderManager? _shaderManager;

  final double? turbulenceSeed;

  @override
  InteractiveInkFeature create({
    required MaterialInkController controller,
    required RenderBox referenceBox,
    required ui.Offset position,
    required ui.Color color,
    required ui.TextDirection textDirection,
    bool containedInkWell = false,
    RectCallback? rectCallback,
    BorderRadius? borderRadius,
    ShapeBorder? customBorder,
    double? radius,
    ui.VoidCallback? onRemoved,
  }) {
    return InkSparkle(
      controller: controller,
      referenceBox: referenceBox,
      position: position,
      color: color,
      textDirection: textDirection,
      containedInkWell: containedInkWell,
      rectCallback: rectCallback,
      borderRadius: borderRadius,
      customBorder: customBorder,
      radius: radius,
      onRemoved: onRemoved,
      turbulenceSeed: turbulenceSeed,
    );
  }
}

RectCallback? _getClipCallback(
  RenderBox referenceBox,
  bool containedInkWell,
  RectCallback? rectCallback,
) {
  if (rectCallback != null) {
    assert(containedInkWell);
    return rectCallback;
  }
  if (containedInkWell) {
    return () => Offset.zero & referenceBox.size;
  }
  return null;
}

double _getTargetRadius(
  RenderBox referenceBox,
  bool containedInkWell,
  RectCallback? rectCallback,
  Offset position,
) {
  final Size size = rectCallback != null ? rectCallback().size : referenceBox.size;
  final double d1 = size.bottomRight(Offset.zero).distance;
  final double d2 = (size.topRight(Offset.zero) - size.bottomLeft(Offset.zero)).distance;
  return math.max(d1, d2) / 2.0;
}

// The code below is generated by the package: fragment_shader_manager.
// It is hand modified to update for flutter/flutter style and asset loading.

/// A generated class for managing [FragmentProgram] that includes a
/// pre-transpiled shader program into SPIR-V.
///
/// See:
/// - https://github.com/material-components/material-components-flutter-experimental/tree/fragment-shader-manager/fragment_shader_manager
///
/// GLSL source for this shader is under `shaders/ink_sparkle.frag`.
class FragmentShaderManager {
  FragmentShaderManager._();

  static late ui.FragmentProgram _program;

  /// Creates an [FragmentShaderManager] with an [InkSparkle] effect.
  static Future<FragmentShaderManager> inkSparkle() async {
    final FragmentShaderManager manager = FragmentShaderManager._();
    await manager._compile();
    return manager;
  }

  /// Compiles the spir-v bytecode into a shader program.
  Future<void> _compile() async {
    final ByteData data = await rootBundle.load('shaders/ink_sparkle.frag');
    _program = await ui.FragmentProgram.compile(spirv: data.buffer);
  }

  /// Creates a shader with the original program and optional uniforms.
  ///
  /// A new shader must be made whenever the uniforms are updated.
  Shader shader({
    Vector4? uColor,
    double? uAlpha,
    Vector4? uSparkleColor,
    double? uSparkleAlpha,
    double? uBlur,
    Vector2? uCenter,
    double? uRadiusScale,
    double? uMaxRadius,
    Vector2? uResolutionScale,
    Vector2? uNoiseScale,
    double? uNoisePhase,
    double? uTurbulencePhase,
    Vector2? uCircle1,
    Vector2? uCircle2,
    Vector2? uCircle3,
    Vector2? uRotation1,
    Vector2? uRotation2,
    Vector2? uRotation3,
  }) {
    return _program.shader(
      floatUniforms: Float32List.fromList(<double>[
        ...uColor != null ? uColor.storage : <double>[0, 0, 0, 0],
        ...uAlpha != null ? <double>[uAlpha] : <double>[0],
        ...uSparkleColor != null ? uSparkleColor.storage : <double>[0, 0, 0, 0],
        ...uSparkleAlpha != null ? <double>[uSparkleAlpha] : <double>[0],
        ...uBlur != null ? <double>[uBlur] : <double>[0],
        ...uCenter != null ? uCenter.storage : <double>[0, 0],
        ...uRadiusScale != null ? <double>[uRadiusScale] : <double>[0],
        ...uMaxRadius != null ? <double>[uMaxRadius] : <double>[0],
        ...uResolutionScale != null ? uResolutionScale.storage : <double>[0, 0],
        ...uNoiseScale != null ? uNoiseScale.storage : <double>[0, 0],
        ...uNoisePhase != null ? <double>[uNoisePhase] : <double>[0],
        ...uCircle1 != null ? uCircle1.storage : <double>[0, 0],
        ...uCircle2 != null ? uCircle2.storage : <double>[0, 0],
        ...uCircle3 != null ? uCircle3.storage : <double>[0, 0],
        ...uRotation1 != null ? uRotation1.storage : <double>[0, 0],
        ...uRotation2 != null ? uRotation2.storage : <double>[0, 0],
        ...uRotation3 != null ? uRotation3.storage : <double>[0, 0],
      ]),
    );
  }
}
