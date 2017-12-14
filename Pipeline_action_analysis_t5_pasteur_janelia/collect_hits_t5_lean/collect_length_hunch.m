function collect_length_hunch(target_folder, rig, varargin)


cd(target_folder);
files       = subdir(fullfile(pwd,'length_hunch_ness.mat'));
n_files     = length(files);
name_folder = 'screen_scale_length_hunch';
mkdir(name_folder);
cd(name_folder)



%%

globale_length_hunch             = zeros(n_files, 1);
globale_length_hunch_cell        = cell(n_files+1, 2);
globale_length_hunch_number_cell = cell(n_files+1, 2);



%%
globale_length_hunch_cell{1,1} = '';
globale_length_hunch_number_cell{1,1} = '';



for i = 1 : 1
    globale_length_hunch_cell{1,i+1} = 'dl';
    globale_length_hunch_number_cell{1,i+1} = 'dl';
end



for i = 1 : n_files
    
   load(files(i).name);
   neuron      = length_hunch_ness_data.neuron;
   protocol    = length_hunch_ness_data.protocol;
   stimuli     = length_hunch_ness_data.stimuli;
   global_name = [neuron '_' stimuli '_' protocol]; 
   
   if isnan(length_hunch_ness.delta_length)
       globale_length_hunch(i,1)                = 0.;
   else
       globale_length_hunch(i,1)                = length_hunch_ness.delta_length;
   end
   globale_length_hunch_cell{i+1,1}         = global_name;
   globale_length_hunch_number_cell{i+1,1}  = num2str(i);
   
   
   for j  = 1 : 1 
       
        globale_length_hunch_cell{i+1,j+1}              = num2str(globale_length_hunch(i,j));
        globale_length_hunch_number_cell{i+1,j+1}       = num2str(globale_length_hunch(i,j));
   end
    
   clear length_hunch_ness length_hunch_ness_data;
    
end

[n,m]   = size(globale_length_hunch_cell);
fichier = fopen('length_hunch_ness_neurons_name.txt', 'w+');
for i = 1 : n
    for j = 1 : m
        fprintf(fichier, '%s\t', globale_length_hunch_cell{i,j} );
    end
     fprintf(fichier, '\n');
end
fclose(fichier);



[n,m]   = size(globale_length_hunch_number_cell);
fichier = fopen('length_hunch_ness_neurons_number.txt', 'w+');
for i = 1 : n
    for j = 1 : m
        fprintf(fichier, '%s\t', globale_length_hunch_number_cell{i,j} );
    end
     fprintf(fichier, '\n');
end
fclose(fichier);



save('globale_length_hunch_screen_scale.mat', 'globale_length_hunch',  ...
    'globale_length_hunch_cell', ...
    'globale_length_hunch_number_cell');


cd(target_folder);





end