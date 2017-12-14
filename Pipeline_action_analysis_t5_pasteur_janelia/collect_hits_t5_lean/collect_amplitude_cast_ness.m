function collect_amplitude_cast_ness(target_folder, rig, varargin)


cd(target_folder);
files       = subdir(fullfile(pwd,'amplitude_cast_ness.mat'));
n_files     = length(files);
name_folder = 'screen_scale_amplitude_cast_ness';
mkdir(name_folder);
cd(name_folder)



%%

globale_amplitude_cast             = zeros(n_files, 1);
globale_amplitude_cast_cell        = cell(n_files+1, 2);
globale_amplitude_cast_number_cell = cell(n_files+1, 2);



%%
globale_amplitude_cast_cell{1,1} = '';
globale_amplitude_cast_number_cell{1,1} = '';



for i = 1 : 1
    globale_amplitude_cast_cell{1,i+1} = 'Smin';
    globale_amplitude_cast_number_cell{1,i+1} = 'Smin';
end



for i = 1 : n_files
    
   load(files(i).name);
   neuron      = amplitude_cast_ness_data.neuron;
   protocol    = amplitude_cast_ness_data.protocol;
   stimuli     = amplitude_cast_ness_data.stimuli;
   global_name = [neuron '_' stimuli '_' protocol]; 
   
   globale_amplitude_cast(i,1)                = amplitude_cast_ness.min_S;
   globale_amplitude_cast_cell{i+1,1}         = global_name;
   globale_amplitude_cast_number_cell{i+1,1}  = num2str(i);
   
   
   for j  = 1 : 1 
       
        globale_amplitude_cast_cell{i+1,j+1}              = num2str(globale_amplitude_cast(i,j));
        globale_amplitude_cast_number_cell{i+1,j+1}       = num2str(globale_amplitude_cast(i,j));
   end
    
   clear length_hunch_ness length_hunch_ness_data;
    
end

[n,m]   = size(globale_amplitude_cast_cell);
fichier = fopen('amplitude_cast_ness_neurons_name.txt', 'w+');
for i = 1 : n
    for j = 1 : m
        fprintf(fichier, '%s\t', globale_amplitude_cast_cell{i,j} );
    end
     fprintf(fichier, '\n');
end
fclose(fichier);



[n,m]   = size(globale_amplitude_cast_number_cell);
fichier = fopen('amplitude_cast_ness_neurons_number.txt', 'w+');
for i = 1 : n
    for j = 1 : m
        fprintf(fichier, '%s\t', globale_amplitude_cast_number_cell{i,j} );
    end
     fprintf(fichier, '\n');
end
fclose(fichier);



save('globale_amplitude_cast_screen_scale.mat', 'globale_amplitude_cast',  ...
    'globale_amplitude_cast_cell', ...
    'globale_amplitude_cast_number_cell');


cd(target_folder);





end