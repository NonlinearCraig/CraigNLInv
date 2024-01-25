
% example: simple
sdpvar x1 y1 r1;
xvars = [x1,y1,r1];

% pre-conditions
%conjunction shall written in one cell
%disjunction shall written in different cell;
pre_ineq = [x1(10-x1);y1(10-y1);r1(10-r1);];

prelist={pre_ineq;};

% neg_post-condtion
% neg_post_ineq1 = [-r1^2-r1+y1;x1];
% neg_post_ineq2=[r1^2-r1-y1;x1];
% 
% negpostlist={neg_post_ineq1;neg_post_ineq2};

neg_post_ineq1=[r1^2-r1-y1;r1(10-r1);x1(10-x1);y1(10-y1);];

negpostlist={neg_post_ineq1};
d_neg=degree(neg_post_ineq1);


%loop condition
loop_cond_ineq= [x1-r1];
looplist={loop_cond_ineq};
%loop
% y1=x1^2+x2-1;
% y2=x2+y1*x2+1;
% y=[y1,y2];

loop_bound=[
    x1(10-x1);
    y1(10-y1);
    r1(10-r1);
    ];
p_x=[x1-r1,
    y1,
    r1+1];

p_x=[p_x;loop_bound];
max_iter=10;



%template free 

%to get template free h, we need to set h_degree first.
h_degree=2;
%set degree of delta(x) except the inductive condition
deltadegree=2;
%set degree of wi_xy
wi_xy_degree=3;
%template with only degree specified.
%a is coef of inv, inv is h(x) here
% %inv is in this form:a(1)+x1*a(2)+x2*a(3)+x1^2*a(4)+x1*x2*a(5)+x2^2*a(6)
% % 
% 1. full
[inv,a]=polynomial(xvars,h_degree);

% 3.inv ='a1*x1+a2*x2+a2*x3+a4*x3**2+0.1
% sdpvar a1 a2 a3 a4;
% a=[a1;a2;a3;a4];
% inv=a1*x1+a2*r1^2+a3*r1+a4*y1;

%epsilon
epsilon = 1e-8; % tolerance for >= 

%vars definition
sdpvar x2 y2 r2;
y_vars=[x2,y2,r2];
vars=[xvars,y_vars];

%generate lambda as obj
sdpvar lambda;

h_x=inv;
h_y=replace(inv,xvars,y_vars);











