function [ values_mean, nb_active_larva] = average_evolution_during_time_windows_choreography(trx, states, t_start, t_end)


n_trx   = length(trx);
    
loc = [];
nb_active = 0;
nb_active_larva = nan;
for j = 1 : n_trx

    t_loc      = trx(j).t;
    II         = (t_loc>t_start)&(t_loc<t_end);
    states_loc     = trx(j).(states)(II);
    if isempty(states_loc)
    else
        KK             = states_loc < 1;
        states_loc(KK) = 0;
        loc            = [loc; mean(states_loc)];
        nb_active      = nb_active + 1;
    end
end


 nb_active_larva = nb_active;
 

if sum(loc) ==0
    values_mean = 0;
else
    values_mean  = sum(loc)./nb_active;
end

end