function trx = from_global_states_to_individual_behaviours(trx)


core_behaviours     = {'run'      , 'cast'  , 'stop' ,  'hunch','back','roll' };
core_numbers        = {1, 2, 3, 4, 5, 6, -1};
n_core_behaviours   = length(core_behaviours);

for i = 1 : length(trx)
    
    global_state    = trx(i).global_state;
    n_global_state  = length(global_state(:,1)); 
    
    run   = -1.*ones(n_global_state,1);
    cast  = -1.*ones(n_global_state,1);
    stop  = -1.*ones(n_global_state,1);
    hunch = -1.*ones(n_global_state,1);
    back  = -1.*ones(n_global_state,1);
    roll  = -1.*ones(n_global_state,1);

    II         = global_state == 1;
    run(II)    = 1;
    II         = global_state == 2;
    cast(II)   = 1;
    II         = global_state == 3;
    stop(II)   = 1;
    II         = global_state == 4;
    hunch(II)  = 1;
    II         = global_state == 5;
    back(II)   = 1;
    II         = global_state == 6;
    roll(II)   = 1;

    trx(i).run   = run;
    trx(i).cast  = cast;
    trx(i).stop  = stop;
    trx(i).hunch = hunch;
    trx(i).back  = back;
    trx(i).roll  = roll;

    clear run cast stop hunch back roll II;
end





end