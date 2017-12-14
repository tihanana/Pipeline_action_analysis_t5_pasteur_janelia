function trx = give_back_states_choreography(trx, path_to_classifiers, parameters)

n_trx       = length(trx);
threshold   = parameters.threshold_moving_back;


for i = 1 : n_trx;
   
   sb   = trx(i).straight_and_light_bend;
   dis  = trx(i).displacing;
   axis = trx(i).axis_direction_25_10;
   II   = (sb == 1) & (axis <= threshold) & (dis == 1);
      
   back = -1.*ones(length(sb),1);
   proba = zeros(length(sb),1);
   back(II)  =  1.;
   proba(II) =  1;
   back(~II) = -1.;
   
   trx(i).back =  back;
   trx(i).back_proba = proba;
   
     
   clear II back sb axis proba;
    
end








end