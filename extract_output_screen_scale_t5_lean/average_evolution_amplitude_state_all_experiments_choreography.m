function [t, values_mean, value_error, nb_active_larva] = average_evolution_amplitude_state_all_experiments_choreography(trx, amplitude,state, t_min, t_max)

dt      = 0.1;
t_debut = t_min;
t_fin   = t_max;
t       = [t_debut:dt:t_fin];
n_trx   = length(trx);

nb_active_larva = nan;


for i  = 1 : length(t);
    
    loc = [];
    nb_active = 0;
    
%     states_loc     = trx(j).(states)(II);
%     if isempty(states_loc)
%     else
%         KK             = states_loc < 1;
%         states_loc(KK) = 0;
%         loc            = [loc; mean(states_loc)];
%         nb_active      = nb_active + 1;
%     end
    
    
    
    
    for j = 1 : n_trx
        
        t_loc      = trx(j).t;
        state_loc  = trx(j).(state);
        II         = (t_loc>t(i)-dt)&(t_loc<t(i)+dt)& (state_loc==1);
        values_loc = trx(j).(amplitude)(II);
        if isempty(values_loc)
        else
            
            loc        = [loc; mean(values_loc)];
            nb_active  = nb_active + 1;
        end
    end
    
    if  isempty(loc)
        values_mean(i) = nan;
        value_error(i) = nan;
    else
%         JJ      = loc == -1;
%         loc(JJ) = 0; 
%         values_mean(i) = sum(loc)./n_trx;
%         value_error(i) = sum ( ( values_mean(i) - loc).^2 )./n_trx;
%         value_error(i) = sqrt(value_error(i) )./sqrt(n_trx);
        values_mean(i) = sum(loc)./nb_active;
        value_error(i) = sum ( ( values_mean(i) - loc).^2 )./nb_active;
        value_error(i) = sqrt(value_error(i) )./sqrt(nb_active);
        nb_active_larva(i) = nb_active;

%         values_mean(i) = nanmean(loc);
%         value_error(i) = nanstd(loc)./sqrt(length(loc));
    end
    clear loc
end
    
    
    





























