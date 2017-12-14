function trx = get_smooth_fields_small_subset_choreography(trx)

nn   =  3 ;
name =  { 'S', 'eig' ,'velocity_agitation' };
    
    
for i = 1 : length(trx)
    for j = 1 : length(name)
        
        variable         = trx(i).(name{j});
        variable_s       = gaussian_smooth_choreography(variable, nn);
        trx(i).(name{j}) = variable_s;
        
    end
end


nn          = [10 , 25 , 50 , 100 , 200 ];
name_smooth = {'S_smooth' , 'eig_smooth','velocity_agitation_smooth'};

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