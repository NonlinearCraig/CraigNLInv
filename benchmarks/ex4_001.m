% a0+a1*x1+a2*x1^2
% 0.323627 
% 1 iteration solution is found. lambda is -0.0000000208 
% 2.43728531901+0.136308166416*x1-1.42099401323*x1^2

% a0+a1*x1-x1^2
% 0.316163
% 1 iteration solution is found. lambda is -0.0000000128 
% 1.85564504638+0.0678863082122*x1-x1^2
    
sdpvar x1;
xvars = [x1];

% pre-conditions
%conjunction shall written in one cell
%disjunction shall written in different cell;
pre_ineq = (x1+1)*(1-x1);
prelist={pre_ineq};

% neg_post-condtion
neg_post_ineq = [(3-x1)*(5-x1)];
negpostlist={neg_post_ineq};
d_neg=2;

%loop condition
loop_cond_ineq= [(x1+3)*(3-x1)];
looplist={loop_cond_ineq};
%loop
% y1=x1^2+x2-1;
% y2=x2+y1*x2+1;
% y=[y1,y2];
p_x=[x1-0.001*x1*(x1-2)*(x1-4)
    ];



%template free 

%to get template free h, we need to set h_degree first.
h_degree=2;
%set degree of delta(x) except the inductive condition
deltadegree=2;
%set degree of wi_xy
wi_xy_degree=2;

%a is coef of inv, inv is h(x) here
%inv is in this form:a(1)+x1*a(2)+x2*a(3)+x1^2*a(4)+x1*x2*a(5)+x2^2*a(6)
%h_x: 2*x1^2+2*x2^2
%difference is the coef

[inv,a]=polynomial(xvars,h_degree);

% sdpvar a0 a1;
% inv=a0+a1*x1-x1^2;
% 
% a=[a0;a1];
a_bound=[];

%epsilon
epsilon = 0; % tolerance for >= 

%vars definition
sdpvar y1;
y_vars=[y1];
vars=[xvars,y_vars];

%generate lambda as obj
sdpvar lambda;

h_x=inv;
h_y=replace(inv,xvars,y_vars);

