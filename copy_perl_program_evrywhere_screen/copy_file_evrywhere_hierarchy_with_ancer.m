function copy_file_evrywhere_hierarchy_with_ancer(original_path, original_name, target_folder_high, postfix_name)

if ismac||isunix
    original_full = [original_path '/' original_name ];

    files         = subdir(fullfile(target_folder_high,['*' postfix_name]));
    n_files       = length(files);

    for i = 1 : n_files

        name      = files(i).name;
        k         = strfind(name,'/');
        copyfile(original_full, name(1:k(end)) );

    end

elseif ispc
    
     original_full = [original_path '\' original_name ];

    files         = subdir(fullfile(target_folder_high,['*' postfix_name]));
    n_files       = length(files);

    for i = 1 : n_files

        name      = files(i).name;
        k         = strfind(name,'\');
        copyfile(original_full, name(1:k(end)) );



    end   
    
end






end