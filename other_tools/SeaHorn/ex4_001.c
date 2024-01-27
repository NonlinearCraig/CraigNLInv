#include "seahorn/seahorn.h"
#include "stdio.h"
extern double x1;
int main(){
if((x1+1)*(1-x1)>=0){
  while((x1+3)*(3-x1)>=0){
       x1=x1-0.001*x1*(x1-2)*(x1-4);
  }
  }
  printf("x1=%f", x1);
  sassert((x1-3)*(5-x1)<=0);
}
