function [trx] = emission_probability_HT(trx, parameters)


coef_curv         = parameters.curvature   ;
coef_orientation  = parameters.orientation ;
coef_distance     = parameters.distance  ;
coef_acceleration = parameters.acceleration ;
coef_speed        = parameters.speed        ; 
beta              = parameters.beta;

n_trx      = length(trx);
for indice = 1 : n_trx
    
    t                       = trx(indice).t;
    n_t                     = length(t);

    d_curvature_head_tail               = trx(indice).d_curvature_head_tail;
    HT_d_matrix                         = trx(indice).HT_d_matrix ;
    axis_direction                      = trx(indice).axis_direction ;
    d_absolute_speed_head_tail          = trx(indice).d_absolute_speed_head_tail;
    d_absolute_acceleration_head_tail   = trx(indice).d_absolute_acceleration_head_tail;
      
    log_likelihood          = zeros(n_t-1,4);
    
    e_curv          = energy_curvature(    d_curvature_head_tail, coef_curv, n_t  );
    e_dir           = energy_direction(    axis_direction, coef_orientation , n_t );
    e_dist          = energy_distance(     HT_d_matrix , coef_distance, n_t       );
    e_acceleration  = energy_acceleration( d_absolute_acceleration_head_tail, coef_acceleration, n_t);
    e_speed         = energy_speed(        d_absolute_speed_head_tail, coef_speed, n_t);
%     
%     II = ball(1:end-1) == 1;
%     e_dist(II) = 0.;
    
   %  log_likelihood  = -beta.*(e_curv + e_dir + e_dist ); 
     log_likelihood  = -beta.*(e_curv + e_dir + e_dist + e_acceleration + e_speed); 
     % log_likelihood  = -beta.*(e_dist + e_acceleration + e_speed); 
    
      likelihood          = exp(log_likelihood);
    
    trx(indice).log_likelihood = log_likelihood;
    trx(indice).likelihood     = likelihood;
    
    clear energy_loc_1 energy_loc_2 energy_loc_3 energy_loc_4 ;
    clear log_likelihood likelihood;
    
end




end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function e_curv = energy_curvature(d_curvature_head_tail, coef_curv, n_t)

    e_curv    = zeros(n_t-1,4);

    d_curvature_head_tail_1 = d_curvature_head_tail(1:end-1,:);
    d_curvature_head_tail_2 = d_curvature_head_tail(2:end,:);

    e_curv(:,1)  = -coef_curv*(d_curvature_head_tail_1(:,1) + d_curvature_head_tail_2(:,1));
    e_curv(:,2)  = -coef_curv*(d_curvature_head_tail_1(:,1) + d_curvature_head_tail_2(:,2));
    e_curv(:,3)  = -coef_curv*(d_curvature_head_tail_1(:,2) + d_curvature_head_tail_2(:,1));
    e_curv(:,4)  = -coef_curv*(d_curvature_head_tail_1(:,2) + d_curvature_head_tail_2(:,2));
        
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function e_dir = energy_direction( axis_direction, coef_orientation , n_t)

    e_dir    = zeros(n_t-1,4);

    axis_direction_1        = axis_direction(1:end-1,:);
    axis_direction_2        = axis_direction(2:end,:);

    e_dir(:,1)  = -coef_orientation*( axis_direction_1(:,1) +  axis_direction_2(:,1) );
    e_dir(:,2)  = -coef_orientation*( axis_direction_1(:,1) +  axis_direction_2(:,2) );
    e_dir(:,3)  = -coef_orientation*( axis_direction_1(:,2) +  axis_direction_2(:,1) );
    e_dir(:,4)  = -coef_orientation*( axis_direction_1(:,2) +  axis_direction_2(:,2) );
        
    
end 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function e_dist = energy_distance(HT_d_matrix , coef_distance, n_t  )

    e_dist      = zeros(n_t-1,4);

    e_dist(:,1) = coef_distance*squeeze(HT_d_matrix(1,1, :) );
    e_dist(:,2) = coef_distance*squeeze(HT_d_matrix(1,2, :) );
    e_dist(:,3) = coef_distance*squeeze(HT_d_matrix(2,1, :) );
    e_dist(:,4) = coef_distance*squeeze(HT_d_matrix(2,2, :) );
    


