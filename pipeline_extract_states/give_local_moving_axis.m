function trx = give_local_moving_axis(trx)

n_trx = length(trx);

for i = 1 : n_trx;
    
    spine_x     = trx(i).x_spine;
    spine_y     = trx(i).y_spine;
    
    u           = [spine_x(:,7)-spine_x(:,5),spine_y(:,7)-spine_y(:,5) ];
    v           = [-u(:,2), u(:,1)];
    
    u_2         = u.^2;
    u_2_sum     = sum(u_2,2);
    u           = bsxfun(@rdivide, u, u_2_sum);
    
    v_2         = v.^2;
    v_2_sum     = sum(v_2,2);
    v           = bsxfun(@rdivide, v, v_2_sum);
    
    trx(i).u    = u;
    trx(i).v    = v;

end