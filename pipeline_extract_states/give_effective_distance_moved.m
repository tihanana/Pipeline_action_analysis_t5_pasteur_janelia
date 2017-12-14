function trx = give_effective_distance_moved(trx)

n_trx      = length(trx);
n_smooth   = [5,10,20,50];
n_smooth_2 = [1,5,10,20,50];


nn       = length(n_smooth);
for j = 1 : nn
n_smooth_num{j} = num2str(n_smooth(j));
end

nn2       = length(n_smooth_2);
for j = 1 : nn2
n_smooth_2_num{j} = num2str(n_smooth_2(j));
end


for j = 1 : nn
   n_smooth_loc = n_smooth(j); 
   for k = 1 : nn2
       n_smooth_2_loc = n_smooth_2(k);
        for i = 1 : n_trx

           t                     = trx(i).t;
           dt                    = t(2:end) - t(1:end-1);
           dt                    = mean(dt);

           tail_x                = trx(i).x_tail;
           tail_y                = trx(i).y_tail;

           deriv_path_x          = gaussian_deriv_smooth_choreography(tail_x, n_smooth_loc)*dt;
           deriv_path_y          = gaussian_deriv_smooth_choreography(tail_y, n_smooth_loc)*dt;
           
           d_eff                 = sqrt(deriv_path_x.^2 + deriv_path_y.^2);
           d_eff                 = gaussian_smooth_choreography(d_eff,n_smooth_2_loc);
           
           trx(i).(['d_eff_' n_smooth_num{j} '_' n_smooth_2_num{k}])        = d_eff;

           clearvars -except trx i n_trx n_smooth n_smooth_loc n_smooth_num j n_smooth_2 n_smooth_2_loc n_smooth_2_num k nn2;
        end
    end
end


end