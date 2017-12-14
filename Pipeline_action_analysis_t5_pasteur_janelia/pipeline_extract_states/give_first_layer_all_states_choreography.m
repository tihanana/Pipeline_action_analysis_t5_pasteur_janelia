function trx = give_first_layer_all_states_choreography(trx, path_to_classifiers, parameters)

trx = Generate_non_states_for_all(trx, parameters);
trx = First_Layer_Classification(trx, path_to_classifiers);
trx = give_back_states_choreography(trx, path_to_classifiers, parameters);
%trx = add_amplitude_based_sub_states(trx, parameters);

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
