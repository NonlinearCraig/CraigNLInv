real x1;
@pre(((x1+1)*(3-x1))>=0);

  while((((x1+2)*(3.5-x1))>=0),(([(x1),2])>=0)){
       x1=(x1-(0.001*(x1*((x1-2)*(x1-4)))));
  }

@post(((x1-2)*(5-x1))>=0);
