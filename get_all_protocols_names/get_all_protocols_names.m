function get_all_protocols_names(varargin)

warning off;
rig_list = {'t0','t1','t2','t3', 't4','t5','t6','t7','t8','t9','t10','t11','t12','t13','t14','t15','t111','t150'};

%%
path_screens_mac_pro  = '/Users/massonj/Desktop/screens_in_computer';
path_screens_mac_home = '/Users/jbmasson/Desktop/screens_in_computer';
path_screens_cluster  = '/groups/zlatic/home/zlaticlab/Screens_Behaviours_Display_and_Analysis/screens';
path_screens_pasteur_cluster = '/pasteur/projets/policy02/Larva-Screen';


path_folder_protocols_mac_pro  = '/Users/massonj/Dropbox (HHMI)/Path_to_all_programs_sync_hhmi/Matlab/projet/Larva/pipeline_from_choreography_full/screen_call/output_all_names_of_protocols';
path_folder_protocols_mac_home = '/Users/jbamsson/Dropbox (HHMI)/Path_to_all_programs_sync_hhmi/Matlab/projet/Larva/pipeline_from_choreography_full/screen_call/output_all_names_of_protocols';
path_folder_protocols_cluster  = '/groups/zlatic/home/zlaticlab/Screens_Behaviours_Display_and_Analysis/pipeline_larva_all';
path_folder_protocols_pasteur_cluster  = '/pasteur/projets/policy02/Larva-Screen/pipeline_larva_all';
%%


where_am_I = pwd;
if ~isempty(strfind(where_am_I,'massonj' ))
    path_to_screens      = path_screens_mac_pro;
    path_to_protocols    = path_folder_protocols_mac_pro;
end
if ~isempty(strfind(where_am_I,'zlatic' ))
    path_to_screens      = path_screens_cluster;
    path_to_protocols    = path_folder_protocols_cluster;
    mkdir([path_to_protocols '/protocols']);
    path_to_protocols    = [path_to_protocols '/protocols'];
end
if ~isempty(strfind(where_am_I,'jbmasson' ))
    path_to_screens      = path_screens_mac_home;
    path_to_protocols    = path_folder_protocols_mac_home;
end
if ~isempty(strfind(where_am_I,'policy02' ))
    path_to_screens       = path_screens_pasteur_cluster;
    path_to_protocols     = path_folder_protocols_pasteur_cluster;
    path_to_protocols1    = [path_screens_pasteur_cluster '/screens'];
    path_to_protocols2    = [path_screens_pasteur_cluster '/rd'];
end




cd(path_to_screens);
% mkdir('protocols')

%%
for j = 1 : length(rig_list)
    cd(path_to_screens);
    
    rig_loc = rig_list{j};
    try
        
        
        
        
        
        fprintf('%s\t %s\n ', path_to_protocols1, rig_loc);
        try
            
            cd(path_to_protocols1);
            cd(rig_loc);
            files   = subdir(fullfile(pwd,'*.outline'));
            n_files1 = length(files);
            for ll = 1 : n_files1
                name      = files(ll).name;
                k         = strfind(name,'/');
                liste{ll} = name(k(end-2)+1:k(end-1)-1);
            end
        
        catch
            n_files1 = 0;
        end
        
        fprintf('%s\t %s\n ', path_to_protocols2, rig_loc);
        try
            cd(path_to_protocols2);
            cd(rig_loc);
            files   = subdir(fullfile(pwd,'*.outline'));
            n_files2 = length(files);
            for ll = 1 : n_files2
                name      = files(ll).name;
                k         = strfind(name,'/');
                liste{ll+n_files1} = name(k(end-2)+1:k(end-1)-1);
            end
                
        catch
            
            
        end
        
        
        liste = unique(liste);

        cd (path_to_protocols);
        mkdir('protocols');
        cd('protocols');
        fichier = fopen([rig_loc '.txt'],'w');
        for kk = 1 : length(liste)
           fprintf(fichier, '%s\n', liste{kk}); 
        end
        fclose(fichier);
    catch 
        fprintf('fail for rig %s\n', rig_loc);
        
    end
    
    
    
    clear liste rig_loc name files n_files;
    
end
%%





end