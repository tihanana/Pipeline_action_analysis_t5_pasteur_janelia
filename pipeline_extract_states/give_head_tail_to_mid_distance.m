function [trx] = give_head_tail_to_mid_distance(trx)


n_trx = length(trx);
nn    = 40;

for i = 1 : n_trx
    
    head_tail_x             = trx(i).x_head_tail;
    head_tail_y             = trx(i).y_head_tail;
    
    center_x                = trx(i).x_center;
    center_y                = trx(i).y_center;
    
    
    head_tail_x_loc         = head_tail_x(:,1);
    head_tail_y_loc         = head_tail_y(:,1);
    
    d1                      = sqrt(  (head_tail_x_loc - center_x).^2  +  (head_tail_y_loc - center_y).^2 );
    
    head_tail_x_loc         = head_tail_x(:,2);
    head_tail_y_loc         = head_tail_y(:,2);
    
    d2                      = sqrt(  (head_tail_x_loc - center_x).^2  +  (head_tail_y_loc - center_y).^2 );
    
    
    d1                      = gaussian_smooth_choreography(d1,nn);
    d2                      = gaussian_smooth_choreography(d2,nn);
    
    dd_head_tail_mid(:,1)        = d1 - d2;
    dd_head_tail_mid(:,2)        = -dd_head_tail_mid(:,1) ;
    
    
        
    trx(i).d_head_tail_mid(:,1)    = d1;
    trx(i).d_head_tail_mid(:,2)    = d2;
    trx(i).dd_head_tail_mid        = dd_head_tail_mid;
   
    
    clear d1 d2 dd_head_tail_mid ;
    
end


end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

