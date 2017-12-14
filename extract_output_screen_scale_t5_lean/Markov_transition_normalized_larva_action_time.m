function [transition_globale, transition_globale_norm, nb_active, n_trx ] = Markov_transition_normalized_larva_action_time(trx, t_init, t_end)


factor             = 0.05;
dt                 = 1;
trx                = select_larva_present_in_time_window(trx,  t_init, t_end-dt);
n_trx              = length(trx);

dt_theo            = t_end - dt - t_init;
n_behaviour        = 6; 
transition_globale = zeros(n_behaviour,n_behaviour);

nb_active  = 0;
for i = 1 : n_trx
    
    dt_window    = max(trx(i).t) - min(trx(i).t);
    wi           = min(dt_window./dt_theo, 1);
    global_state = trx(i).global_state;
    t            = trx(i).t;
    JJ           = (t>= t_init) &  (t<t_end);
    global_state = global_state(JJ);
    II           = find(diff(global_state)~=0);
    transition_globale_loc  = zeros(n_behaviour,n_behaviour);
    for j = 1 : length(II)
        k_start = global_state(II(j));
        k_end   = global_state(II(j)+1);
        transition_globale_loc(k_start, k_end) = transition_globale_loc(k_start, k_end) + wi;
    end
    
    if (sum(transition_globale_loc(:))>0)
        nb_active = nb_active +1;
        transition_globale_loc = transition_globale_loc./sum( transition_globale_loc(:) );
    end
    
    transition_globale     = transition_globale + transition_globale_loc;
    
    
    clear global_state II JJ wi k_start k_end transition_globale_loc;
end
  

transition_globale             = transition_globale./(nb_active);
transition_globale_norm        = bsxfun(@rdivide, transition_globale, sum(transition_globale,2));
% transition_globale           = round(transition_globale);
% transition_globale_norm      = transition_globale./nb_active ; 


% II = isnan(transition_globale_norm);
% transition_globale_norm(II) = 0;
% transition_globale_norm  = transition_globale;


end