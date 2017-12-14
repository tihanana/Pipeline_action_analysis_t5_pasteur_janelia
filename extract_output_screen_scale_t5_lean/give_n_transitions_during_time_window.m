function [sequence] = give_n_transitions_during_time_window(global_state_before, global_state,t, dt_blur, n_expected_changes)


II           = find(diff(global_state)~=0);
n_II         = length(II);

if global_state(1) ~= global_state_before;
    II   = [1; II];
    n_II = n_II + 1;
end

if n_II == 0
    
    sequence(1) = global_state(1);
    
else
    
    sequence_new = global_state(II+1);
    
    if t(II(1)) - t(1) > dt_blur
        
        sequence(1) = global_state(1);
        sequence    = [sequence ; sequence_new(1:min(n_II, n_expected_changes ) )]; 
        
    else
        
        sequence    = sequence_new(1:min(n_II, n_expected_changes ) ); 
        
    end
    
end
    
n_sequence = length(sequence);
if n_sequence > n_expected_changes
    sequence = sequence(1:n_expected_changes);
    
end
sequence = sequence';


end