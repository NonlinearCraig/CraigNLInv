int main(){
  // variable declarations
  int vp, vq, vr, vn, vh;
  //precondition
  assume(vp==0);
  assume(vr==vn);
  assume(vq<=4*vn);
  assume(vq>=1+vn);

  // loop body
  while(vq>=2){
        if (vr>=vh){
            vp= vp/2 + vq/4;
            vq = vq/4;
            vr =vr - vp - vq/4;
            vn =vn;
            vh=vq/4 + vp;
        } 
        else if (vr - vh + 1<=0)  
        {
           vp= vp/2;
           vq = vq/4;
           vr =vr;
           vn =vn;
           vh=vq/4 + vp;   
        } 
  }
  // post-condition
  assert( vq<=2);
}
