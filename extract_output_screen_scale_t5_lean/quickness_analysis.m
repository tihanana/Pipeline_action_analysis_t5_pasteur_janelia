function quickness = quickness_analysis(trx_all, t_min, t_max, varargin)


trx_all                       = give_pure_motion_velocity(trx_all);
[t, values_mean, value_error, nb_active_larva] = average_evolution_amplitude_all_experiments_choreography(trx_all, 'pure_motion_velocity_25', t_min, t_max);

quickness.t                        = t;
quickness.pure_velocity            = values_mean;
quickness.pure_velocity_norm       = values_mean./nanmean(values_mean(1:100));
quickness.nb_active_larva          =  nb_active_larva;


fichier = fopen('quickness_velocity_population_wise', 'w+');
for j = 1 : length(quickness.t )
%    fprintf(fichier, '%f\t %i\t %i\n', t(j), quickness.pure_velocity (j), quickness.second_behaviour(j) ); 
    fprintf(fichier, '%f\t  %f\t  %f\n', t(j), quickness.pure_velocity(j),  quickness.pure_velocity_norm); 
end
fclose(fichier);

neuron                  = trx_all(1).neuron;
protocol                = trx_all(1).protocol;
stimuli                 = trx_all(1).stimuli;
quickness_data.neuron    = neuron;
quickness_data.protocol  = protocol;
quickness_data.stimuli   = stimuli;



save('quickness.mat', 'quickness', 'quickness_data');







end