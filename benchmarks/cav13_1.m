% with template a(1)+x1*a(2)+x2*a(3)+x1^2*a(4)+x1*x2*a(5)+x2^2*a(6)
%  2 iteration solution is found. lambda is -0.0000000015 
%  0.677986
% 1.31049255748+0.041620694321*x1+1.19347401606*x2-0.369332644733*x1^2-0.0707058607812*x2^2+0.0317147439324*x1*x2


% 
% 0.394792s
%  1 iteration solution is found. lambda is -0.0000000003 
% 3.60886409031-1.69839700708*x1^2-2.03873868002*x2^2
%with template:

sdpvar x1 x2;
xdim = 2;
xvars = [x1,x2];

% pre-conditions
%conjunction shall written in one cell
%disjunction shall written in different cell;
pre_ineq = [1-x1^2-x2^2];
prelist={pre_ineq};

% neg_post-condtion
neg_post_ineq = [-x2 + 0.2*x1^2 - 1];
negpostlist={neg_post_ineq};
d_neg=2;

%loop condition
loop_cond_ineq= [3-x1^2-x2^2];
looplist={loop_cond_ineq};
%loop
% y1=x1^2+x2-1;
% y2=x2+y1*x2+1;
% y=[y1,y2];
y1=x1^2+x2-1;
p_x=[x1^2+x2-1;
    x2+y1*x2+1;
    ];



%template free 

%to get template free h, we need to set h_degree first.
h_degree=2;
%set degree of delta(x) except the inductive condition
deltadegree=2;
%set degree of wi_xy
wi_xy_degree=3;

%a is coef of inv, inv is h(x) here
%inv is in this form:a(1)+x1*a(2)+x2*a(3)+x1^2*a(4)+x1*x2*a(5)+x2^2*a(6)
%h_x: 2*x1^2+2*x2^2
%difference is the coef
[inv,a]=polynomial(xvars,h_degree);
% sdpvar a0 a1 a2;
% inv=a0+a1*x1^2+a2*x2^2;
% a=[a0;a1;a2;];
a_bound=[];
%epsilon
epsilon = 0; % tolerance for >= 

%vars definition
sdpvar y1 y2;
y_vars=[y1,y2];
vars=[xvars,y_vars];

%generate lambda as obj
sdpvar lambda;

h_x=inv;
h_y=replace(inv,xvars,y_vars);
