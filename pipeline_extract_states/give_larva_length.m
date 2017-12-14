function trx = give_larva_length(trx)

nn_deriv = 5;
nn       = [5,10,25,50];
n_nn     = length(nn);
for j = 1 : n_nn
    nn_num{j} = num2str(nn(j));
end
n_trx    = length(trx);


for i = 1 : n_trx
    
    spine_x   = trx(i).x_spine;
    spine_y   = trx(i).y_spine;

    d_spine_x = spine_x(:,2:end) - spine_x(:,1:end-1);
    d_spine_y = spine_y(:,2:end) - spine_y(:,1:end-1);
 
    d2        = sum(d_spine_x.^2 + d_spine_y.^2,2);
    d         = sqrt(d2);
    d_d       = gaussian_deriv_smooth_choreography(d,nn_deriv);
    d_d2      = d_d.^2;
    d_log_d   = d_d./d;
    
    trx(i).larva_length                = d;
    trx(i).larva_length_deriv_square   = d_d2;
    trx(i).larva_length_deriv          = d_d;
    trx(i).larva_length_log_deriv      = d_log_d;
    
    
    for j = 1 : n_nn
        d_new       = gaussian_smooth_choreography( d, nn(j));
        d_d2_new    = gaussian_smooth_choreography( d_d2, nn(j));
        d_d_new     = gaussian_smooth_choreography( d_d, nn(j));
        d_log_d_new = gaussian_smooth_choreography( d_log_d, nn(j));
        
        trx(i).(['larva_length_smooth_' nn_num{j}])              = d_new;
        trx(i).(['larva_length_deriv_square_smooth_' nn_num{j}]) = d_d2_new;
        trx(i).(['larva_length_deriv_smooth_' nn_num{j}])        = d_d_new;
        trx(i).(['larva_length_log_deriv_smooth_' nn_num{j}])    = d_log_d_new;
        
        
    end
    
    
    
    
end


end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

