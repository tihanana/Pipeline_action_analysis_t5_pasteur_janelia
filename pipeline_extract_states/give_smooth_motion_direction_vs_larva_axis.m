function trx = give_smooth_motion_direction_vs_larva_axis(trx)


n_trx                = length(trx);
nn_path              = [5,10,25,50];
nn_head_tail         = [1,5,10,25,50];
nn_path_length       = length(nn_path);
nn_head_tail_length  = length(nn_head_tail);

for j = 1 : nn_path_length
   nn_path_num{j} = num2str(nn_path(j));
end

for j = 1 : nn_head_tail_length
   nn_head_tail_num{j} = num2str(nn_head_tail(j));
end

name     = 'axis_direction';

for jj = 1 : nn_path_length
    n_smooth_1 = nn_path(jj);
    n_smooth_1_num = nn_path_num{jj};
    for kk = 1 : nn_head_tail_length
        n_smooth_2     = nn_head_tail(kk);
        n_smooth_2_num = nn_head_tail_num{kk};
        for i = 1 : n_trx

           center_x      = trx(i).x_center;
           center_y      = trx(i).y_center;

           head_x        = trx(i).x_head;
           head_y        = trx(i).y_head;
           
           neck_down_x   = trx(i).x_neck_down;
           neck_down_y   = trx(i).y_neck_down;

           tail_x        = trx(i).x_tail;
           tail_y        = trx(i).y_tail;
            
           
           deriv_path_x        = gaussian_deriv_smooth_choreography(center_x, n_smooth_1);
           deriv_path_y        = gaussian_deriv_smooth_choreography(center_y, n_smooth_1);
           
           v                   = [deriv_path_x, deriv_path_y];
           v                   = bsxfun(@rdivide, v, sqrt(sum(v.^2,2)) ) ;

           if (n_smooth_2 ~=1)
               head_x              = gaussian_smooth_choreography(head_x, n_smooth_2);
               head_y              = gaussian_smooth_choreography(head_y, n_smooth_2);
                
               neck_down_x         = gaussian_smooth_choreography(neck_down_x, n_smooth_2);
               neck_down_y         = gaussian_smooth_choreography(neck_down_y, n_smooth_2);
               
               tail_x              = gaussian_smooth_choreography(tail_x, n_smooth_2);
               tail_y              = gaussian_smooth_choreography(tail_y, n_smooth_2);
           end
           
           u                   = [neck_down_x(:) - tail_x(:),neck_down_y(:) - tail_y(:) ];   
           u                   = bsxfun(@rdivide, u, sqrt(sum(u.^2,2)) ) ;


           trx(i).([name '_' n_smooth_1_num '_' n_smooth_2_num])(:,1) = sum(u.*v,2);

            clear u v head_x head_y deriv_path_x deriv_path_y;
            clear deriv_path_x deriv_path_y center_x  center_y;
        end
        
    end
    
end



end