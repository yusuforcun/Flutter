var renk1=["red","green","blue","purple","pink","black","white"];

var r1=Math.floor(Math.random()*8);
var r2=Math.floor(Math.random()*8);

function renklensin(){
    document.getElementById("renk1").style.backgroundColor=renk1[r1];
    document.getElementById("renk2").style.backgroundColor=renk1[r2];
}