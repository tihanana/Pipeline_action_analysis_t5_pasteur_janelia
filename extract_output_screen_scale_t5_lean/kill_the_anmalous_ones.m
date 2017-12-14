function [survival] = kill_the_anmalous_ones(rig, varargin)

load('dominant.mat');

switch rig
    
    case 't15'
        
        t_start = 30;
        
    case 't5'
    
        t_start = 45;
        
    case 't3'
    
        t_start = 30;        
    
end



tresh               = 0.97;
dt_safety           = 0.25;
t                   = dominant.t;
first_behaviour     = dominant.first_behaviour ;
second_behaviour    = dominant.second_behaviour ;

II                  = (t>=0)&(t<t_start-dt_safety);
t                   = t(II);
first_behaviour     = first_behaviour(II);
second_behaviour    = second_behaviour(II);

nn                  = length(first_behaviour);

nb_run              = sum(first_behaviour  == 1);
nb_cast             = sum(second_behaviour == 2);

ratio_run           = nb_run./nn;
ratio_cast          = nb_cast./nn;

if (ratio_run >tresh) && (ratio_cast > tresh)
    
   survival = 1;
else
    
   survival = 0;
    
end


save('survival.mat', 'survival');
    
    


end