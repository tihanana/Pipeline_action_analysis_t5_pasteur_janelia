function trx = give_S_derivatives(trx)

n_trx       = length(trx);
n_smooth    = 5;
nn          = [5, 10 , 25 , 50 , 100 , 200 ];

for j = 1 : length(nn)
    nn_loc     = nn(j);
    nn_loc_num = num2str(nn_loc);
    for i = 1 : n_trx

        t             = trx(i).t;
        dt            = t(2:end) - t(1:end-1);
        dt            = [dt(1); dt];
        S             = trx(i).S;
        dS            = pure_derivative_choreography(S);
        dS            = dS./dt;
        dS            = gaussian_smooth_choreography(dS,nn_loc);

        trx(i).(['pure_deriv_S_' nn_loc_num])     = dS;
        
        dS            = abs(dS);
        trx(i).(['pure_deriv_S_norm_' nn_loc_num]) = dS;
 
    end

end










end