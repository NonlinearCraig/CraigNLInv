int main(){
  // variable declarations
  int N, D, r, ds, p, q;
  //precondition
  assume(N>=0);
  assume(D>=1);
  assume(r==N);
  assume(D==ds);
  assume(p==1);
  assume(q==0);
  assume(r<=ds-1);
  // loop body
  while(2 - p<=0){
        if (r>=ds){
            N =N;
            D = D;
            r = r - ds/2;
            ds = ds/2;
            p =p/2;
            q =q + p/2;
        } 
        else if (r<=ds-1)  
        {
            N =N;
            D = D;
            r = r;
            ds = ds/2;
            p =p/2; 
            q =q;  
        }      
  }
  // post-condition
  assert( p<=2);
}
