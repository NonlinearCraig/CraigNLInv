#include "seahorn/seahorn.h"
#include "stdio.h"
extern double x1,x2,y1,y2;

int main(){

if(x1==0&&x2==0){

  while((5-x1)>=0&& (x1*(10-x1))>=0 && (x2*(10-x2)>=0)){
       y1=x1 + 1;
       y2=x2 + 5.5*x1 + 5.5;
       x1=y1;
       x2=y2;
    }
  }
  printf("x1=%f,x2=%f", x1,x2);
  sassert((2.5*x1*x1+4*x1-x2) <= 0&&(x2-3.5*x1*x1-3*x1<=0));
}