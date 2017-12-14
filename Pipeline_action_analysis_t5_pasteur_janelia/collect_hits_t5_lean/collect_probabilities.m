function collect_probabilities(target_folder, rig ,varargin)


cd(target_folder);
files       = subdir(fullfile(pwd,'probabilities.mat'));
n_files     = length(files);
name_folder = 'screen_scale_probabilities';
mkdir(name_folder);
cd(name_folder)



behaviour                             = {'run', 'cast', 'stop', 'hunch', 'back', 'roll'};
globale_probabilities_start_window_1             = zeros(n_files, 6);
globale_probabilities_start_window_1_cell        = cell(n_files+1, 7);
globale_probabilities_start_window_1_number_cell = cell(n_files+1, 7);

globale_probabilities_start_window_2             = zeros(n_files, 6);
globale_probabilities_start_window_2_cell        = cell(n_files+1, 7);
globale_probabilities_start_window_2_number_cell = cell(n_files+1, 7);

globale_probabilities_start_window_3             = zeros(n_files, 6);
globale_probabilities_start_window_3_cell        = cell(n_files+1, 7);
globale_probabilities_start_window_3_number_cell = cell(n_files+1, 7);


globale_probabilities_stop_window_1              = zeros(n_files, 6);
globale_probabilities_stop_window_1_cell         = cell(n_files+1, 7);
globale_probabilities_stop_window_1_number_cell  = cell(n_files+1, 7);

globale_probabilities_stop_window_2              = zeros(n_files, 6);
globale_probabilities_stop_window_2_cell         = cell(n_files+1, 7);
globale_probabilities_stop_window_2_number_cell  = cell(n_files+1, 7);

globale_probabilities_stop_window_3              = zeros(n_files, 6);
globale_probabilities_stop_window_3_cell         = cell(n_files+1, 7);
globale_probabilities_stop_window_3_number_cell  = cell(n_files+1, 7);


globale_probabilities_start_window_1_cell{1,1} = '';
globale_probabilities_start_window_2_cell{1,1} = '';
globale_probabilities_start_window_3_cell{1,1} = '';

globale_probabilities_stop_window_1_cell{1,1} = '';
globale_probabilities_stop_window_2_cell{1,1} = '';
globale_probabilities_stop_window_3_cell{1,1} = '';


globale_probabilities_start_window_1_number_cell{1,1} = '';
globale_probabilities_start_window_2_number_cell{1,1} = '';
globale_probabilities_start_window_3_number_cell{1,1} = '';

globale_probabilities_stop_window_1_number_cell{1,1} = '';
globale_probabilities_stop_window_2_number_cell{1,1} = '';
globale_probabilities_stop_window_3_number_cell{1,1} = '';


for i = 1 : 6
    globale_probabilities_start_window_1_cell{1,i+1} = behaviour{i};
    globale_probabilities_start_window_2_cell{1,i+1} = behaviour{i};
    globale_probabilities_start_window_3_cell{1,i+1} = behaviour{i};
    
    globale_probabilities_stop_window_1_cell{1,i+1} = behaviour{i};
    globale_probabilities_stop_window_2_cell{1,i+1} = behaviour{i};
    globale_probabilities_stop_window_3_cell{1,i+1} = behaviour{i};
    
    globale_probabilities_start_window_1_number_cell{1,i+1} = behaviour{i};
    globale_probabilities_start_window_2_number_cell{1,i+1} = behaviour{i};
    globale_probabilities_start_window_3_number_cell{1,i+1} = behaviour{i};
    
    globale_probabilities_stop_window_1_number_cell{1,i+1} = behaviour{i};
    globale_probabilities_stop_window_2_number_cell{1,i+1} = behaviour{i};
    globale_probabilities_stop_window_3_number_cell{1,i+1} = behaviour{i};

end



