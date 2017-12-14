function trx = Second_Layer_Classification(trx, path_to_classifiers )



core_behaviours     = {'run' , 'cast' , 'stop' ,  'hunch','back','roll' };
core_numbers        = {1, 2, 3, 4, 5, 6, -1};

behaviours          = {'stop', 'roll', 'hunch', 'back', 'cast'};
index_names         = {'index_stop', 'index_roll', 'index_hunch', 'index_back', 'index_cast'};


n_behaviours        = length(behaviours);

for i = 1 :n_behaviours;
    classifier = [path_to_classifiers  behaviours{i} '.mat'];
    load(classifier);
    trx        = give_state_choreography_3_steps(trx, eval(behaviours{i}), eval(index_names{i}), behaviours{i});
end



% switch lower(mode)
% 
% case 'one'
%     for i = 1 : n_behaviours;
%         classifier = [path_to_classifiers name_classifier_state{i} '/classifier_' name_classifier_state{i} '.mat'];
%         load(behaviours{i});
%         trx        = give_state_choreography(trx, eval(behaviours{i}), eval(index_names{i}), behaviours{i});
%     end
%     trx        = enforce_hierarchy(trx, behaviours);
%     trx        = give_global_states(trx, core_behaviours, core_numbers);
%     % trx        = switch_one_state_to_standard_for_visualization(trx,state);
%     save(['test_vizualize_second_layer_1_steps'], 'trx');
% 
% case 'three'
%     for i = 1 :n_behaviours;
%         load(behaviours{i});
%         trx        = give_state_choreography_3_steps(trx, eval(behaviours{i}), eval(index_names{i}), behaviours{i});
%     end
%     trx        = enforce_hierarchy(trx, behaviours);
%     trx        = give_global_states(trx, core_behaviours, core_numbers);
%     % trx        = switch_one_state_to_standard_for_visualization(trx,state);
%     save(['test_vizualize_second_layer_3_steps'], 'trx');
% end
% 





end