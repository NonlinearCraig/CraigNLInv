int main(){
  // variable declarations
  int n,rr,u,v,r;
  //precondition
  assume(n>=1);
  assume(rr>=0);
  assume(rr>=n);
  assume(n-(rr-1)^2>=0);
  u = 2*rr+1;
  v = 1;
  r = rr*rr-n;
  // loop body
  while(unknown()){
    if(r>=1){
        r = r - v;
        v = v + 2;
    }
    else if(r<=0)
    {
        r = r + u;
        u = u + 2;
    }
  }
  // post-condition
  assert(4*n+ 4*r == u*u - v*v - 2*u + 2*v );
}