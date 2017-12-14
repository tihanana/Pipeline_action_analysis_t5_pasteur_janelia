function [duration, nb_active_larva] = average_duration_stop(trx,t_start)


dt              = 10;
dt_short        = 5;
state           = 'stop';
n_trx           = length(trx);

t_before        =  t_start - dt;
t_after         =  t_start + dt_short;

loc_duration       = [];
nb_active          = 0;    
delta_t        = [];
nb_active_larva = nan;
for i = 1 : n_trx
    
    t           = trx(i).t;
    delta_t     = [delta_t; t(2:end)-t(1:end-1)];
    state_loc   = trx(i).(state);
    JJ          = (t>=t_start)&(t<=t_after);
    KK          = state_loc ==1   ; 
    LL          = KK & JJ     ;
    somme_LL    = sum(LL);
    
    if ( somme_LL == 0 )
    else
        
        loc_duration  = [loc_duration; somme_LL];
        nb_active     = nb_active + 1; 
    end
        
    clear II JJ KK LL l_min l_max state_loc;
end
delta_t = nanmean(delta_t);

if  isempty(loc_duration)
    duration = nan;
else
    duration        = sum(loc_duration)./nb_active*delta_t;
    nb_active_larva = nb_active;
end



end
    