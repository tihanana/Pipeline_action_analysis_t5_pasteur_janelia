function [trx] = give_start_stop_actions(trx)

try
   trx = rmfield(trx, 'duration'); 
end

core_behaviours = {'run' , 'cast' , 'stop' , 'hunch' , 'back' , 'roll'};
core_numbers    = {1, 2, 3, 4, 5, 6};
n_core_behaviours = length(core_behaviours);
n_trx           = length(trx);

for j = 1 : n_core_behaviours
    
    action_loc = core_behaviours{j} ;
    for k = 1 : n_trx
        
%         fprintf('%i\t  %i\n',j,k);
        global_state                                     = trx(k).global_state;
        t                                                = trx(k).t;
        [local_state]                                    = select_behaviour(global_state, core_numbers, j);
        [start_stop, t_start_stop, duree, n_duree]       = start_stop_behaviour_choreography(local_state,t);
        trx(k).('start_stop'){j}                         = start_stop ;
        trx(k).('t_start_stop'){j}                       = t_start_stop;
        trx(k).('duration'){j}                           = duree ;
        trx(k).('n_duration'){j}                         = n_duree;     
        [n,~]                                            = size(start_stop);
        trx(k).('nb_action'){j}                          = n ;
        
        
        clear start_stop t_start_stop duree n m;
    end
    
    
    
    
end



end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function  [local_state] = select_behaviour(global_state, core_numbers, j)

n                 = length(global_state);
local_state       = -1*ones(n,1);
II = global_state == core_numbers{j};

local_state(II)   = 1;

end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
