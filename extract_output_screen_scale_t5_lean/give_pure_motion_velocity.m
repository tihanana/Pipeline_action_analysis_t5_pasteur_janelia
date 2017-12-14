function trx = give_pure_motion_velocity(trx)

n_trx    = length(trx);
n_smooth = 5;
nn          = [5, 10 , 25 , 50 , 100 , 200 ];

for j = 1 : length(nn)
    nn_loc     = nn(j);
    nn_loc_num = num2str(nn_loc);
    for i = 1 : n_trx

        t             = trx(i).t;
        dt            = t(2:end) - t(1:end-1);
        dt            = [dt(1); dt];

        head_x        = trx(i).x_head;
        head_y        = trx(i).y_head;

        tail_x        = trx(i).x_tail;
        tail_y        = trx(i).y_tail;

        center_x      = trx(i).x_center;
        center_y      = trx(i).y_center;

       
        deriv_path_x        = pure_derivative_choreography(center_x);
        deriv_path_x        = gaussian_smooth_choreography(deriv_path_x, n_smooth);
        deriv_path_y        = pure_derivative_choreography(center_y);
        deriv_path_y        = gaussian_smooth_choreography(deriv_path_y, n_smooth);
        deriv2_path_x        = pure_derivative_choreography(deriv_path_x);
        deriv2_path_x        = gaussian_smooth_choreography(deriv2_path_x , n_smooth);
        deriv2_path_y        = pure_derivative_choreography(deriv_path_y);
        deriv2_path_y        = gaussian_smooth_choreography(deriv2_path_y , n_smooth);
        
        motion_velocity     = sqrt(deriv_path_x.^2 + deriv_path_y.^2)./dt;
        motion_acceleration = sqrt(deriv2_path_x.^2 + deriv2_path_y.^2)./dt.^2 ;

        motion_velocity     = gaussian_smooth_choreography(motion_velocity, nn_loc);
        motion_acceleration = gaussian_smooth_choreography(motion_acceleration, nn_loc);


        trx(i).(['pure_motion_velocity_' nn_loc_num])     = motion_velocity;
        trx(i).(['pure_motion_acceleration_' nn_loc_num]) = motion_acceleration;
        
 
    end

end










end