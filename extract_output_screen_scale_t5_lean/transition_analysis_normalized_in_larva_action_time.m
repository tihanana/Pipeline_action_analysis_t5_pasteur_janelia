function transitions = transition_analysis_normalized_in_larva_action_time(trx, t_start, t_stop, t_max)


dt_before = 1;
t_init    = 0;
 
%% global transition before during after

[transition_globale_before , transition_globale_norm_before , nb_active_before, n_trx_before ] = Markov_transition_normalized_larva_action_time(trx, t_init,  t_start);
[transition_globale_during , transition_globale_norm_during , nb_active_during, n_trx_during ] = Markov_transition_normalized_larva_action_time(trx, t_start, t_stop);
[transition_globale_after  , transition_globale_norm_after , nb_active_after, n_trx_after ]    = Markov_transition_normalized_larva_action_time(trx, t_stop,  t_max);


transitions.transition_globale_before       = transition_globale_before;
transitions.transition_globale_norm_before  = transition_globale_norm_before;
transitions.nb_active_before                = nb_active_before;
transitions.n_trx_before                    = n_trx_before;

transitions.transition_globale_during       = transition_globale_during;
transitions.transition_globale_norm_during  = transition_globale_norm_during;
transitions.nb_active_during                = nb_active_during;
transitions.n_trx_during                    = n_trx_during;

transitions.transition_globale_after       = transition_globale_after;
transitions.transition_globale_norm_after  = transition_globale_norm_after;
transitions.nb_active_after                = nb_active_after;
transitions.n_trx_after                    = n_trx_after;

%% just after signal and after end of signal

t_just_after_start = t_start + 3;
t_just_after_stop  = t_stop  + 3;

[transition_after_start, transition_after_start_norm, nb_active_after_start, n_trx_after_start ] = Markov_transition_normalized_larva_action_time(trx, t_start - dt_before ,  t_just_after_start);
[transition_after_stop, transition_after_stop_norm, nb_active_after_stop, n_trx_after_stop ]     = Markov_transition_normalized_larva_action_time(trx, t_stop  - dt_before ,   t_just_after_stop);

transitions.transition_after_start      = transition_after_start;
transitions.transition_after_start_norm = transition_after_start_norm;
transitions.nb_active_after_start       = nb_active_after_start;
transitions.n_trx_after_start           = n_trx_after_start;


transitions.transition_after_stop       = transition_after_stop;
transitions.transition_after_stop_norm  = transition_after_stop_norm;
transitions.nb_active_after_stop        = nb_active_after_stop;
transitions.n_trx_after_stop            = n_trx_after_stop;


%% save 
neuron   = trx(1).neuron;
protocol = trx(1).protocol;
stimuli  = trx(1).stimuli;
transitions_data.neuron   = neuron;
transitions_data.protocol = protocol;
transitions_data.stimuli  = stimuli;



save('transition_analysis_normalized_in_larva_and_action.mat', 'transitions', 'transitions_data' );






end