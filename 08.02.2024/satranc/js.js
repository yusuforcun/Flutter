function satranc() {
    var i, j;
    for (i = 0; i < 8; i++) {
        for (j = 0; j < 8; j++) {
            if ((j + i) % 2 === 0) {
                document.getElementById("tahtaCerceve").innerHTML += "<div class='kareBeyaz'></div>";
            }
            else {
                document.getElementById("tahtaCerceve").innerHTML += "<div class='kareSiyah'></div>";
            }
        }
    }
}



gorun = true ;

var a=setInterval(function(){
     if(gorun==true){
        document.getElementsById("tahtaCerceve").style.display="block";
        gorun=false;
     }
     else{
        document.getElementById("tahtaCerceve").style.display="none";
        gorun=true;
     }
}
,500
)
