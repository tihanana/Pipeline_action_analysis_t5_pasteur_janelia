function trx = third_layer_specific_back_correction(trx)


trx                 = give_start_stop_actions(trx);
trx                 = generate_features_based_on_behaviour_timing_back(trx);
trx                 = give_state_choreography_internal_features(trx, [], 'back');
trx                 = give_correction_back_to_global_states(trx);
trx                 = from_global_states_to_individual_behaviours(trx);
trx                 = give_start_stop_actions(trx);


end