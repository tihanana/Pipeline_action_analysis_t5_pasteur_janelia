function trx = give_agitation_velocity(trx)

name1 =  {'x_center'   , 'y_center'};
name2 =  {'x_neck_top' , 'y_neck_top'};
name3 =  {'x_neck_down', 'y_neck_down'};

nn      = 10;
nn_long = 100;
for i = 1 : length(trx)
    
    %%
    variable1   = trx(i).(name1{1});
    variable2   = trx(i).(name1{2});
    dvariable1  = 10.*gaussian_deriv_smooth_choreography(variable1, nn);
    dvariable2  = 10.*gaussian_deriv_smooth_choreography(variable2, nn);
    velocity_center =    dvariable1.^2 + dvariable2.^2;
    %%
    variable1   = trx(i).(name2{1});
    variable2   = trx(i).(name2{2});
    dvariable1  = 10.*gaussian_deriv_smooth_choreography(variable1, nn);
    dvariable2  = 10.*gaussian_deriv_smooth_choreography(variable2, nn);
    velocity_neck_top =    dvariable1.^2 + dvariable2.^2;
    %%
    variable1   = trx(i).(name3{1});
    variable2   = trx(i).(name3{2});
    dvariable1  = 10.*gaussian_deriv_smooth_choreography(variable1, nn);
    dvariable2  = 10.*gaussian_deriv_smooth_choreography(variable2, nn);
    velocity_neck_down =    dvariable1.^2 + dvariable2.^2;
    %%
    
    trx(i).velocity_agitation = 1./3.* (velocity_center + ...
    velocity_neck_top +  velocity_neck_down);
   
    trx(i).velocity_agitation_smooth = gaussian_smooth_choreography(trx(i).velocity_agitation, nn_long);

end


end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    
    