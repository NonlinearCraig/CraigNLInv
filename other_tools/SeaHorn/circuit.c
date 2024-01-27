#include "seahorn/seahorn.h"
#include "stdio.h"
extern double x1,x2,y1,y2;

int main(){

if(0.625-(x1-0.5)*(x1-0.5)-(x2-0.5)*(x2-0.5)>=0){

  while(1>=0){
       y1=8/9*x1-1/18*x2;
       y2=x2+(x1*2+x2-1)*x2+1;
       x1=y1;
       x2=y2;
    }
  }
  printf("x1=%f,x2=%f", x1,x2);
  sassert(x2*x2 - 4 <= 0);
}