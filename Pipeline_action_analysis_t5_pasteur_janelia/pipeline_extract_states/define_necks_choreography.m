function [trx] = define_necks_choreography(trx)
%% define the top neck and the down neck to have 5 main points
%% the definition is not unique 
for i = 1 : length(trx)
%     fprintf('%i\n', i);
    
    trx(i).x_neck_down(:,1) = ( trx(i).x_spine(:,3) + trx(i).x_spine(:,4)  )./2;
    trx(i).y_neck_down(:,1) = ( trx(i).y_spine(:,3) + trx(i).y_spine(:,4)  )./2;

    trx(i).x_neck_top(:,1) = ( trx(i).x_spine(:,8) + trx(i).x_spine(:,9)  )./2;
    trx(i).y_neck_top(:,1) = ( trx(i).y_spine(:,8) + trx(i).y_spine(:,9)  )./2;
    
    trx(i).x_neck(:,1)     = trx(i).x_spine(:,6);
    trx(i).y_neck(:,1)     = trx(i).y_spine(:,6);
  
    trx(i).x               = trx(i).x_neck;
    trx(i).y               = trx(i).y_neck;

end


end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
