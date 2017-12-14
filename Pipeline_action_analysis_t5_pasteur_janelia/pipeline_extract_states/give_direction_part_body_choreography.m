function trx = give_direction_part_body_choreography(trx)
%% give global direction from the down neck to the mid point

for i = 1 : length(trx)
%     fprintf('%i\n', i);
    x_neck       = trx(i).x_neck;
    y_neck       = trx(i).y_neck;
    
    x_neck_down = trx(i).x_neck_down;
    y_neck_down = trx(i).y_neck_down;
    
    u           = [x_neck(:) - x_neck_down(:),y_neck(:) - y_neck_down(:) ];   
    v           = [-u(:,2), u(:,1)];
    
    u           = bsxfun(@rdivide, u, sqrt(sum(u.^2,2)) ) ;
    v           = bsxfun(@rdivide, v, sqrt(sum(v.^2,2)) ) ;
    
    
    trx(i).u_body    = u;
    trx(i).v_body    = v;
    

end

end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%