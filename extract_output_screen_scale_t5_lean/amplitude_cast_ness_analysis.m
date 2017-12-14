function amplitude_cast_ness  = amplitude_cast_ness_analysis(trx, t_start, varargin)





[min_S,nb_active_larva] = average_S_variation_cast(trx,t_start);

% amplitude_cast_ness.t                          = t;
amplitude_cast_ness.min_S               = min_S ;
amplitude_cast_ness.nb_active_larva     = nb_active_larva ;


fichier = fopen('amplitude_cast_ness_analysis', 'w+');
for j = 1 : length(amplitude_cast_ness.min_S )
    fprintf(fichier, '%f\n', amplitude_cast_ness.min_S); 
end
fclose(fichier);

neuron                           = trx(1).neuron;
protocol                         = trx(1).protocol;
stimuli                          = trx(1).stimuli;
amplitude_cast_ness_data.neuron    = neuron;
amplitude_cast_ness_data.protocol  = protocol;
amplitude_cast_ness_data.stimuli   = stimuli;



save('amplitude_cast_ness.mat', 'amplitude_cast_ness', 'amplitude_cast_ness_data');







end

