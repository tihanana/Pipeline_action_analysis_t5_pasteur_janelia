function trx = give_motion_velocities(trx)

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

        deriv_path_x        = gaussian_deriv_smooth_choreography(center_x, n_smooth);
        deriv_path_y        = gaussian_deriv_smooth_choreography(center_y, n_smooth);
        deriv2_path_x       = gaussian_deriv_smooth_choreography(deriv_path_x, n_smooth);
        deriv2_path_y       = gaussian_deriv_smooth_choreography(deriv_path_y, n_smooth);
        motion_velocity     = sqrt(deriv_path_x.^2 + deriv_path_y.^2)./dt;
        motion_acceleration = sqrt(deriv2_path_x.^2 + deriv2_path_y.^2)./dt ;

        deriv_head_x        = gaussian_deriv_smooth_choreography(head_x, n_smooth);
        deriv_head_y        = gaussian_deriv_smooth_choreography(head_y, n_smooth);
        deriv2_head_x       = gaussian_deriv_smooth_choreography(deriv_head_x, n_smooth);
        deriv2_head_y       = gaussian_deriv_smooth_choreography(deriv_head_y, n_smooth);
        head_velocity       = sqrt(deriv_head_x.^2 + deriv_head_y.^2)./dt;
        head_acceleration   = sqrt(deriv2_head_x.^2 + deriv2_head_y.^2)./dt;

        deriv_tail_x        = gaussian_deriv_smooth_choreography(tail_x, n_smooth);
        deriv_tail_y        = gaussian_deriv_smooth_choreography(tail_y, n_smooth);
        deriv2_tail_x       = gaussian_deriv_smooth_choreography(deriv_tail_x, n_smooth);
        deriv2_tail_y       = gaussian_deriv_smooth_choreography(deriv_tail_y, n_smooth);
        tail_velocity       = sqrt(deriv_tail_x.^2 + deriv_tail_y.^2)./dt;
        tail_acceleration   = sqrt(deriv2_tail_x.^2 + deriv2_tail_y.^2)./dt;


        motion_velocity     = gaussian_smooth_choreography(motion_velocity, nn_loc);
        motion_acceleration = gaussian_smooth_choreography(motion_acceleration, nn_loc);
        head_velocity       = gaussian_smooth_choreography(head_velocity, nn_loc);
        head_acceleration   = gaussian_smooth_choreography(head_acceleration, nn_loc);
        tail_velocity       = gaussian_smooth_choreography(tail_velocity, nn_loc);
        tail_acceleration   = gaussian_smooth_choreography(tail_acceleration, nn_loc);


        trx(i).(['motion_velocity_' nn_loc_num])     = motion_velocity;
        trx(i).(['motion_acceleration_' nn_loc_num]) = motion_acceleration;
        trx(i).(['head_velocity_' nn_loc_num])       = head_velocity;
        trx(i).(['head_acceleration_' nn_loc_num])   = head_acceleration;
        trx(i).(['tail_velocity_' nn_loc_num])       = tail_velocity;
        trx(i).(['tail_acceleration_' nn_loc_num])   = tail_acceleration;
        
        
 
    end

end










end