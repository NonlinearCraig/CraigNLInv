#include "seahorn/seahorn.h"
#include "stdio.h"
extern double x1,x2;
int main(){
if(1-x1*x1-x2*x2>=0 && (5-x1)*(x1+5)>=0&&(5-x2)*(x2+5)>=0){
  while(1-x1*x1-x2*x2>0&& (5-x1)*(x1+5)>=0&&(5-x2)*(x2+5)>=0){
       y1=0.9*(x1-0.01*x2);
       y2=0.9*(x2+0.01*x1);
       x1=y1;
       x2=y2;
  }
  }
  printf("x1=%f,x2=%f", x1,x2);
  sassert(0.25-x1*x1-(x2-2)*(x2-2)<=0);
}

