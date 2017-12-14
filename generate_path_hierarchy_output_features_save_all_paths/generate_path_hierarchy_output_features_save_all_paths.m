function full_path = generate_path_hierarchy_output_features_save_all_paths(target_folder, rig, varargin)
warning off;

cd(target_folder);

path_folder_protocols_mac_pro  = '/Users/massonj/Dropbox (HHMI)/Path_to_all_programs_sync_hhmi/Matlab/projet/Larva/pipeline_from_choreography_full/screen_call/output_all_names_of_protocols';
path_folder_protocols_mac_home = '/Users/jbmasson/Dropbox (HHMI)/Path_to_all_programs_sync_hhmi/Matlab/projet/Larva/pipeline_from_choreography_full/screen_call/output_all_names_of_protocols';
path_folder_protocols_cluster  = '/groups/zlatic/home/zlaticlab/Screens_Behaviours_Display_and_Analysis/pipeline_larva_all/protocols';
path_folder_protocols_cluster_pasteur  = '/pasteur/projets/policy02/Larva-Screen/pipeline_larva_all/protocols';


where_am_I = pwd;
if ~isempty(strfind(where_am_I,'massonj' ))
    path_to_protocols    = path_folder_protocols_mac_pro;
end
if ~isempty(strfind(where_am_I,'zlatic' ))
    path_to_protocols    = path_folder_protocols_cluster;
end
if ~isempty(strfind(where_am_I,'jbmasson' ))
    path_to_protocols    = path_folder_protocols_mac_home;
end

if ~isempty(strfind(where_am_I,'Volumes' ))
    path_to_protocols    = path_folder_protocols_mac_home;
end

if ~isempty(strfind(where_am_I,'policy' ))
    path_to_protocols    = path_folder_protocols_cluster_pasteur;
end


fprintf('%s\n',  path_to_protocols);
% cd(target_folder);

prefix = importdata([path_to_protocols '/' rig '.txt']);
files = subdir(fullfile(pwd,'trx_with_*'));
n_files = length(files);
n_prefix = length(prefix);
indice = 1;
for i = 1 : n_files
    for j = 1 : n_prefix
        name             = files(i).name;
        k                = strfind(name, '/');
        files2{indice,1} = [name(1:k(end-2)) prefix{j} '/'];
        indice = indice + 1;
    end
end
full_path = unique(files2);
full_path = check_existing_path(full_path);
path = full_path;
cd(target_folder);
save(['path_' rig '.mat'], 'path');

end
