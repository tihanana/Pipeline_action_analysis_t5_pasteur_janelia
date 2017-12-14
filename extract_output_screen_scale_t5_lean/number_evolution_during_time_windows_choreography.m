function [ number, number_larva] = number_evolution_during_time_windows_choreography(trx, states, t_start, t_end)


n_trx   = length(trx);
    
loc = [];
nb_active = 0;
number = 0;
 nb_active_larva = nan;
for j = 1 : n_trx

    t_loc      = trx(j).t;
    II         = (t_loc>t_start)&(t_loc<t_end);
    states_loc     = trx(j).(states)(II);
    if isempty(states_loc)
    else
        KK             = states_loc >0.5 ;
        if sum(KK) >0
            number = number + 1;
        end
        
        
    end
end

number_larva = number;
number = number./n_trx;

