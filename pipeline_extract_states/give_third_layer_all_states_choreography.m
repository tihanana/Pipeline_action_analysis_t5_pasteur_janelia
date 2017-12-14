function trx = give_third_layer_all_states_choreography(trx, path_to_classifiers_3)


%% new to check something
% trx = provide_third_layer_empty_specific_features(trx);
trx                 = give_start_stop_actions(trx);
behaviour_existence = check_if_behaviour_exists(trx);


n_hunch = 4;
if behaviour_existence(n_hunch,1)
    trx = third_layer_specific_hunch_correction(trx, path_to_classifiers_3);
    trx = remove_contextual_internal_features_thrid_layer(trx, 'hunch');
end

n_stop = 3;
if behaviour_existence(n_stop,1)
    trx = third_layer_specific_stop_correction(trx);
    trx = remove_contextual_internal_features_thrid_layer(trx, 'stop');
end

n_back = 5;
if  behaviour_existence(n_back,1)
    trx = third_layer_specific_back_correction(trx);
    trx = remove_contextual_internal_features_thrid_layer(trx, 'back');
end










end