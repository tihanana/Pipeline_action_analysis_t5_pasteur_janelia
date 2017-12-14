function transitions = transition_analysis(trx, t_start, t_stop, t_max)


dt_before = 1;
t_init    = 0;
 
%% global transition before during after

[transition_globale_before , transition_globale_norm_before  ] = Markov_transition_global_during_time_window(trx, t_init,  t_start);
[transition_globale_during , transition_globale_norm_during  ] = Markov_transition_global_during_time_window(trx, t_start, t_stop);
[transition_globale_after  , transition_globale_norm_after   ] = Markov_transition_global_during_time_window(trx, t_stop,  t_max);


transitions.transition_globale_before       = transition_globale_before;
transitions.transition_globale_norm_before  = transition_globale_norm_before;

transitions.transition_globale_during       = transition_globale_during;
transitions.transition_globale_norm_during  = transition_globale_norm_during;

transitions.transition_globale_after       = transition_globale_after;
transitions.transition_globale_norm_after  = transition_globale_norm_after;

%% just after signal and after end of signal

t_just_after_start = t_start + 3;
t_just_after_stop  = t_stop  + 3;

[transition_after_start, transition_after_start_norm ] = Markov_transition_global_during_time_window(trx, t_start - dt_before ,  t_just_after_start);
[transition_after_stop, transition_after_stop_norm ]   = Markov_transition_global_during_time_window(trx, t_stop  - dt_before ,   t_just_after_stop);

transitions.transition_after_start      = transition_after_start;
transitions.transition_after_start_norm = transition_after_start_norm;
transitions.transition_after_stop       = transition_after_stop;
transitions.transition_after_stop_norm  = transition_after_stop_norm;


%% save 
neuron   = trx(1).neuron;
protocol = trx(1).protocol;
stimuli  = trx(1).stimuli;
transitions_data.neuron   = neuron;
transitions_data.protocol = protocol;
transitions_data.stimuli  = stimuli;



save('transitions.mat', 'transitions', 'transitions_data' );






end