int main(){
  // variable declarations
  int d,s,e,i;
  //precondition
  assume(d==0);
  assume(s==0);
  assume(e==0);
  assume(i>=1);
  // loop body
  while(unknown()){
        if ((i>=1)&&(d<=0)&&(s<=0)&&(e<=0)){
            e = e + 1;
            i = i - 1;
        } 
        else if ((i>=1)&&(d>=1))
        {
            d = d - 1;
            s = s + 2;
            i = i - 1;
        }        
        else if ((i>=1)&&(s>=1))
        {
             s = s + e + 1;
             e = 0;
             i = i - 1;
         }
         else if ((i>=1)&&(e>=1))
         {
            s = s + e + 1;
            e = 0;
             i = i - 1;    
         }
         else if (e>=1)
         {
             d = d + 1;
             e = e - 1;
         }
         else if (s>=1)
         {
             d = d + 1;
             s = 0;
             i = i + s - 1;
         }
        else if (d>=1)
        {
             d = d - 1;
             i = i + 1;
         }
         else if (s>=1)
        {
             s = s - 1;
             i = i + 1;
        }
        else
        {
            e = e - 1;
            i = i + 1;
        }
  }
    assert(1>=0);
}
