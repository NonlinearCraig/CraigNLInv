% template1 :0.504234 second iter 1
% "-5.28312606349+7.57631602672*x1+11.6176204645*x2-3.76504688024*x1^2-2.55008771002*x2^2-1.88398846998*x1*x2"


% template2 :0.490700 second 1iter "-1+x1+a1*x2+a2*x1^2+a3*x2^2"
% iteration 1 -1+0.6270503287*x1+2.08088447703*x2-0.446562597584*x1^2-0.436896016503*x2^2

sdpvar x1 x2;   
xvars=[x1,x2];
x_bound=[10+x1,10-x1,10+x2,10-x2];

% pre-conditions
%conjunction shall written in one cell
%disjunction shall written in different cell;
pre_ineq = [1-x1^2-(x2 -3)^2];
prelist={pre_ineq};

% neg_post-condtion
neg_post_ineq = [(x1-2)^2+(x2-2)^2-9];
negpostlist={neg_post_ineq};
d_neg=2;
% % post-condtion
% post_cond_ineq = [2.5*x1^2+4*x1-x2, x2-3.5*x1^2-3*x1];
    

%loop condition
loop_cond_ineq= [4-x1^2-(x2 -3)^2];
looplist={loop_cond_ineq};

%loop
% y1=x1^2+x2-1;
% y2=x2+y1*x2+1;
% y=[y1,y2];



p_x=[(x2-x1)*0.1+x1;
    0.9*x2;
    ];


%template free 

%to get template free h, we need to set h_degree first.
h_degree=2;
%set degree of delta(x) except the inductive condition
wi_deg=2;
%set degree of polynomials for p_i(x)
wp_deg=2;


epsilon=1e-8;
%a is coef of inv, inv is h(x) here

% %template 1
[inv,a]=polynomial(xvars,h_degree);
a_bound=[];


% vars definition                                                                                                                                                                                                        
sdpvar y1 y2;
y_vars=[y1 y2];
vars=[xvars,y_vars];

%generate lambda as obj
sdpvar lambda;

h_x=inv;
h_y=replace(inv,xvars,y_vars);



