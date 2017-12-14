function trx =  give_global_states(trx, core_behaviours, core_numbers)

n_trx             = length(trx);
n_core_behaviours = length(core_behaviours);
% n_core_numbers    = length(core_numbers);

for i = 1 : n_trx
   t            = trx(i).t;
   n_t          = length(t);
   global_state = -1.*ones(n_t,1);
   for j = 1 :  n_core_behaviours
      behaviours       = trx(i).(core_behaviours{j});
      II               = behaviours > 0.9;
      global_state(II) = core_numbers{j};
      clear behaviours; 
   end
    trx(i).global_state = global_state;
    clear global_state;
end





end