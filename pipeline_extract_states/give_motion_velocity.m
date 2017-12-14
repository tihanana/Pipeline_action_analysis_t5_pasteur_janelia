function trx = give_motion_velocity(trx)

n_trx = length(trx);
n_smooth = 40;

for i = 1 : n_trx
    
    t             = trx(i).t;
    dt            = t(2:end) - t(1:end-1);
    dt            = [dt(1); dt];
    
    center_x      = trx(i).x_center;
    center_y      = trx(i).y_center;
   
    deriv_path_x        = gaussian_deriv_smooth_choreography(center_x, n_smooth);
    deriv_path_y        = gaussian_deriv_smooth_choreography(center_y, n_smooth);
   
    trx(i).motion_velocity = sqrt(deriv_path_x.^2 + deriv_path_y.^2)./dt ;
    
    deriv2_path_x        = gaussian_deriv_smooth_choreography(deriv_path_x, n_smooth);
    deriv2_path_y        = gaussian_deriv_smooth_choreography(deriv_path_y, n_smooth);
   
    trx(i).motion_acceleration = sqrt(deriv2_path_x.^2 + deriv2_path_y.^2)./dt ;
   
end




end