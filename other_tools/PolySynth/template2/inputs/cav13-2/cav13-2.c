real x1,x2,y1,y2;

@pre(((2-(x1*x1))-(x2*x2))>=0);
  while(((3-(x1*x1))-(x2*x2))>=0,(([(x1,x2),2])>=0)){
       y1=(((x1*x1)+x2)-1);
       y2=((x2+((((x1*2)+x2)-1)*x2))+1);
       x1=y1;
       x2=y2;
    }
@post((( ((-1)*x2) + ((0.2*x1)*x1)) - 1.21 )<= 0);

