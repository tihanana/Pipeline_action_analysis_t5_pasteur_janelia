function bendiness = bendiness_analysis(trx_all, t_min, t_max, varargin)


% trx_all                       = give_pure_motion_velocity(trx_all);
trx_all                       = give_S_derivatives(trx_all);
[t, values_mean, value_error, nb_larva_active] = average_evolution_amplitude_all_experiments_choreography(trx_all, 'S_smooth_10', t_min, t_max);

bendiness.t                   = t;
bendiness.S                   = values_mean;
bendiness.S_norm              = values_mean./nanmean(values_mean(1:100));
bendiness.nb_larva_active     = nb_larva_active;


[t, values_mean, value_error, nb_larva_active] = average_evolution_amplitude_all_experiments_choreography(trx_all, 'pure_deriv_S_norm_10', t_min, t_max);

bendiness.t                        = t;
bendiness.deriv_S_norm             = values_mean;
bendiness.deriv_S_norm_norm        = values_mean./nanmean(values_mean(1:100));
bendiness.nb_larva_active_norm     = nb_larva_active;



% fichier = fopen('bendiness_velocity_population_wise', 'w+');
% for j = 1 : length(bendiness.t )
% %    fprintf(fichier, '%f\t %i\t %i\n', t(j), bendiness.pure_velocity (j), bendiness.second_behaviour(j) ); 
%     fprintf(fichier, '%f\t  %f\t  %f\n', t(j), bendiness.S(j),  bendiness.S_norm); 
% end
% fclose(fichier);

neuron                   = trx_all(1).neuron;
protocol                 = trx_all(1).protocol;
stimuli                  = trx_all(1).stimuli;
bendiness_data.neuron    = neuron;
bendiness_data.protocol  = protocol;
bendiness_data.stimuli   = stimuli;



save('bendiness.mat', 'bendiness', 'bendiness_data');







end