#include "seahorn/seahorn.h"
#include "stdio.h"
extern double x1,x2,y1,y2;

int main(){

if(1-x1*x1-x2*x2>=0){

  while(3-x1*x1-x2*x2>=0){
       y1=x1*x1+x2-1;
       y2=x2+(x1*2+x2-1)*x2+1;
       x1=y1;
       x2=y2;
    }
  }
  printf("x1=%f,x2=%f", x1,x2);
  sassert(-x2 + 0.2*x1*x1 - 1 <= 0);
}
