void main(){
  var  notlar = [100,85,95,61,45];
    
    int ort = 0 ;
    for (int i=0 ; i < notlar.length ; i++){
      ort = ort + notlar[i] ; 
    }
    
 var toplam = ort/notlar.length ;
    for (int i=0 ;i < notlar.length ; i++){
      if(toplam > notlar[i]) 
        print(notlar[i]);
    }
    print("ortalama"+toplam.toString());
} 