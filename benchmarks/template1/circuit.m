% 0 iteration solution is found. lambda is -0.0000000008 
% 0.170706 seconds。
% 9.19404243977+3.50562875136*x1+3.75616204762*x2-1.11709759664*x1^2-2.36128330376*x2^2+1.0024864632*x1*x2
sdpvar x1 x2;
xvars=[x1,x2];
x_bound=[10-x1,10-x2,10+x1,10+x2];

% pre-conditions
%conjunction shall written in one cell
%disjunction shall written in different cell;
pre_ineq = [0.625-(x1-0.5)^2-(x2-0.5)^2];
prelist={pre_ineq};

% neg_post-condtion
neg_post_ineq = [x2^2 - 4];
negpostlist={neg_post_ineq};
d_neg=2;
% % post-condtion
% post_cond_ineq = [2.5*x1^2+4*x1-x2, x2-3.5*x1^2-3*x1];


%loop condition
loop_cond_ineq= [1];
looplist={loop_cond_ineq};

%loop
% y1=x1^2+x2-1;
% y2=x2+y1*x2+1;
% y=[y1,y2];

p_x=[8/9*x1-1/18*x2; 
    0.1*x1+0.9*x2; 
    ];




%template free 

%to get template free h, we need to set h_degree first.
h_degree=2;
%set degree of delta(x) except the inductive condition
wi_deg=2;
%set degree of polynomials for p_i(x)
wp_deg=2;



epsilon=1e-8;


% template1
[inv,a,c]=polynomial([x1,x2],h_degree);
a_bound=[];

%vars definition
sdpvar y1 y2;
y_vars=[y1 y2];
vars=[xvars,y_vars];

%generate lambda as obj
sdpvar lambda;

h_x=inv;
h_y=replace(inv,xvars,y_vars);
