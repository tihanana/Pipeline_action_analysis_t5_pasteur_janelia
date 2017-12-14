function [transition_globale, transition_globale_norm ] = Markov_transition_global_during_time_window(trx, t_init, t_end)

dt                 = 1;
trx                = select_larva_present_in_time_window(trx,  t_init, t_end-dt);
n_trx              = length(trx);

dt_theo            = t_end - dt - t_init;
n_behaviour        = 6; 
transition_globale = zeros(n_behaviour,n_behaviour);


for i = 1 : n_trx
    
    dt_window    = max(trx(i).t) - min(trx(i).t);
    wi           = min(dt_window./dt_theo, 1);
%     fprintf('%f\t %i\t %i\n', wi, i, n_trx);
    global_state = trx(i).global_state;
    t            = trx(i).t;
    JJ           = (t>= t_init) &  (t<t_end);
    global_state = global_state(JJ);
    II           = find(diff(global_state)~=0);
    for j = 1 : length(II)
        k_start = global_state(II(j));
        k_end   = global_state(II(j)+1);
        transition_globale(k_start, k_end) = transition_globale(k_start, k_end) + wi;
    end
    clear global_state II JJ wi k_start k_end;
end
  
transition_globale      = round(transition_globale);
transition_globale_norm = bsxfun(@rdivide, transition_globale, sum(transition_globale,2));

II = isnan(transition_globale_norm);
transition_globale_norm(II) = 0;


end