for i = 1 : n_files
    
   load(files(i).name);
   neuron      = probabilities_data.neuron;
   protocol    = probabilities_data.protocol;
   stimuli     = probabilities_data.stimuli;
   global_name = [neuron '_' stimuli '_' protocol]; 
   
   globale_probabilities_start_window_1(i,1)   = probabilities.behaviour_proba_after_start_window_1(1);
   globale_probabilities_start_window_1(i,2)   = probabilities.behaviour_proba_after_start_window_1(2);
   globale_probabilities_start_window_1(i,3)   = probabilities.behaviour_proba_after_start_window_1(3);
   globale_probabilities_start_window_1(i,4)   = probabilities.behaviour_proba_after_start_window_1(4);
   globale_probabilities_start_window_1(i,5)   = probabilities.behaviour_proba_after_start_window_1(5);
   globale_probabilities_start_window_1(i,6)   = probabilities.behaviour_proba_after_start_window_1(6);
   
   globale_probabilities_start_window_2(i,1)   = probabilities.behaviour_proba_after_start_window_2(1);
   globale_probabilities_start_window_2(i,2)   = probabilities.behaviour_proba_after_start_window_2(2);
   globale_probabilities_start_window_2(i,3)   = probabilities.behaviour_proba_after_start_window_2(3);
   globale_probabilities_start_window_2(i,4)   = probabilities.behaviour_proba_after_start_window_2(4);
   globale_probabilities_start_window_2(i,5)   = probabilities.behaviour_proba_after_start_window_2(5);
   globale_probabilities_start_window_2(i,6)   = probabilities.behaviour_proba_after_start_window_2(6);
   
   globale_probabilities_start_window_3(i,1)   = probabilities.behaviour_proba_after_start_window_3(1);
   globale_probabilities_start_window_3(i,2)   = probabilities.behaviour_proba_after_start_window_3(2);
   globale_probabilities_start_window_3(i,3)   = probabilities.behaviour_proba_after_start_window_3(3);
   globale_probabilities_start_window_3(i,4)   = probabilities.behaviour_proba_after_start_window_3(4);
   globale_probabilities_start_window_3(i,5)   = probabilities.behaviour_proba_after_start_window_3(5);
   globale_probabilities_start_window_3(i,6)   = probabilities.behaviour_proba_after_start_window_3(6);
   
   globale_probabilities_stop_window_1(i,1)   = probabilities.behaviour_proba_after_stop_window_1(1);
   globale_probabilities_stop_window_1(i,2)   = probabilities.behaviour_proba_after_stop_window_1(2);
   globale_probabilities_stop_window_1(i,3)   = probabilities.behaviour_proba_after_stop_window_1(3);
   globale_probabilities_stop_window_1(i,4)   = probabilities.behaviour_proba_after_stop_window_1(4);
   globale_probabilities_stop_window_1(i,5)   = probabilities.behaviour_proba_after_stop_window_1(5);
   globale_probabilities_stop_window_1(i,6)   = probabilities.behaviour_proba_after_stop_window_1(6);
   
   globale_probabilities_stop_window_2(i,1)   = probabilities.behaviour_proba_after_stop_window_2(1);
   globale_probabilities_stop_window_2(i,2)   = probabilities.behaviour_proba_after_stop_window_2(2);
   globale_probabilities_stop_window_2(i,3)   = probabilities.behaviour_proba_after_stop_window_2(3);
   globale_probabilities_stop_window_2(i,4)   = probabilities.behaviour_proba_after_stop_window_2(4);
   globale_probabilities_stop_window_2(i,5)   = probabilities.behaviour_proba_after_stop_window_2(5);
   globale_probabilities_stop_window_2(i,6)   = probabilities.behaviour_proba_after_stop_window_2(6);
      
   globale_probabilities_stop_window_3(i,1)   = probabilities.behaviour_proba_after_stop_window_3(1);
   globale_probabilities_stop_window_3(i,2)   = probabilities.behaviour_proba_after_stop_window_3(2);
   globale_probabilities_stop_window_3(i,3)   = probabilities.behaviour_proba_after_stop_window_3(3);
   globale_probabilities_stop_window_3(i,4)   = probabilities.behaviour_proba_after_stop_window_3(4);
   globale_probabilities_stop_window_3(i,5)   = probabilities.behaviour_proba_after_stop_window_3(5);
   globale_probabilities_stop_window_3(i,6)   = probabilities.behaviour_proba_after_stop_window_3(6);
   
   
   globale_probabilities_start_window_1_cell{i+1,1}        = global_name;
   globale_probabilities_start_window_2_cell{i+1,1}        = global_name;
   globale_probabilities_start_window_3_cell{i+1,1}        = global_name;
   globale_probabilities_start_window_1_number_cell{i+1,1} = num2str(i);
   globale_probabilities_start_window_2_number_cell{i+1,1} = num2str(i);
   globale_probabilities_start_window_3_number_cell{i+1,1} = num2str(i);
   globale_probabilities_stop_window_1_cell{i+1,1}         = global_name;
   globale_probabilities_stop_window_2_cell{i+1,1}         = global_name;
   globale_probabilities_stop_window_3_cell{i+1,1}         = global_name;
   globale_probabilities_stop_window_1_number_cell{i+1,1}  = num2str(i);
   globale_probabilities_stop_window_2_number_cell{i+1,1}  = num2str(i);
   globale_probabilities_stop_window_3_number_cell{i+1,1}  = num2str(i);
   
   for j  = 1 : 6 
        globale_probabilities_start_window_1_cell{i+1,j+1}        = num2str(globale_probabilities_start_window_1(i,j));
        globale_probabilities_start_window_2_cell{i+1,j+1}        = num2str(globale_probabilities_start_window_2(i,j));
        globale_probabilities_start_window_3_cell{i+1,j+1}        = num2str(globale_probabilities_start_window_3(i,j));
        
        
        globale_probabilities_start_window_1_number_cell{i+1,j+1} = num2str(globale_probabilities_start_window_1(i,j));
        globale_probabilities_start_window_2_number_cell{i+1,j+1} = num2str(globale_probabilities_start_window_2(i,j));
        globale_probabilities_start_window_3_number_cell{i+1,j+1} = num2str(globale_probabilities_start_window_3(i,j));
        
        
        globale_probabilities_stop_window_1_cell{i+1,j+1}         = num2str(globale_probabilities_stop_window_1(i,j));
        globale_probabilities_stop_window_2_cell{i+1,j+1}         = num2str(globale_probabilities_stop_window_2(i,j));
        globale_probabilities_stop_window_3_cell{i+1,j+1}         = num2str(globale_probabilities_stop_window_3(i,j));
        
        
        globale_probabilities_stop_window_1_number_cell{i+1,j+1}  = num2str(globale_probabilities_stop_window_1(i,j));
        globale_probabilities_stop_window_2_number_cell{i+1,j+1}  = num2str(globale_probabilities_stop_window_2(i,j));
        globale_probabilities_stop_window_3_number_cell{i+1,j+1}  = num2str(globale_probabilities_stop_window_3(i,j));
   
   end
    
   clear probabilities probabilities_data;
    
