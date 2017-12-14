function trx = give_head_tail_distance_matrix(trx)

n_trx    = length(trx);
n_smooth = 5;

for i = 1 : n_trx
    
    head_tail_x             = trx(i).x_head_tail;
    head_tail_y             = trx(i).y_head_tail;
    
    head_tail_x_loc1         = head_tail_x(:,1);
    head_tail_y_loc1         = head_tail_y(:,1);
    
    head_tail_x_loc2         = head_tail_x(:,2);
    head_tail_y_loc2         = head_tail_y(:,2);
    
    
    
    ht_x_1_1                 = head_tail_x_loc1(1:end-1);
    ht_x_1_2                 = head_tail_x_loc1(2:end);
    ht_y_1_1                 = head_tail_y_loc1(1:end-1);
    ht_y_1_2                 = head_tail_y_loc1(2:end);
    
    ht_x_2_1                 = head_tail_x_loc2(1:end-1);
    ht_x_2_2                 = head_tail_x_loc2(2:end);
    ht_y_2_1                 = head_tail_y_loc2(1:end-1);
    ht_y_2_2                 = head_tail_y_loc2(2:end);
    
    d11                      = sqrt( (ht_x_1_2 - ht_x_1_1).^2 + (ht_y_1_2 -ht_y_1_1).^2  );
    d22                      = sqrt( (ht_x_2_2 - ht_x_2_1).^2 + (ht_y_2_2 -ht_y_2_1).^2  );
    d12                      = sqrt( (ht_x_2_2 - ht_x_1_1).^2 + (ht_y_2_2 -ht_y_1_1).^2  );
    d21                      = sqrt( (ht_x_1_2 - ht_x_2_1).^2 + (ht_y_1_2 -ht_y_2_1).^2  );
    
    d11                      = gaussian_smooth_choreography(d11, n_smooth);
    d22                      = gaussian_smooth_choreography(d22, n_smooth);
    d12                      = gaussian_smooth_choreography(d12, n_smooth);
    d21                      = gaussian_smooth_choreography(d21, n_smooth);
    
    nn                       = length(d11);
    HT_d_matrix              = zeros(2,2,nn);
    
    HT_d_matrix(1,1,:)       = d11;
    HT_d_matrix(2,2,:)       = d22;
    HT_d_matrix(1,2,:)       = d12;
    HT_d_matrix(2,1,:)       = d21;
    
    trx(i).HT_d_matrix       = HT_d_matrix;
    
    clear nn HT_d_matrix d11 d22 d12 d21 ht_x_1_1 ht_x_1_2 ht_x_2_1 ht_x_2_2;
    clear ht_y_1_1 ht_y_1_2 ht_y_2_1 ht_y_2_2 head_tail_x_loc1 head_tail_x_loc2;
    clear head_tail_y_loc1 head_tail_2_loc2 head_tail_x head_tail_y ;
    
end




end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%