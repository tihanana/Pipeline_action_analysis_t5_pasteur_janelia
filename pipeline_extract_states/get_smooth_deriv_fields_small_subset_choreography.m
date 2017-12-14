function trx = get_smooth_deriv_fields_small_subset_choreography(trx)



name = {'S_deriv_squared', 'eig_deriv_squared', 'velocity_agitation', ...
    'S_deriv2_squared','eig_deriv2_squared', 'velocity_agitation_deriv_squared'};

name_smooth = {'S_deriv_squared_smooth' , 'eig_deriv_squared_smooth', ...
   'velocity_agitation_smooth' , 'S_deriv2_squared_smooth', 'eig_deriv2_squared_smooth', ...
  'velocity_agitation_deriv_squared_smooth' };

nn   = [10 , 25 , 50 , 100 , 200 ];

for k = 1 : length(nn)
    k_num = num2str(nn(k));
    for i = 1 : length(trx)
        for j = 1 : length(name)

            variable   = trx(i).(name{j});
            variable_s = gaussian_smooth_choreography(variable, nn(k));
            trx(i).([name_smooth{j} '_' k_num]) = variable_s;

        end
    end
end

end


