function bend_cast_ness = bend_cast_ness_analysis(trx_all, t_min, t_max, varargin)


trx_all                       = give_symmetry_break(trx_all);
trx_all                       = give_S_derivatives(trx_all);
trx_all                       = give_number_sides_during_cast(trx_all);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


[t, values_mean, value_error, nb_active_larva] = average_evolution_amplitude_state_all_experiments_choreography(trx_all, 'S_smooth_10', 'cast', t_min, t_max);

bend_cast_ness.t               = t;
bend_cast_ness.S               = values_mean;
bend_cast_ness.S_norm          = values_mean./nanmean(values_mean(1:100));
bend_cast_ness.nb_active_larva = nb_active_larva;

clear t values_mean;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[t, values_mean, value_error, nb_active_larva] = average_evolution_amplitude_state_all_experiments_choreography(trx_all, 'pure_deriv_S_norm_10','cast', t_min, t_max);

bend_cast_ness.t                    = t;
bend_cast_ness.deriv_S_norm         = values_mean;
bend_cast_ness.deriv_S_norm_norm    = values_mean./nanmean(values_mean(1:100));
bend_cast_ness.nb_active_larva_norm = nb_active_larva;
clear t values_mean;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%







%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



neuron                        = trx_all(1).neuron;
protocol                      = trx_all(1).protocol;
stimuli                       = trx_all(1).stimuli;
bend_cast_ness_data.neuron    = neuron;
bend_cast_ness_data.protocol  = protocol;
bend_cast_ness_data.stimuli   = stimuli;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


save('bend_cast_ness.mat', 'bend_cast_ness', 'bend_cast_ness_data');







end