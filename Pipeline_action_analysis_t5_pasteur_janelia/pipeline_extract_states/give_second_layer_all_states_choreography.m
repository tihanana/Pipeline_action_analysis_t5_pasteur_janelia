function trx = give_second_layer_all_states_choreography(trx, path_to_classifiers, mode)


core_behaviours     = {'run' , 'cast' , 'stop' ,  'hunch','back','roll' };
core_numbers        = {1, 2, 3, 4, 5, 6, -1};

switch lower(mode)
    
    case 'hierarchy'
        trx = Second_Layer_Classification(trx, path_to_classifiers);
        trx = enforce_hierarchy(trx);
        trx = give_global_states(trx, core_behaviours, core_numbers);
%         trx = generate_number_sequence(trx);
        
    case 'all'

        trx = Second_Layer_Classification_All(trx, path_to_classifiers);
        trx = from_global_states_to_individual_behaviours(trx);
%         trx = generate_number_sequence(trx);

end