end
%%
[n,m]   = size(globale_probabilities_start_window_1_cell);
fichier = fopen('probabilities_behaviour_start_window_1_neurons_name.txt', 'w+');
for i = 1 : n
    for j = 1 : m
        fprintf(fichier, '%s\t', globale_probabilities_start_window_1_cell{i,j} );
    end
     fprintf(fichier, '\n');
end
fclose(fichier);

[n,m]   = size(globale_probabilities_stop_window_1_cell);
fichier = fopen('probabilities_behaviour_stop_window_1_neurons_name.txt', 'w+');
for i = 1 : n
    for j = 1 : m
        fprintf(fichier, '%s\t', globale_probabilities_stop_window_1_cell{i,j} );
    end
    fprintf(fichier, '\n');
end
fclose(fichier);

[n,m]   = size(globale_probabilities_start_window_2_cell);
fichier = fopen('probabilities_behaviour_start_window_2_neurons_name.txt', 'w+');
for i = 1 : n
    for j = 1 : m
        fprintf(fichier, '%s\t', globale_probabilities_start_window_2_cell{i,j} );
    end
     fprintf(fichier, '\n');
end
fclose(fichier);

[n,m]   = size(globale_probabilities_stop_window_2_cell);
fichier = fopen('probabilities_behaviour_stop_window_2_neurons_name.txt', 'w+');
for i = 1 : n
    for j = 1 : m
        fprintf(fichier, '%s\t', globale_probabilities_stop_window_2_cell{i,j} );
    end
    fprintf(fichier, '\n');
end
fclose(fichier);


