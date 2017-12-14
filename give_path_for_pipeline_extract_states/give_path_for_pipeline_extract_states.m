function give_path_for_pipeline_extract_states(rig,  target_folder, varargin)


warning off;

cd(target_folder);

files                        = subdir(fullfile(pwd,'*.outline'));
n_files                      = length(files);


save(['path_for_' rig '.mat'], 'files', 'n_files' );