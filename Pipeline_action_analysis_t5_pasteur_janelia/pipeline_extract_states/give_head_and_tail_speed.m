function trx = give_head_and_tail_speed(trx)

nn    = 40;
for i = 1 : length(trx)

    head_tail_x     = trx(i).x_head_tail;
    head_tail_y     = trx(i).y_head_tail;
    
    center_x        = trx(i).x_center;
    center_y        = trx(i).y_center;
    
    x1              = head_tail_x(:,1) - center_x;
    x2              = head_tail_x(:,2) - center_x;
    
    y1              = head_tail_y(:,1) - center_y;
    y2              = head_tail_y(:,2) - center_y;
    
    dx1             = gaussian_deriv_smooth_choreography(x1, nn);
    dx2             = gaussian_deriv_smooth_choreography(x2, nn);
    
    dy1             = gaussian_deriv_smooth_choreography(y1, nn);
    dy2             = gaussian_deriv_smooth_choreography(y2, nn);
    
    
    speed_head_tail(:,1)     = dx1.^2 + dy1.^2 ;
    speed_head_tail(:,2)     = dx2.^2 + dy2.^2 ;
    
    d_speed_head_tail(:,1)   = speed_head_tail(:,1) - speed_head_tail(:,2);
    d_speed_head_tail(:,2)   = - d_speed_head_tail(:,1);
        
    trx(i).speed_head_tail   = speed_head_tail;
    trx(i).d_speed_head_tail = d_speed_head_tail;
    
    deriv_path_x(:,1)             = gaussian_deriv_smooth_choreography(head_tail_x(:,1), nn);
    deriv_path_x(:,2)             = gaussian_deriv_smooth_choreography(head_tail_x(:,2), nn);
    
    deriv_path_y(:,1)             = gaussian_deriv_smooth_choreography(head_tail_y(:,1), nn);
    deriv_path_y(:,2)             = gaussian_deriv_smooth_choreography(head_tail_y(:,2), nn);
    
    deriv2_path_x(:,1)             = gaussian_deriv_smooth_choreography(deriv_path_x(:,1), nn);
    deriv2_path_x(:,2)             = gaussian_deriv_smooth_choreography(deriv_path_x(:,2), nn);
    
    deriv2_path_y(:,1)             = gaussian_deriv_smooth_choreography(deriv_path_y(:,1), nn);
    deriv2_path_y(:,2)             = gaussian_deriv_smooth_choreography(deriv_path_y(:,2), nn);
    
    trx(i).absolute_speed_head_tail        = sqrt(deriv_path_x.^2 + deriv_path_y.^2 );
    trx(i).absolute_acceleration_head_tail = sqrt(deriv2_path_x.^2 + deriv2_path_y.^2 );
    
    trx(i).d_absolute_speed_head_tail(:,1) = trx(i).absolute_speed_head_tail(:,1) - trx(i).absolute_speed_head_tail(:,2);
    trx(i).d_absolute_speed_head_tail(:,2) = - trx(i).d_absolute_speed_head_tail(:,1);
    
    trx(i).d_absolute_acceleration_head_tail(:,1) = trx(i).absolute_acceleration_head_tail(:,1) - trx(i).absolute_acceleration_head_tail(:,2);
    trx(i).d_absolute_acceleration_head_tail(:,2) = - trx(i).d_absolute_acceleration_head_tail(:,1);
    
    trx(i).d_absolute_speed_head_tail             = tanh( trx(i).d_absolute_speed_head_tail./0.1          );
    trx(i).d_absolute_acceleration_head_tail      = tanh( trx(i).d_absolute_acceleration_head_tail./0.01  );
    
    
    
    clear speed_head_tail x1 y1 x2 y2 dx1 dx2 dy1 dy2  d_speed_head_tail deriv_path_x deriv_path_y;
    clear deriv2_path_x deriv2_path_y;
    
end






end