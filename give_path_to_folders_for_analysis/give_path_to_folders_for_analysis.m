function give_path_to_folders_for_analysis( rig, target_folder, varargin)


cd(target_folder);

path                             = generate_path_hierarchy_output_features(rig);
n_path                           = length(path);

save(['path_to_global_folders_for_' rig '.mat'], 'path', 'n_path' );




end