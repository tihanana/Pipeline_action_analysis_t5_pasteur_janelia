function pipeline_extract_states( i,rig,  target_folder, varargin)
warning off;
%% parameters linked to rig
parameters               = generate_parameters_larva_screen(rig);

% % path to classifiers
% path_home_janelia        = '/Users/massonj/Dropbox (HHMI)/Path_to_all_programs_sync_hhmi/Matlab/projet/Larva/pipeline_from_choreography_full/Classifier_first_layer_RF/';
% path_home_mac            = '/Users/jbmasson/Dropbox (HHMI)/Path_to_all_programs_sync_hhmi/Matlab/projet/Larva/pipeline_from_choreography_full/Classifier_first_layer_RF/';
% path_cluster_janelia     = '/groups/zlatic/home/zlaticlab/Screens_Behaviours_Display_and_Analysis/pipeline_larva_all/Classifier_first_layer_RF/';

path_home_janelia_1        = '/Users/massonj/Dropbox (HHMI)/Path_to_all_programs_sync_hhmi/Matlab/projet/Larva/pipeline_from_choreography_full/Classifier_first_layer_RF_compact/';
path_home_mac_1            = '/Users/jbmasson/Dropbox (HHMI)/Path_to_all_programs_sync_hhmi/Matlab/projet/Larva/pipeline_from_choreography_full/Classifier_first_layer_RF_compact/';
path_cluster_janelia_1     = '/groups/zlatic/home/zlaticlab/Screens_Behaviours_Display_and_Analysis/pipeline_larva_all/Classifier_first_layer_RF_compact/';
path_tars_1                = '/pasteur/projets/policy02/Larva-Screen/pipeline_larva_all/Classifier_first_layer_RF_compact/';
% path_cluster_jb_1          =


path_home_janelia_2        = '/Users/massonj/Dropbox (HHMI)/Path_to_all_programs_sync_hhmi/Matlab/projet/Larva/pipeline_from_choreography_full/Classifier_second_layer_RF_compact/';
path_home_mac_2            = '/Users/jbmasson/Dropbox (HHMI)/Path_to_all_programs_sync_hhmi/Matlab/projet/Larva/pipeline_from_choreography_full/Classifier_second_layer_RF_compact/';
path_cluster_janelia_2     = '/groups/zlatic/home/zlaticlab/Screens_Behaviours_Display_and_Analysis/pipeline_larva_all/Classifier_second_layer_RF_compact/';
path_tars_2                = '/pasteur/projets/policy02/Larva-Screen/pipeline_larva_all/Classifier_second_layer_RF_compact/';


path_home_janelia_3        = '/Users/massonj/Dropbox (HHMI)/Path_to_all_programs_sync_hhmi/Matlab/projet/Larva/pipeline_from_choreography_full/Classifier_third_layer_RF_compact/';
path_home_mac_3            = '/Users/jbmasson/Dropbox (HHMI)/Path_to_all_programs_sync_hhmi/Matlab/projet/Larva/pipeline_from_choreography_full/Classifier_third_layer_RF_compact/';
path_cluster_janelia_3     = '/groups/zlatic/home/zlaticlab/Screens_Behaviours_Display_and_Analysis/pipeline_larva_all/Classifier_third_layer_RF_compact/';
path_tars_3                = '/pasteur/projets/policy02/Larva-Screen/pipeline_larva_all/Classifier_third_layer_RF_compact/';






where_am_I = pwd;
if ~isempty(strfind(where_am_I,'massonj' ))
    path_to_classifiers_1      =  path_home_janelia_1;
    path_to_classifiers_2      =  path_home_janelia_2;
    path_to_classifiers_3      =  path_home_janelia_3;
end
if ~isempty(strfind(where_am_I,'zlatic' ))
    path_to_classifiers_1      =  path_cluster_janelia_1;
    path_to_classifiers_2      =  path_cluster_janelia_2;
    path_to_classifiers_3      =  path_cluster_janelia_3;
    
end
if ~isempty(strfind(where_am_I,'/Users/jbmasson' ))
    path_to_classifiers_1      =  path_home_mac_1;
    path_to_classifiers_2      =  path_home_mac_2;
    path_to_classifiers_3      =  path_home_mac_3;   
end


if ~isempty(strfind(where_am_I,'/pasteur/' ))
    path_to_classifiers_1      =  path_tars_1;
    path_to_classifiers_2      =  path_tars_2;
    path_to_classifiers_3      =  path_tars_3;   
end




%% start and go to folder
if ischar(i)
     i = str2num(i);
end
if (nargin==3)
    cd(target_folder)
end

%% behaviours
% conversion_behaviours = {'run', 'A'; 'cast', 'B'; 'stop', 'c'; 'roll', 'D'; ...
%     'hunch', 'E'; 'back', 'F'; 'wiggling', 'G'; 'DIG', 'H'; 'run_and_stop', 'I'; ...
%     'strong_hunch', 'J'};


%% extract usefull parameters
t_min                        = parameters.t_stimuli_min;
t_max                        = parameters.t_stimuli_max;
list_designation             = parameters.list_designation;
list_behaviour               = parameters.list_behaviour;
list_rig_dependent_behaviour = parameters.list_rig_dependent_behaviour ;

name_states_full             = [list_designation , list_behaviour , list_rig_dependent_behaviour];
name_fichier_states_full     = 'behaviroural_states';
column_head_name_full        = [{'rig', 'neuron', 'effector', 'protocol', 'date', 'number', 't' }, name_states_full  ];

nb                           = 6;
t_min_num                    = num2str(t_min);
t_max_num                    = num2str(t_max);

name_path = ['path_for_' rig '.mat'];

try
    load(name_path);
catch
    files                        = subdir(fullfile(pwd,'*.outline'));
    n_files                      = length(files);
end

mode                         = 'all';

if (i<=n_files)
    
%     try
    name      = files(i).name;
    k         = strfind(name,'/');
    cd(name(1:k(end)));
    fprintf('%i\n', i);

    trx  = load_spine_contour();
    trx  = clean_larvae(trx);
         
    if isempty(trx)
        
    else

        trx = generate_minimal_estimators_full_choreography(trx, rig);
        trx = give_first_layer_all_states_choreography(trx, path_to_classifiers_1, parameters);
        trx = give_second_layer_empiral_rules(trx); %% usefull for old estimations, useless now but quick;
        trx = give_second_layer_all_states_choreography(trx, path_to_classifiers_2, mode);
        trx = regularize_singular_events(trx); %% regularize patterns: 101; 123  
        trx = give_third_layer_all_states_choreography(trx, path_to_classifiers_3);
        trx = give_larva_length_pure(trx);
        %         
        
        
        
        save(['trx_with_states.mat'], 'trx');        
        delete('*.contour'); 
        
    end
%     catch
%         fprintf('%s\n',name(1:k(end)));
%     end
end
cd(target_folder);

end
