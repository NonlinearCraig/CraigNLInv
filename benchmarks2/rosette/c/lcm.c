real a,b,c,x,y,u,v;
@pre(((a>=0) and (b>=0)));
x = a;
y = b;
u = b;
v = 0;
c = (a*b);
while(1>=0,([(a,b,x,y,u,v,c),1]>=0))
{
    if((x>=y))
    {
        x = (x-y);
        //x = [(x,y),1];
        v = (v+u);
    }
    else
    {
        y = (y-x);
        u = (u+v);
        //u = [(u,v),1];
    }
}
@post(1>=0);


// int lcm (int a, int b)
// pre( a>0 && b>0 ); 
//     {
//     int x,y,u,v;

//     x=a;
//     y=b;
//     u=b;
//     v=0;

//     inv( GCD(x,y) == GCD(a,b) && x*u + y*v == a*b );
//     while(x!=y) 
//         { 

//         inv( GCD(x,y) == GCD(a,b) && x*u + y*v == a*b ); 
//         while (x>y)
//             {
//             x=x-y;
//             v=v+u;
//             }

//         inv( GCD(x,y) == GCD(a,b) && x*u + y*v == a*b );
//         while (x<y)
//             {
//             y=y-x;
//             u=u+v;
//             }
//         }
//     return u+v;
//     }
// post( result == LCM(a,b) );