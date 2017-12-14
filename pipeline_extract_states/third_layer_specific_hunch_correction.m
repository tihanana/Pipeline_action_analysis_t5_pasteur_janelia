function trx = third_layer_specific_hunch_correction(trx, path_to_classifiers_3 )

%% corret hunch classification to take unusual t15 actions 

trx                 = give_larva_length(trx);
trx                 = give_start_stop_actions(trx);
trx                 = generate_features_based_on_behaviour_timing_hunch(trx);
classifier          = [path_to_classifiers_3  'hunch.mat'];
load(classifier);
trx                 = give_state_choreography_internal_features(trx, hunch, 'hunch');
trx                 = give_correction_hunch_to_global_states(trx) ;
trx                 = from_global_states_to_individual_behaviours(trx);
trx                 = give_start_stop_actions(trx);


end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%