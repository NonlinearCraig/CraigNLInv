#include "seahorn/seahorn.h"
#include "stdio.h"
extern double x1,x2,y1,y2;

int main(){

if(-x1^2 -(x2-1)^2 + 1>=0){

  while(1>=0){
       y1=0.01;
       y2=1.0178 + 1.8721 * x1 - 0.0253 * x2;
       x1=x1 + y1*(1-y2*x2); 
       x2= x2 + y1*x1*y2;
    }
  }
  printf("x1=%f,x2=%f", x1,x2);
  sassert(x1*x1 + (x2-1)*(x2-1)-4<= 0);
}