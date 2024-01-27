#include "seahorn/seahorn.h"
#include "stdio.h"
extern double x1;
int main(){
//pre x1*(80-x1))>=0
if((x1*(80-x1))>=0){
//loop cond (x1+1)*(x1-82)<=0
  while((x1+1)*(x1-82)<=0){
       x1=x1+0.0005*(1000-0.5418*x1*x1);
    }
  }
//post (x1+10)*(x1-79) <= 0
  sassert((x1+10)*(x1-79) <= 0);
}
