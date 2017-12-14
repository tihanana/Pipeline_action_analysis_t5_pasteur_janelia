function trx = regularize_singular_events(trx)

    trx = regularize_101_pattern(trx);
    trx = regularize_123_pattern(trx);
    trx = from_global_states_to_individual_behaviours(trx);
    
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function trx = regularize_101_pattern(trx)

n_trx = length(trx);
for i = 1 : n_trx

    t            = trx(i).t;
    global_state = trx(i).global_state; 
    
    global_state_1 = global_state(1:end-2);
    global_state_2 = global_state(2:end-1);
    global_state_3 = global_state(3:end);
    d12            = global_state_2 - global_state_1;
    d23            = global_state_2 - global_state_3;
    d13            = global_state_3 - global_state_1;
    II             = find( (d12~=0) & (d23~=0) & (d13==0));
    
    if ~isempty(II)
        for j = 1 : length(II)
            global_state(II(j)+1) = global_state(II(j));
        end
    end
    trx(i).global_state = global_state;
end


end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function trx = regularize_123_pattern(trx)

n_trx = length(trx);
for i = 1 : n_trx

    t            = trx(i).t;
    global_state = trx(i).global_state; 
    
    global_state_1 = global_state(1:end-2);
    global_state_2 = global_state(2:end-1);
    global_state_3 = global_state(3:end);
    d12            = global_state_2 - global_state_1;
    d23            = global_state_2 - global_state_3;
    d13            = global_state_3 - global_state_1;
    II             = find( (d12~=0) & (d23~=0) & (d13~=0));
    
    if ~isempty(II)
        for j = 1 : length(II)
            global_state(II(j)+1) = global_state(II(j)+2);
        end
    end
    trx(i).global_state = global_state;
end


end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
