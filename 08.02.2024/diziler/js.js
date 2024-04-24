var ingilizce=["apple","bottle","computer","book","mouse","wall","pen","paper","table"]
var turkce=["elma","şişe","bilgisiyar","kitap","fare","duvar","kalem","kağıt","masa"]

function cevir(){
    var siraNo;
    siraNo=ingilizce.indexOf(document.getElementById("arananKelime").value);
    if(siraNo>=0){
    document.getElementById("turkce").innerText=turkce[siraNo];

    }
}

var artıpuan=0 ;
var eksipuan=0 ;
function tahmin(){


    var kelime=document.getElementById("ing").innerText;
    
    var siraNo;
    siraNo = ingilizce.indexOf(kelime);
    var tahmin;
    tahmin=turkce[siraNo];
    var deger = document.getElementById("tahminkelime").value;

    if(deger ==tahmin){
        document.getElementById("ing").style.color="green";
        var ran=1 ;
        ran=Math.floor(Math.random(10)*5)
        document.getElementById("ing").innerText=ingilizce[ran];
        artıpuan++;
        document.getElementById("artiolan").innerText=artıpuan;
        document.getElementById("eksiolan").textContent=eksipuan;
        
        
    }
    else{
        document.getElementById("ing").style.color="red";
        var ran=1;
        ran = Math.floor(Math.random(10)*5);
        document.getElementById("ing").innerText=ingilizce[ran];
        eksipuan++;
        document.getElementById("artiolan").textContent=artıpuan;
        document.getElementById("eksiolan").textContent=eksipuan;
    }

}