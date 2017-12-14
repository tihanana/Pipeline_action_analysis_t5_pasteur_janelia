function sequences =  sequence_analysis_t5_n_behaviours_duration(trx_all, t_start, t_stop,n_expected_changes, duration,  varargin)


% duration = 10;
% duration = 38;
%% after signal
duration_num           = num2str(duration);
n_expected_changes_num = num2str(n_expected_changes);


trx_signal               = select_larva_behaving_during_time_window(trx_all, t_start-0.2, t_start+duration);
[sequence_signal_start]  = extract_sequences_n_behaviours_after_signal(trx_signal,  t_start,n_expected_changes, duration );
 clear trx_signal;
 
 
%% after stop signal
trx_signal              = select_larva_behaving_during_time_window(trx_all, t_stop-0.2, t_stop+duration);
[sequence_signal_stop]  = extract_sequences_n_behaviours_after_signal(trx_signal,  t_stop,n_expected_changes, duration  );
 clear trx_signal;


neuron   = trx_all(1).neuron;
protocol = trx_all(1).protocol;
stimuli  = trx_all(1).stimuli;

sequences_data.neuron   = neuron;
sequences_data.protocol = protocol;
sequences_data.stimuli  = stimuli;

sequences.sequence_signal_start = sequence_signal_start;
sequences.sequence_signal_stop  = sequence_signal_stop;
sequences.nb_larva_start        = length(sequence_signal_start(:,1));
sequences.nb_larva_stop         = length(sequence_signal_stop(:,1));



save(['sequences_n_changes_' n_expected_changes_num '_duration_window_'  duration_num '.mat'], 'sequences', 'sequences_data');



end