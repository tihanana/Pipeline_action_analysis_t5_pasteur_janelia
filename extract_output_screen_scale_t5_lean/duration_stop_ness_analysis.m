function duration_stop_ness  = duration_stop_ness_analysis(trx, t_start, varargin)





[duration_S, nb_active_larva] = average_duration_stop(trx,t_start);

% duration_stop_ness.t                          = t;
duration_stop_ness.duration_S               = duration_S ;
duration_stop_ness.nb_active_larva          = nb_active_larva;

fichier = fopen('duration_stop_ness_analysis', 'w+');
for j = 1 : length(duration_stop_ness.duration_S )
    fprintf(fichier, '%f\n', duration_stop_ness.duration_S); 
end
fclose(fichier);

neuron                           = trx(1).neuron;
protocol                         = trx(1).protocol;
stimuli                          = trx(1).stimuli;
duration_stop_ness_data.neuron    = neuron;
duration_stop_ness_data.protocol  = protocol;
duration_stop_ness_data.stimuli   = stimuli;



save('duration_stop_ness.mat', 'duration_stop_ness', 'duration_stop_ness_data');







end

