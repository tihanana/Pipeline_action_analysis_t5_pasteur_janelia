function trx = generate_features_based_on_behaviour_timing_stop(trx)

n_lim_duration    = 10;
n_min_duration    = 2;


state             = 'stop';
core_behaviours   = {'run' , 'cast' , 'stop' , 'hunch' , 'back' , 'roll'};
core_numbers      = {1, 2, 3, 4, 5, 6};
n_core_behaviours = length(core_behaviours);
n_trx             = length(trx);

for i = 1 : length(core_behaviours)
    if ~isempty(strfind(state, core_behaviours{i}));
        nb_eff = core_numbers{i};
        break;
    end
end


for i = 1 : n_trx
    
    t                    = trx(i).t;
    n_t                  = length(t);
    start_stop           = trx(i).start_stop{nb_eff};
    [n,~]                = size(start_stop)  ;
    n_duration           = trx(i).n_duration{nb_eff};

    if ~isempty(start_stop) 
        
        start_before         = start_stop(:,1)-1 ;
        stop_after           = start_stop(:,2)+1 ;
        
        for j = 1 : n
            
            if (start_before(j,1)<=0) || (stop_after(j,1)>n_t)
                 trx(i).border_elimination(j) = 1;
            else
                 trx(i).border_elimination(j) = -1;
            end
            
            trx(i).features_stop{j}(1)     = n_duration(j,1) ;  

        end

    end
    
end






end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
