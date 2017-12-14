function trx = give_motion_direction_vs_larva_axis(trx)


n_trx = length(trx);
n_smooth = 10;

for i = 1 : n_trx
    
   center_x      = trx(i).x_center;
   center_y      = trx(i).y_center;
   
   path_x        = gaussian_smooth_choreography(center_x, n_smooth);
   path_y        = gaussian_smooth_choreography(center_y, n_smooth);
   
   deriv_path_x        = gaussian_deriv_smooth_choreography(center_x, n_smooth);
   deriv_path_y        = gaussian_deriv_smooth_choreography(center_y, n_smooth);
   v                   = [deriv_path_x, deriv_path_y];
   v                   = bsxfun(@rdivide, v, sqrt(sum(v.^2,2)) ) ;
   
   trx(i).x_path = path_x;
   trx(i).y_path = path_y;
   
   head_tail_x   = trx(i).x_head_tail;
   head_tail_y   = trx(i).y_head_tail;
   
   head_x        = head_tail_x(:,1);
   head_y        = head_tail_y(:,1);
   
   tail_x        = head_tail_x(:,2);
   tail_y        = head_tail_y(:,2);
   
   u             = [head_x(:) - tail_x(:),head_y(:) - tail_y(:) ];   
   u             = bsxfun(@rdivide, u, sqrt(sum(u.^2,2)) ) ;

   trx(i).axis_direction(:,1) = sum(u.*v,2);
   trx(i).axis_direction(:,2) = -sum(u.*v,2);
   
   
   
    
end

end