// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';

import 'desktop_text_selection.dart';
import 'text_selection.dart';
import 'theme.dart';

/// A widget that introduces an area for user selections with adaptive selection
/// controls.
///
/// This widget creates a [SelectableRegion] with platform-adaptive selection
/// controls.
///
/// Flutter widgets are not selectable by default. To enable selection for
/// a specific screen, consider wrapping the body of the [Route] with a
/// [SelectionArea].
///
/// {@tool dartpad}
/// This example shows how to make a screen selectable.
///
/// ** See code in examples/api/lib/material/selection_area/selection_area.dart **
/// {@end-tool}
///
/// See also:
///  * [SelectableRegion], which provides an overview of the selection system.
class SelectionArea extends StatefulWidget {
  /// Creates a [SelectionArea].
  ///
  /// If [selectionControls] is null, a platform specific one is used.
  const SelectionArea({
    super.key,
    this.focusNode,
    this.selectionControls,
    required this.child,
  });

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// The delegate to build the selection handles and toolbar.
  ///
  /// If it is null, the platform specific selection control is used.
  final TextSelectionControls? selectionControls;

  /// The child widget this selection area applies to.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child}
  final Widget child;

  @override
  State<StatefulWidget> createState() => _SelectionAreaState();
}

class _SelectionAreaState extends State<SelectionArea> {
  FocusNode get _effectiveFocusNode {
    if (widget.focusNode != null) {
      return widget.focusNode!;
    }
    _internalNode ??= FocusNode();
    return _internalNode!;
  }
  FocusNode? _internalNode;

  @override
  void dispose() {
    _internalNode?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextSelectionControls? controls = widget.selectionControls;
    switch (Theme.of(context).platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        controls ??= materialTextSelectionControls;
        break;
      case TargetPlatform.iOS:
        controls ??= cupertinoTextSelectionControls;
        break;
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        controls ??= desktopTextSelectionControls;
        break;
      case TargetPlatform.macOS:
        controls ??= cupertinoDesktopTextSelectionControls;
        break;
    }
    return SelectableRegion(
      focusNode: _effectiveFocusNode,
      selectionControls: controls,
      child: widget.child,
    );
  }
}
