% template2 :0.173091 iter 0 
% 2.65851915747-2.69719496218*x1^2-2.69719497708*x2^2

sdpvar x1 x2;   
xvars=[x1,x2];
x_bound=[5-x1,5+x1,5+x2,5-x2];

% pre-conditions
%conjunction shall written in one cell
%disjunction shall written in different cell;
pre_ineq = [(x1-0.5)*(0.7-x1),(x2-0.5)*(0.7-x2)];
prelist={pre_ineq};

% neg_post-condtion
neg_post_ineq = [x1^2+x2^2-0.36];
negpostlist={neg_post_ineq};
d_neg=2;
% % post-condtion
% post_cond_ineq = [2.5*x1^2+4*x1-x2, x2-3.5*x1^2-3*x1];


%loop condition
loop_cond_ineq= [1-x1^2-x2^2];
looplist={loop_cond_ineq};

%loop
% y1=x1^2+x2-1;
% y2=x2+y1*x2+1;
% y=[y1,y2];




p_x=[0.5*x1^3+ 0.4*x2^2;
    -0.6*x1^2+0.3*x2^2;
    ];


%template free 

%to get template free h, we need to set h_degree first.
h_degree=2;
%set degree of delta(x) except the inductive condition
wi_deg=2;
%set degree of polynomials for p_i(x)
wp_deg=2;


epsilon=1e-6;
%a is coef of inv, inv is h(x) here
%inv is in this form:a(1)+x1*a(2)+x2*a(3)+x1^2*a(4)+x1*x2*a(5)+x2^2*a(6)
%h_x: 2*x1^2+2*x2^2
%difference is the coef

%template 2
inv=a0+a1*x1^2+a2*x2^2;
a=[a0,a1,a2];
a_bound=[];

%vars definition
sdpvar y1 y2;
y_vars=[y1 y2];
vars=[xvars,y_vars];

%generate lambda as obj
sdpvar lambda;

h_x=inv;
h_y=replace(inv,xvars,y_vars);



