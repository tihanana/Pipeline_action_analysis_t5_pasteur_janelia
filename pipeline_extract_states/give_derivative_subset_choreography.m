function trx = give_derivative_subset_choreography(trx)

nn   = 3;
name = {'S', 'eig', 'velocity_agitation'};
    
for i = 1 : length(trx)
    
    for j = 1 : length(name)
        
        variable   = trx(i).(name{j});
        dvariable  = 10*gaussian_deriv_smooth_choreography(variable, nn);
        d2variable = 10*gaussian_deriv_smooth_choreography(dvariable, nn);
        
        trx(i).([name{j} '_deriv' ]) = dvariable;
        trx(i).([name{j} '_deriv2']) = d2variable;
        
        trx(i).([name{j} '_deriv_squared' ]) = dvariable.^2;
        trx(i).([name{j} '_deriv2_squared']) = d2variable.^2;
        
        
    end
    
    
    
end
    
    
    
    
    
    

end