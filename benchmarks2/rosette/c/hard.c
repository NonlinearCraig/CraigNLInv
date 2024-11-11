real N, D, r, ds, p, q;
@pre((((((N>=0) and (D>=1)) and (r==N)) and(D==ds)) and (r<=(ds-1))));
p=1;
q=0;
while((2 - p)<=0,([(N, D, r, ds, p, q),1]>=0)){
        if(r>=ds){
            N =N;
            D = D;
            r = (r - (ds*0.5));
            ds = (ds*0.5);
            p =(p*0.5);
            q =(q + (p*0.5));
        } 
        if(r<=(ds-1)) 
        {
            N =N;
            D = D;
            r = r;
            ds = (ds*0.5);
            p =(p*0.5); 
            q =q;      
        } 
        else{
         N =N;
         D = D;
         r = r;
         ds=ds;
         p = p;
         q=q;    
        }
  }

@post( r>=0);

