
% template:a0+a1*x1+a2*x2+a3*x1^2
% 0.876358
% 2 iteration solution is found. lambda is -0.0000000039 
% 2.70634661483+4.76928266268*x1-0.470674616918*x2-4.00052741281*x1^2

sdpvar x1 x2;
xvars=[x1,x2];

% pre-conditions
%conjunction shall written in one cell
%disjunction shall written in different cell;
pre_ineq1 = [-x1^2;-x2^2;x1*(10-x1);x2*(10-x2)];

prelist={pre_ineq1};

% neg_post-condtion

neg_post_ineq1 = [2.5*x1^2+4*x1-x2;x1*(10-x1);x2*(10-x2);];
neg_post_ineq2 = [x2-3.5*x1^2-3*x1;x1*(10-x1);x2*(10-x2);];
negpostlist={neg_post_ineq1;neg_post_ineq2;};
d_neg=2;

% % post-condtion
% post_cond_ineq = [2.5*x1^2+4*x1-x2, x2-3.5*x1^2-3*x1];


%loop condition

loop_cond_ineq= [5-x1];
looplist={loop_cond_ineq};



%loop_bound
loop_bound=[x1*(10-x1),
x2*(10-x2)];

%loop
% y1=x1^2+x2-1;
% y2=x2+y1*x2+1;
% y=[y1,y2];
p_x=[x1 + 1,
    x2 + 5.5*x1 + 5.5,
    ];


p_x=[p_x;loop_bound;];

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

% sdpvar a1 a2 a3 a4
% inv=a1+a2*x1+a3*x2+a4*x1^2;
% a=[a1;a2;a3;a4;];

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
