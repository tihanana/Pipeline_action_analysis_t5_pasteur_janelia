function [sequence_out] = ...
    extract_sequences_n_behaviours_after_signal(trx,  t_start,n_expected_changes, duration,  varargin )

% n_expected_changes = 4;
% duration           = 10;

dt_window          = 1   ;
dt_blur            = 0.5 ;
dt_before          = 0.1;
n_trx              = length(trx);


sequence_after_stim_start = zeros(n_trx, n_expected_changes + 1);

for i = 1 : n_trx
%     fprintf('%i\n', i);
    t             = trx(i).t;
    global_state  = trx(i).global_state;
        
        %% juste after start signal
        JJ                             = find(t < t_start - dt_before);
        JJ                             = max(JJ);
        sequence_after_stim_start(i,1) = global_state(JJ);
        global_state_before            = global_state(JJ);

        JJ                 =  (t >= t_start) & (t<= t_start + duration) ;
        global_state_after = global_state(JJ);
        t_after            = t(JJ);
        
        [sequence] = give_n_transitions_during_time_window(global_state_before , global_state_after, ...
            t_after, dt_blur, n_expected_changes);
        sequence   = regularize_sequence_n_behaviour_for_path_analysis(sequence, n_expected_changes);
        sequence_after_stim_start(i,2:n_expected_changes + 1) = sequence; 
        
        clear global_state_after JJ t_after sequence ;
        %% just after stop signal

    
    
end

sequence_out = sequence_after_stim_start;


end