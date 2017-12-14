function collect_ratio_length_hunch(target_folder, rig, varargin)


cd(target_folder);
files       = subdir(fullfile(pwd,'length_hunch_ness.mat'));
n_files     = length(files);
name_folder = 'screen_scale_ratio_length_hunch';
mkdir(name_folder);
cd(name_folder)



%%

globale_ratio_length_hunch             = zeros(n_files, 1);
globale_ratio_length_hunch_cell        = cell(n_files+1, 2);
globale_ratio_length_hunch_number_cell = cell(n_files+1, 2);



%%
globale_ratio_length_hunch_cell{1,1} = '';
globale_ratio_length_hunch_number_cell{1,1} = '';



for i = 1 : 1
    globale_ratio_length_hunch_cell{1,i+1} = 'rl';
    globale_ratio_length_hunch_number_cell{1,i+1} = 'rl';
end



for i = 1 : n_files
    
   load(files(i).name);
   neuron      = length_hunch_ness_data.neuron;
   protocol    = length_hunch_ness_data.protocol;
   stimuli     = length_hunch_ness_data.stimuli;
   global_name = [neuron '_' stimuli '_' protocol]; 
   
   globale_ratio_length_hunch(i,1)                = length_hunch_ness.ratio_l;
   globale_ratio_length_hunch_cell{i+1,1}         = global_name;
   globale_ratio_length_hunch_number_cell{i+1,1}  = num2str(i);
   
   
   for j  = 1 : 1 
       
        globale_ratio_length_hunch_cell{i+1,j+1}              = num2str(globale_ratio_length_hunch(i,j));
        globale_ratio_length_hunch_number_cell{i+1,j+1}       = num2str(globale_ratio_length_hunch(i,j));
   end
    
   clear length_hunch_ness length_hunch_ness_data;
    
end

[n,m]   = size(globale_ratio_length_hunch_cell);
fichier = fopen('length_hunch_ness_neurons_name.txt', 'w+');
for i = 1 : n
    for j = 1 : m
        fprintf(fichier, '%s\t', globale_ratio_length_hunch_cell{i,j} );
    end
     fprintf(fichier, '\n');
end
fclose(fichier);



[n,m]   = size(globale_ratio_length_hunch_number_cell);
fichier = fopen('length_hunch_ness_neurons_number.txt', 'w+');
for i = 1 : n
    for j = 1 : m
        fprintf(fichier, '%s\t', globale_ratio_length_hunch_number_cell{i,j} );
    end
     fprintf(fichier, '\n');
end
fclose(fichier);



save('globale_ratio_length_hunch_screen_scale.mat', 'globale_ratio_length_hunch',  ...
    'globale_ratio_length_hunch_cell', ...
    'globale_ratio_length_hunch_number_cell');


cd(target_folder);





end