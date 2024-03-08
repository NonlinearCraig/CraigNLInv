yalmip('clear');
clear;
tic;
% Read benchmark
% ex1;
% ex2;
% ex3;
% ex4;
% ex4_001;
% cav13_1;
% cav13_2;
% cohencu; 
% unicycle;
circuit;   




% epsilon = 0;
max_iter=20;
% initial h0 to get p_val(initial coef of h)
% a denotes coefficient of inv.
%sdp_var use coefficient as vars

sdp_cons=sdp_cons_init();
sdp_cons{1}=xvars;
sdp_cons{2}=[a];
% pre cond
for i=1:length(prelist)
    sdp_cons = SOSnew(prelist{i},inv,sdp_cons,0,deltadegree);
end
%post with -loopcond
for i=1:length(negpostlist)
   sdp_cons = SOSnew([negpostlist{i};-loop_cond_ineq], -inv, sdp_cons, epsilon,deltadegree);
end  


sdp_cons{1}=vars;

% sdp_cons = {vars, sdp_var, constraints, delta_cell, delta_coef_cell, tail,wh_xy_coef};
sdp_cons=Loop(h_y,p_x,[h_x,loop_cond_ineq],1,0,sdp_cons,y_vars,deltadegree,wi_xy_degree);

%solve constraint
sdp_var = sdp_cons{2};
constraints = sdp_cons{3};
% constraints=[constraints;a_bound];

[WG_model,recoverymodel,diagnostic,internalmodel] = export(constraints,0,sdpsettings('solver','penbmi'),[],[],1);
bmi=yalmip2bmi(WG_model);
penm = bmi_define(bmi);
prob = penlab(penm);
solve(prob);
prob.x

toc;

%the universal function
%convert degree to even
function even_d=even_degree(degree)
    if even(degree)==1
        even_d=degree;
    else
        even_d=degree+1;
    end
end

%encode precondition and post condition
function sdp_cons = SOSnew(pre_list,inv,sdp_cons, epsilon, deltadegree)
    vars = sdp_cons{1};
    sdp_var = sdp_cons{2};
    constraints = sdp_cons{3};
    delta_cell  = sdp_cons{4}; 
    delta_coef_cell = sdp_cons{5};
    tail = sdp_cons{6};
    sum = 0;
    for i = 1:length(pre_list)
        %delta_cell{tail} : a set of polynomials.
        %delta_coef_cell{tail} coefficient assembled together.  
        [delta_cell{tail}, delta_coef_cell{tail}] = polynomial(vars, deltadegree);    
        sum = sum + delta_cell{tail} * pre_list(i);
        constraints = [constraints, delta_cell{tail}>=0];
        sdp_var = [sdp_var; delta_coef_cell{tail}];
        tail = tail + 1;
    end
    % generate h-epsilon-sigma(delat(x)f(x))
    % constraints = [constraints, sos( inv - sum -epsilon)];
    constraints = [constraints, inv - sum -0>=0];
    sdp_cons = {vars, sdp_var, constraints, delta_cell, delta_coef_cell, tail};
end


%the function used for iteration

%generate p_val(real_value)* monolist
function h_t=generate_h(p,vars,h_degree)
    monolist_h=monolist(vars,h_degree);
    h_t=dot(p,monolist_h);
end



%translate loop condition in iteration 1;
%the first parameter of square_list must be ht_x)
function sdp_cons = Loop(ht_y,p_x,square_list,t_xy,lambda,sdp_cons,y_vars,deltadegree,wi_xy_degree)
    vars = sdp_cons{1};
    sdp_var = sdp_cons{2};
    constraints = sdp_cons{3};
    delta_cell  = sdp_cons{4}; 
    delta_coef_cell = sdp_cons{5};
    tail = sdp_cons{6};
    sum = 0;
    %compute w_h(x,y)h_t(x)+w_c(x,y)c(x)
    for i = 1:length(square_list)
        %delta_cell{tail} : a set of polynomials.
        %delta_coef_cell{tail} coefficient assembled together.  
        [delta_cell{tail}, delta_coef_cell{tail}] = polynomial(vars,deltadegree);    
        sum = sum + delta_cell{tail} * square_list(i);
        constraints = [constraints, delta_cell{tail}>=0;];
        sdp_var = [sdp_var; delta_coef_cell{tail}];
        % square list is like[h(x),p(x)], when i=1, save the coef.
        if i==1
            wh_xy_coef=delta_coef_cell{tail};
        end
        tail = tail + 1;
    end
    %compute sigma(w_i(x,y)(y_i-p_i(x))
    p_len=length(p_x);
    y_len=length(y_vars);
    if(p_len==y_len)
        for i = 1:y_len
            %delta_cell{tail} : a set of polynomials.
            %delta_coef_cell{tail} coefficient assembled together.  
            [delta_cell{tail}, delta_coef_cell{tail}] = polynomial(vars,wi_xy_degree);    
            sum = sum + delta_cell{tail} * (y_vars(i)-p_x(i));
            sdp_var = [sdp_var; delta_coef_cell{tail}];
            tail = tail + 1;
        end
    else
    % if p_len>y_len, it indicates that there exists variable bound.
    %encode variable bound.
        for i = 1:y_len
            %delta_cell{tail} : a set of polynomials.
            %delta_coef_cell{tail} coefficient assembled together.  
            [delta_cell{tail}, delta_coef_cell{tail}] = polynomial(vars,wi_xy_degree);    
            sum = sum + delta_cell{tail} * (y_vars(i)-p_x(i));
            sdp_var = [sdp_var; delta_coef_cell{tail}];
            tail = tail + 1;
        end
        
        for i= y_len+1:p_len
            [delta_cell{tail}, delta_coef_cell{tail}] = polynomial(vars,wi_xy_degree);
            sum = sum + delta_cell{tail} * (p_x(i));
            sdp_var = [sdp_var; delta_coef_cell{tail}];
            tail=tail+1;
        end
    end
    constraints = [constraints, ht_y - sum +lambda*t_xy>=0];
    % constraints=[constraints,lambda>=-1];
    sdp_cons = {vars, sdp_var, constraints, delta_cell, delta_coef_cell, tail,wh_xy_coef};
end



function sdp_con=sdp_cons_init()
    sdp_var = [];
    constraints = [];
    delta_cell = {};
    delta_coef_cell = {};
    tail = 1;
    vars=[];
    sdp_con= {vars, sdp_var, constraints, delta_cell, delta_coef_cell, tail};
end
 