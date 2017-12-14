function trx = give_log_some_features(trx)


liste_features = {'S_deriv_squared','eig_deriv_squared','velocity_agitation_deriv_squared',...
    'velocity_agitation'};

for j  = 1 : length(liste_features)
    for i = 1 : length(trx)
    
        trx(i).([liste_features{j} '_log']) = log( trx(i).(liste_features{j}) );
            
    end
end


nn   =  3 ;
name =  { 'S_deriv_squared_log', ...
    'eig_deriv_squared_log', ...
    'velocity_agitation_deriv_squared_log', ...
    'velocity_agitation_log' };
    
    
for i = 1 : length(trx)
    for j = 1 : length(name)
        
        variable         = trx(i).(name{j});
        variable_s       = gaussian_smooth_choreography(variable, nn);
        trx(i).(name{j}) = variable_s;
        
    end
end


nn          = [10 , 25 , 50 , 100 , 200 ];
name_smooth = { 'S_deriv_squared_log_smooth', ...
    'eig_deriv_squared_log_smooth', ...
    'velocity_agitation_deriv_squared_log_smooth', ...
    'velocity_agitation_log_smooth' };



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





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





