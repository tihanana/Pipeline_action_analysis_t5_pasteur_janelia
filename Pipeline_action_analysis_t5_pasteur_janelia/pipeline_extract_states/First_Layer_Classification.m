function trx = First_Layer_Classification(trx, path_to_classifiers)

%#function TreeBagger

name_classifier_state = {'straight', 'bend', 'curl', 'ball','straight_and_light_bend', ...
    'compressing', 'expanding','nematicking', 'denematicking',...
    'outbending', 'inbending', 'displacing',...
    'run','cast','stop','roll', 'head_wiggle', 'wiggling', 'hunch','digging', 'roll_first_instar'};

n_name_classifier = length(name_classifier_state);

for i = 1 : n_name_classifier
%     fprintf('%i\n', i);
    classifier = [path_to_classifiers name_classifier_state{i} '/classifier_' name_classifier_state{i} '.mat'];
%     fprintf('%s\n', classifier);
    load(classifier);
    if exist('index_non_RF')==1;
%       trx = give_state_specific_choreography_compressing(trx);
%         eval(['trx = give_state_specific_choreography_' name_classifier_state{i} '(trx);']);
        trx = give_give_state_specific_for_cluster(trx,name_classifier_state{i});
        clearvars -except name_classifier_state n_name_classifier i trx path_classifiers path_to_classifiers ;
    else

        index_name = ['index_' name_classifier_state{i}];
%         fprintf('%s\t %s\t %s\n ', name_classifier_state{i}, (index_name), name_classifier_state{i});
        trx        = give_state_choreography(trx, eval(name_classifier_state{i}), eval(index_name), name_classifier_state{i});
        clearvars -except name_classifier_state n_name_classifier i trx path_classifiers path_to_classifiers ;
    end
end


end