end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function e_acceleration = energy_acceleration( d_absolute_acceleration_head_tail, coef_acceleration, n_t)

    e_acceleration       = zeros(n_t-1,4);

    d_absolute_acceleration_head_tail_1     = d_absolute_acceleration_head_tail(1:end-1,:);
    d_absolute_acceleration_head_tail_2     = d_absolute_acceleration_head_tail(2:end,:);

    e_acceleration(:,1)  = -coef_acceleration*( d_absolute_acceleration_head_tail_1(:,1) +  d_absolute_acceleration_head_tail_2(:,1) );
    e_acceleration(:,2)  = -coef_acceleration*( d_absolute_acceleration_head_tail_1(:,1) +  d_absolute_acceleration_head_tail_2(:,2) );
    e_acceleration(:,3)  = -coef_acceleration*( d_absolute_acceleration_head_tail_1(:,2) +  d_absolute_acceleration_head_tail_2(:,1) );
    e_acceleration(:,4)  = -coef_acceleration*( d_absolute_acceleration_head_tail_1(:,2) +  d_absolute_acceleration_head_tail_2(:,2) );
        
    
end 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function e_speed = energy_speed( d_absolute_speed_head_tail, coef_speed, n_t)

    e_speed                          = zeros(n_t-1,4);

    d_absolute_speed_head_tail_1     = d_absolute_speed_head_tail(1:end-1,:);
    d_absolute_speed_head_tail_2     = d_absolute_speed_head_tail(2:end,:);

    e_speed(:,1)  = -coef_speed*( d_absolute_speed_head_tail_1(:,1) +  d_absolute_speed_head_tail_2(:,1) );
    e_speed(:,2)  = -coef_speed*( d_absolute_speed_head_tail_1(:,1) +  d_absolute_speed_head_tail_2(:,2) );
    e_speed(:,3)  = -coef_speed*( d_absolute_speed_head_tail_1(:,2) +  d_absolute_speed_head_tail_2(:,1) );
    e_speed(:,4)  = -coef_speed*( d_absolute_speed_head_tail_1(:,2) +  d_absolute_speed_head_tail_2(:,2) );
        
    
end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     energy_loc_1 = -coef_curv*(d_curvature_head_tail_1(:,1) + d_curvature_head_tail_2(:,1))+ ...
%             -coef_orientation*( axis_direction_1(:,1) +  axis_direction_2(:,1) ) + ...
%             +coef_distance*squeeze(HT_d_matrix(1,1, :) );
%         
%     energy_loc_2 = -coef_curv*(d_curvature_head_tail_1(:,1) + d_curvature_head_tail_2(:,2))+ ...
%         -coef_orientation*( axis_direction_1(:,1) +  axis_direction_2(:,2)) + ...
%         +coef_distance*squeeze(HT_d_matrix(1,2,:) );
% 
%     energy_loc_3 = -coef_curv*(d_curvature_head_tail_1(:,2) + d_curvature_head_tail_2(:,1))+ ...
%         -coef_orientation*( axis_direction_1(:,2) +  axis_direction_2(:,1)) + ...
%         +coef_distance*squeeze(HT_d_matrix(2,1,:) );
% 
%     energy_loc_4= -coef_curv*(d_curvature_head_tail_1(:,2) + d_curvature_head_tail_2(:,2))+ ...
%         -coef_orientation*( axis_direction_1(:,2) +  axis_direction_2(:,2)) + ...
%         +coef_distance*squeeze(HT_d_matrix(2,2,:)) ;
%     
%     log_likelihood(:,1) = -beta.*energy_loc_1;
%     log_likelihood(:,2) = -beta.*energy_loc_2;
%     log_likelihood(:,3) = -beta.*energy_loc_3;
%     log_likelihood(:,4) = -beta.*energy_loc_4;

%     straight                = trx(indice).straight ;
%     bend                    = trx(indice).bend ;
%     curl                    = trx(indice).curl ;
%     ball                    = trx(indice).ball ;
%     II                      = (bend ==1 ) | (curl == 1) | (ball ==1);
%     bcb                     = II*1;
%     JJ                      = bcb ==0;
%     bcb(JJ)                 = -1; 
%     run                     = trx(indice).run;
%     cast                    = trx(indice).cast;
    