[n,m]   = size(globale_probabilities_start_window_3_cell);
fichier = fopen('probabilities_behaviour_start_window_3_neurons_name.txt', 'w+');
for i = 1 : n
    for j = 1 : m
        fprintf(fichier, '%s\t', globale_probabilities_start_window_3_cell{i,j} );
    end
     fprintf(fichier, '\n');
end
fclose(fichier);

[n,m]   = size(globale_probabilities_stop_window_3_cell);
fichier = fopen('probabilities_behaviour_stop_window_3_neurons_name.txt', 'w+');
for i = 1 : n
    for j = 1 : m
        fprintf(fichier, '%s\t', globale_probabilities_stop_window_3_cell{i,j} );
    end
    fprintf(fichier, '\n');
end
fclose(fichier);
%%


[n,m]   = size(globale_probabilities_start_window_1_number_cell);
fichier = fopen('probabilities_behaviour_start_window_1_neurons_number.txt', 'w+');
for i = 1 : n
    for j = 1 : m
        fprintf(fichier, '%s\t', globale_probabilities_start_window_1_number_cell{i,j} );
    end
     fprintf(fichier, '\n');
end
fclose(fichier);

[n,m]   = size(globale_probabilities_stop_window_1_number_cell);
fichier = fopen('probabilities_behaviour_stop_window_1_neurons_number.txt', 'w+');
for i = 1 : n
    for j = 1 : m
        fprintf(fichier, '%s\t', globale_probabilities_stop_window_1_number_cell{i,j} );
    end
    fprintf(fichier, '\n');
end
fclose(fichier);

[n,m]   = size(globale_probabilities_start_window_2_number_cell);
fichier = fopen('probabilities_behaviour_start_window_2_neurons_number.txt', 'w+');
for i = 1 : n
    for j = 1 : m
        fprintf(fichier, '%s\t', globale_probabilities_start_window_2_number_cell{i,j} );
    end
     fprintf(fichier, '\n');
end
fclose(fichier);

[n,m]   = size(globale_probabilities_stop_window_2_number_cell);
fichier = fopen('probabilities_behaviour_stop_window_2_neurons_number.txt', 'w+');
for i = 1 : n
    for j = 1 : m
        fprintf(fichier, '%s\t', globale_probabilities_stop_window_2_number_cell{i,j} );
    end
    fprintf(fichier, '\n');
end
fclose(fichier);




[n,m]   = size(globale_probabilities_start_window_3_number_cell);
fichier = fopen('probabilities_behaviour_start_window_3_neurons_number.txt', 'w+');
for i = 1 : n
    for j = 1 : m
        fprintf(fichier, '%s\t', globale_probabilities_start_window_3_number_cell{i,j} );
    end
     fprintf(fichier, '\n');
end
fclose(fichier);

[n,m]   = size(globale_probabilities_stop_window_3_number_cell);
fichier = fopen('probabilities_behaviour_stop_window_3_neurons_number.txt', 'w+');
for i = 1 : n
    for j = 1 : m
        fprintf(fichier, '%s\t', globale_probabilities_stop_window_3_number_cell{i,j} );
    end
    fprintf(fichier, '\n');
end
fclose(fichier);
%%


save('globale_probabilities_screen_scale.mat'          , ...
    'globale_probabilities_start_window_1'             , 'globale_probabilities_start_window_2'             , 'globale_probabilities_start_window_3'             ,...
    'globale_probabilities_stop_window_1'              , 'globale_probabilities_stop_window_2'              , 'globale_probabilities_stop_window_3'              ,...
    'globale_probabilities_start_window_1_cell'        , 'globale_probabilities_start_window_2_cell'        , 'globale_probabilities_start_window_3_cell'        ,... 
    'globale_probabilities_stop_window_1_cell'         , 'globale_probabilities_stop_window_2_cell'         , 'globale_probabilities_stop_window_3_cell'         ,...
    'globale_probabilities_start_window_1_number_cell' , 'globale_probabilities_start_window_2_number_cell' , 'globale_probabilities_start_window_3_number_cell' ,...
    'globale_probabilities_stop_window_1_number_cell'  , 'globale_probabilities_stop_window_2_number_cell'  , 'globale_probabilities_stop_window_3_number_cell') ;


cd(target_folder);














end