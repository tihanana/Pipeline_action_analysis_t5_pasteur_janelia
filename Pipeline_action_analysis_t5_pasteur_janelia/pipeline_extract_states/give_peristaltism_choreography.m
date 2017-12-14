function trx = give_peristaltism_choreography(trx)


names = {'S_deriv_squared_smooth_10'    , 'eig_deriv_squared_smooth_10' , ...
         'S_deriv2_squared_smooth_10'   , 'eig_deriv2_squared_smooth_10',...
         'velocity_agitation_smooth_10' , 'velocity_agitation_deriv_squared_smooth_10' };

n_peristaltism_smooth     = [5,10,25];     
nn_peristaltism_smooth    = length(n_peristaltism_smooth) ;


n_trx   = length(trx);
n_names = length(names); 
     
for i = 1 : n_trx
    for j = 1 : n_names
        
        vecteur   = trx(i).(names{j});
        t         = trx(i).t;
        [I]       = give_local_simple_maxima(vecteur);
        [J]       = give_local_simple_minima(vecteur);
        [vec_loc] = give_vector_up_down_peristaltism(I,J,t);
        
        for k = 1 : nn_peristaltism_smooth
             vec_loc_s = gaussian_smooth_choreography(vec_loc, n_peristaltism_smooth(k));
             n_peristaltism_smooth_num = num2str(n_peristaltism_smooth(k));
             trx(i).([names{j} '_per_scale_' n_peristaltism_smooth_num]) =  vec_loc_s;   
        end
        
        
    end
end







end