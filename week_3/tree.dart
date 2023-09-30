void main(){
  double boy = 100 ;
  for(int i=1 ; i<=10 ; i++){
    boy = boy + boy*20/100 ;
    boy = boy/100 ;
    print(i.toString()+".yil agacin boyu : "+boy.toString());
  }
} 