void main(){
  double sermaye = 10000 ;
  for(int i=1 ; i<=10 ; i++){
    sermaye = sermaye + sermaye*10/100 ;
    print(i.toString()+".yil sermayesi : "+sermaye.toString());
  }
} 