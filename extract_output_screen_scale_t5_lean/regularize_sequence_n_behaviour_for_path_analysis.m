function sequence = regularize_sequence_n_behaviour_for_path_analysis(sequence, n)


n_seq  = length(sequence);
n_diff = n - n_seq ;

if (n == n_seq)
    
    
elseif  (n_seq< n)
    
    sequence = [sequence, sequence(end)*ones(1,n_diff)];
    
end







end