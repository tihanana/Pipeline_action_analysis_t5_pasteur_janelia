function length_hunch_ness = length_hunch_ness_analysis(trx_all, t_start, varargin)



[relative_variation_l ,ratio_l,nb_active_larva  ] = average_length_variation_hunch(trx_all,t_start);

% length_hunch_ness.t                          = t;
length_hunch_ness.delta_length               = relative_variation_l ;
length_hunch_ness.ratio_l                    = ratio_l              ;
length_hunch_ness.nb_active_larva            = nb_active_larva      ;


fichier = fopen('length_hunch_ness_analysis', 'w+');
for j = 1 : length(length_hunch_ness.delta_length )
%    fprintf(fichier, '%f\t %i\t %i\n', t(j), quick_run_ness.pure_velocity (j), quick_run_ness.second_behaviour(j) ); 
    fprintf(fichier, ' %f\t  %f\n', length_hunch_ness.delta_length,  length_hunch_ness.ratio_l); 
end
fclose(fichier);

neuron                           = trx_all(1).neuron;
protocol                         = trx_all(1).protocol;
stimuli                          = trx_all(1).stimuli;
length_hunch_ness_data.neuron    = neuron;
length_hunch_ness_data.protocol  = protocol;
length_hunch_ness_data.stimuli   = stimuli;



save('length_hunch_ness.mat', 'length_hunch_ness', 'length_hunch_ness_data');







end