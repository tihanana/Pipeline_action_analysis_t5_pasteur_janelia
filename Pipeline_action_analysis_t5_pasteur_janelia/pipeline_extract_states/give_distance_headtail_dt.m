function trx = give_distance_headtail_dt(trx)

n_trx = length(trx);
n_smooth = 10;

for i = 1 : n_trx
    
    head_tail_x             = trx(i).x_head_tail;
    head_tail_y             = trx(i).y_head_tail;
    
    head_tail_x_loc         = head_tail_x(:,1);
    head_tail_y_loc         = head_tail_y(:,1);
    
    xx1                      = gaussian_deriv_smooth_choreography(head_tail_x_loc, n_smooth);
    yy1                      = gaussian_deriv_smooth_choreography(head_tail_y_loc, n_smooth);
    
    d1                       = sqrt(xx1.^2 + yy1.^2);
    
    head_tail_x_loc         = head_tail_x(:,2);
    head_tail_y_loc         = head_tail_y(:,2);
    
    xx2                      = gaussian_deriv_smooth_choreography(head_tail_x_loc, n_smooth);
    yy2                      = gaussian_deriv_smooth_choreography(head_tail_y_loc, n_smooth);
    
    d2                       = sqrt(xx2.^2 + yy2.^2);
    
    trx(i).d_head_tail_1    = d1;
    trx(i).d_head_tail_2    = d2;   
    
    
    
    
    
    
    
end




end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%