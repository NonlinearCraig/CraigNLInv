%ex2
% with template a0+a1*x1+a2*x2+a3*x1*x2+a4*x1^2+a5*x2^2
%1.023448s
%2 iteration solution is found. lambda is -0.0000000040 
% 6.19099959705-1.61172483667*x2-0.188849529794*x1^2-2.93437729894*x2^2

% 1 iteration solution is found. lambda is -0.0000000226 
% 0.453975s
% with template a0+a1*x1^2+a2*x2^2
% 1+0.269406630939*x1^2-0.617905967972*x2^2

sdpvar x1 x2;
xvars=[x1,x2];

% pre-conditions
%conjunction shall written in one cell
%disjunction shall written in different cell;
%if you want to add bound for x, add them in all cells;
pre_ineq = [1-x1^2-x2^2;(5-x1)*(x1+5);(5-x2)*(x2+5);];
prelist={pre_ineq};

% neg_post-condtion
%conjunction shall written in one cell
%disjunction shall written in different cell;
neg_post_ineq = [0.25-x1^2-(x2-2)^2;(5-x1)*(x1+5);(5-x2)*(x2+5);];
negpostlist={neg_post_ineq};
d_neg=2;
% post-condtion


%loop condition
loop_cond_ineq= [1-x1^2-x2^2];
looplist={loop_cond_ineq};

%loop
% y1=x1^2+x2-1;
% y2=x2+y1*x2+1;
% y=[y1,y2];
p_x=[0.9*(x1-0.01*x2); 
    0.9*(x2+0.01*x1);
    (5-x1)*(x1+5);
    (5-x2)*(x2+5);
    ];


%template free 

%to get template free h, we need to set h_degree first.
h_degree=2;
%set degree of delta(x) except the inductive condition
deltadegree=2;
%set degree of wi_xy
wi_xy_degree=2;

epsilon=1e-6;


% a=[a1,a2,a3];
% inv=x1^2 + a1*x2^2 + a2*x2 + a3;
% sdpvar a1 a2;
% inv=a1*x1^2 + a2*x2^2 +1;
% a=[a1;a2];
[inv,a]=polynomial(xvars,h_degree);
%a_bound.(optional) 
a_bound=[];
%epsilon
epsilon = 0; % tolerance for >= 

%vars definition
sdpvar y1 y2;
y_vars=[y1 y2];
vars=[xvars,y_vars];

%generate lambda as obj
sdpvar lambda;

h_x=inv;
h_y=replace(inv,xvars,y_vars);