function quick_run_ness = quick_run_ness_analysis(trx_all, t_min, t_max, varargin)


trx_all                       = give_pure_motion_velocity(trx_all);
[t, values_mean, value_error, nb_active_larva] = ...
    average_evolution_amplitude_state_all_experiments_choreography(trx_all,...
    'pure_motion_velocity_25','run', t_min, t_max);



quick_run_ness.t                        = t;
quick_run_ness.pure_velocity            = values_mean;
quick_run_ness.pure_velocity_norm       = values_mean./nanmean(values_mean(1:100));
quick_run_ness.nb_active_larva          = nb_active_larva;


fichier = fopen('quick_run_ness_velocity_population_wise', 'w+');
for j = 1 : length(quick_run_ness.t )
%    fprintf(fichier, '%f\t %i\t %i\n', t(j), quick_run_ness.pure_velocity (j), quick_run_ness.second_behaviour(j) ); 
    fprintf(fichier, '%f\t  %f\t  %f\n', t(j), quick_run_ness.pure_velocity(j),  quick_run_ness.pure_velocity_norm); 
end
fclose(fichier);

neuron                  = trx_all(1).neuron;
protocol                = trx_all(1).protocol;
stimuli                 = trx_all(1).stimuli;
quick_run_ness_data.neuron    = neuron;
quick_run_ness_data.protocol  = protocol;
quick_run_ness_data.stimuli   = stimuli;



save('quick_run_ness.mat', 'quick_run_ness', 'quick_run_ness_data');







end