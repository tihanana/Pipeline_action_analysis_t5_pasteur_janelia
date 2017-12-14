function collect_derivatives(target_folder, rig, varargin)



cd(target_folder);
files       = subdir(fullfile(pwd,'derivatives.mat'));
n_files     = length(files);
name_folder = 'screen_scale_derivatives';
mkdir(name_folder);
cd(name_folder)

behaviour                             = {'run', 'cast', 'stop', 'hunch', 'back', 'roll'};
globale_derivatives_start             = zeros(n_files, 6);
globale_derivatives_start_cell        = cell(n_files+1, 7);
globale_derivatives_start_number_cell = cell(n_files+1, 7);

globale_derivatives_stop              = zeros(n_files, 6);
globale_derivatives_stop_cell         = cell(n_files+1, 7);
globale_derivatives_stop_number_cell  = cell(n_files+1, 7);



globale_derivatives_start_cell{1,1} = '';
globale_derivatives_stop_cell{1,1} = '';
globale_derivatives_start_number_cell{1,1} = '';
globale_derivatives_stop_number_cell{1,1} = '';
for i = 1 : 6
    globale_derivatives_start_cell{1,i+1} = behaviour{i};
    globale_derivatives_stop_cell{1,i+1} = behaviour{i};
    globale_derivatives_start_number_cell{1,i+1} = behaviour{i};
    globale_derivatives_stop_number_cell{1,i+1} = behaviour{i};
end



for i = 1 : n_files
    
   load(files(i).name);
   neuron      = derivatives_data.neuron;
   protocol    = derivatives_data.protocol;
   stimuli     = derivatives_data.stimuli;
   global_name = [neuron '_' stimuli '_' protocol]; 
   
   globale_derivatives_start(i,1)   = derivatives.start_run;
   globale_derivatives_start(i,2)   = derivatives.start_cast;
   globale_derivatives_start(i,3)   = derivatives.start_stop;
   globale_derivatives_start(i,4)   = derivatives.start_hunch;
   globale_derivatives_start(i,5)   = derivatives.start_back;
   globale_derivatives_start(i,6)   = derivatives.start_roll;
   
   globale_derivatives_stop(i,1)   = derivatives.stop_run;
   globale_derivatives_stop(i,2)   = derivatives.stop_cast;
   globale_derivatives_stop(i,3)   = derivatives.stop_stop;
   globale_derivatives_stop(i,4)   = derivatives.stop_hunch;
   globale_derivatives_stop(i,5)   = derivatives.stop_back;
   globale_derivatives_stop(i,6)   = derivatives.stop_roll;
   
   globale_derivatives_start_cell{i+1,1}        = global_name;
   globale_derivatives_start_number_cell{i+1,1} = num2str(i);
   globale_derivatives_stop_cell{i+1,1}         = global_name;
   globale_derivatives_stop_number_cell{i+1,1}  = num2str(i);
   
   
   for j  = 1 : 6 
        globale_derivatives_start_cell{i+1,j+1}        = num2str(globale_derivatives_start(i,j));
        globale_derivatives_start_number_cell{i+1,j+1} = num2str(globale_derivatives_start(i,j));
        globale_derivatives_stop_cell{i+1,j+1}         = num2str(globale_derivatives_stop(i,j));
        globale_derivatives_stop_number_cell{i+1,j+1}  = num2str(globale_derivatives_stop(i,j));
   end
    
   clear derivatives derivatives_data;
    
end

[n,m]   = size(globale_derivatives_start_cell);
fichier = fopen('derivatives_behaviour_start_neurons_name.txt', 'w+');
for i = 1 : n
    for j = 1 : m
        fprintf(fichier, '%s\t', globale_derivatives_start_cell{i,j} );
    end
     fprintf(fichier, '\n');
end
fclose(fichier);

[n,m]   = size(globale_derivatives_stop_cell);
fichier = fopen('derivatives_behaviour_stop_neurons_name.txt', 'w+');
for i = 1 : n
    for j = 1 : m
        fprintf(fichier, '%s\t', globale_derivatives_stop_cell{i,j} );
    end
    fprintf(fichier, '\n');
end
fclose(fichier);


[n,m]   = size(globale_derivatives_start_number_cell);
fichier = fopen('derivatives_behaviour_start_neurons_number.txt', 'w+');
for i = 1 : n
    for j = 1 : m
        fprintf(fichier, '%s\t', globale_derivatives_start_number_cell{i,j} );
    end
     fprintf(fichier, '\n');
end
fclose(fichier);

[n,m]   = size(globale_derivatives_stop_number_cell);
fichier = fopen('derivatives_behaviour_stop_neurons_number.txt', 'w+');
for i = 1 : n
    for j = 1 : m
        fprintf(fichier, '%s\t', globale_derivatives_stop_number_cell{i,j} );
    end
    fprintf(fichier, '\n');
end
fclose(fichier);




save('globale_derivatives_screen_scale.mat', 'globale_derivatives_start', 'globale_derivatives_stop', ...
    'globale_derivatives_start_cell', 'globale_derivatives_stop_cell',...
    'globale_derivatives_start_number_cell', 'globale_derivatives_stop_number_cell');


cd(target_folder);




end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%