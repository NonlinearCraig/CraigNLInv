#include "seahorn/seahorn.h"
#include "stdio.h"
extern double x1,x2;
int main(){
if(x1*(1-x1)>=0){
  while((x1+0.3)*(1.7-x1)>=0){
       x1=-1.6*x1*(1-x1);
  }
  }
  printf("x1=%f", x1);
  sassert((x1-1.5)*(x1+1)<=0);
}
