function probabilities = probability_analysis(trx_all, t_start, t_stop, varargin)


dt_window_1       = 1;
dt_window_2       = 5;
dt_window_3       = 15;

behaviours        = {'run', 'cast', 'stop', 'hunch', 'back', 'roll'};

for j = 1 : length(behaviours)
     behaviours_loc = behaviours{j};
    [ behaviour_proba_after_start_window_1(j,1),nb_active_larva_start_1(j,1)] = average_evolution_during_time_windows_choreography(trx_all, behaviours_loc, t_start, t_start + dt_window_1);
    [ behaviour_proba_after_start_window_2(j,1),nb_active_larva_start_2(j,1)] = average_evolution_during_time_windows_choreography(trx_all, behaviours_loc, t_start, t_start + dt_window_2);
    [ behaviour_proba_after_start_window_3(j,1),nb_active_larva_start_3(j,1)] = average_evolution_during_time_windows_choreography(trx_all, behaviours_loc, t_start, t_start + dt_window_3);
    
    
    [ behaviour_proba_after_stop_window_1(j,1), nb_active_larva_stop_1(j,1)] = average_evolution_during_time_windows_choreography(trx_all, behaviours_loc, t_stop, t_stop + dt_window_1);
    [ behaviour_proba_after_stop_window_2(j,1), nb_active_larva_stop_2(j,1)] = average_evolution_during_time_windows_choreography(trx_all, behaviours_loc, t_stop, t_stop + dt_window_2);
    [ behaviour_proba_after_stop_window_3(j,1), nb_active_larva_stop_3(j,1)] = average_evolution_during_time_windows_choreography(trx_all, behaviours_loc, t_stop, t_stop + dt_window_3);
    
end


neuron                      = trx_all(1).neuron;
protocol                    = trx_all(1).protocol;
stimuli                     = trx_all(1).stimuli;
probabilities_data.neuron   = neuron;
probabilities_data.protocol = protocol;
probabilities_data.stimuli  = stimuli;


probabilities.behaviour_proba_after_start_window_1 = behaviour_proba_after_start_window_1;
probabilities.behaviour_proba_after_start_window_2 = behaviour_proba_after_start_window_2;
probabilities.behaviour_proba_after_start_window_3 = behaviour_proba_after_start_window_3;

probabilities.nb_active_larva_start_1 = nb_active_larva_start_1;
probabilities.nb_active_larva_start_2 = nb_active_larva_start_2;
probabilities.nb_active_larva_start_3 = nb_active_larva_start_3;




probabilities.behaviour_proba_after_stop_window_1  = behaviour_proba_after_stop_window_1;
probabilities.behaviour_proba_after_stop_window_2  = behaviour_proba_after_stop_window_2;
probabilities.behaviour_proba_after_stop_window_3  = behaviour_proba_after_stop_window_3;

probabilities.nb_active_larva_stop_1 = nb_active_larva_stop_1;
probabilities.nb_active_larva_stop_2 = nb_active_larva_stop_2;
probabilities.nb_active_larva_stop_3 = nb_active_larva_stop_3;






close all force;
save('probabilities.mat', 'probabilities', 'probabilities_data') ;



end