real x1,x2,y1,y2;
@pre( ((x1==0) and (x2==0)) );

  while( ((((5-x1)>=0) and ((x1*(10-x1))>=0)) and ((x2*(10-x2))>=0)),(([(x1,x2),2])>=0)) {
       y1=(x1 + 1);
       y2=((x2 + (5.5*x1)) + 5.5);
       x1=y1;
       x2=y2;
    }
@post ( ((((((2.5*x1)*x1)+(4*x1))-x2)<=0) and (((x2-((3.5*x1)*x1))-(3*x1))<=0)));

