function [min_S, nb_active_larva] = average_S_variation_cast(trx,t_start);


dt              = 10;
dt_short        = 5;
state           = 'cast';
n_trx           = length(trx);

t_before        =  t_start - dt;
t_after         =  t_start + dt_short;

loc_min_S       = [];
nb_active       = 0;    

nb_active_larva = nan;

for i = 1 : n_trx
    
    
    S           = trx(i).S;
    t           = trx(i).t;
    state_loc   = trx(i).(state);
    II          = (t>=t_before)&(t<=t_start);
    JJ          = (t>=t_start)&(t<=t_after);
    KK          = state_loc ==1   ; 
    LL          = KK & JJ     ;
    S_min       = min( S(LL)   );
    
    if (  isempty(S_min ) )
    else
        
        loc_min_S = [loc_min_S; S_min];
        nb_active     = nb_active + 1; 
    end
        
    clear II JJ KK LL l_min l_max state_loc;
end


if  isempty(loc_min_S)
    min_S = nan;
else
    min_S = sum(loc_min_S)./nb_active;
    nb_active_larva = nb_active;
end



end
    