int main(){
  // variable declarations
  int A, B, q, r, b;
  //precondition
  assume(q==0);
  assume(r==A);
  assume(b==B);
  assume(b>=r+1);

  // loop body
  while(B + 1 - b<=0){
        if (r>=b){
            A = A;
            B = B;
            q = 2*q + 1;
            r = r - b/2;
            b = b/2;
        } 
        else if (r + 1 - b<=0)  
        {
            A = A;
            B = B;
            q = 2*q;
            r = r;
            b = b/2;   
        }     
  }
  // post-condition
  assert( B>=b-1);
}
