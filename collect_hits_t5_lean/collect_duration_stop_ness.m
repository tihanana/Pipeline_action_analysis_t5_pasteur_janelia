function collect_duration_stop_ness(target_folder, rig, varargin)


cd(target_folder);
files       = subdir(fullfile(pwd,'duration_stop_ness.mat'));
n_files     = length(files);
name_folder = 'screen_scale_duration_stop_ness';
mkdir(name_folder);
cd(name_folder)



%%

globale_duration_stop             = zeros(n_files, 1);
globale_duration_stop_cell        = cell(n_files+1, 2);
globale_duration_stop_number_cell = cell(n_files+1, 2);



%%
globale_duration_stop_cell{1,1} = '';
globale_duration_stop_number_cell{1,1} = '';



for i = 1 : 1
    globale_duration_stop_cell{1,i+1} = 'dt';
    globale_duration_stop_number_cell{1,i+1} = 'dt';
end



for i = 1 : n_files
    
   load(files(i).name);
   neuron      = duration_stop_ness_data.neuron;
   protocol    = duration_stop_ness_data.protocol;
   stimuli     = duration_stop_ness_data.stimuli;
   global_name = [neuron '_' stimuli '_' protocol]; 
   
   globale_duration_stop(i,1)                = duration_stop_ness.duration_S;
   globale_duration_stop_cell{i+1,1}         = global_name;
   globale_duration_stop_number_cell{i+1,1}  = num2str(i);
   
   
   for j  = 1 : 1 
       
        globale_duration_stop_cell{i+1,j+1}              = num2str(globale_duration_stop(i,j));
        globale_duration_stop_number_cell{i+1,j+1}       = num2str(globale_duration_stop(i,j));
   end
    
   clear length_hunch_ness length_hunch_ness_data;
    
end

[n,m]   = size(globale_duration_stop_cell);
fichier = fopen('duration_stop_ness_neurons_name.txt', 'w+');
for i = 1 : n
    for j = 1 : m
        fprintf(fichier, '%s\t', globale_duration_stop_cell{i,j} );
    end
     fprintf(fichier, '\n');
end
fclose(fichier);



[n,m]   = size(globale_duration_stop_number_cell);
fichier = fopen('duration_stop_ness_neurons_number.txt', 'w+');
for i = 1 : n
    for j = 1 : m
        fprintf(fichier, '%s\t', globale_duration_stop_number_cell{i,j} );
    end
     fprintf(fichier, '\n');
end
fclose(fichier);



save('globale_duration_stop_screen_scale.mat', 'globale_duration_stop',  ...
    'globale_duration_stop_cell', ...
    'globale_duration_stop_number_cell');


cd(target_folder);





end