function collect_quick_run(target_folder,rig, varargin)



cd(target_folder);
files       = subdir(fullfile(pwd,'quick_run_ness.mat'));
n_files     = length(files);
name_folder = 'screen_scale_quick_run_ness';
mkdir(name_folder);
cd(name_folder)

% behaviour                    = {'run', 'cast', 'stop', 'hunch', 'back', 'roll'};
switch lower(rig)
    case 't15'
        nn = 401;
        t  = [20:0.1:60];
    case 't5'
        nn = 651;
        t  = [35:0.1:100];
end

globale_quick_run_ness_first             = zeros(n_files,  nn  );
globale_quick_run_ness_cell_first        = cell(n_files+1, nn+1 );
globale_quick_run_ness_number_cell_first = cell(n_files+1, nn+1 );

globale_quick_run_ness_second             = zeros(n_files,  nn  );
globale_quick_run_ness_cell_second        = cell(n_files+1, nn+1 );
globale_quick_run_ness_number_cell_second = cell(n_files+1, nn+1 );

globale_quick_run_ness_cell_first{1,1} = '';
globale_quick_run_ness_number_cell_first{1,1} = '';
globale_quick_run_ness_cell_second{1,1} = '';
globale_quick_run_ness_number_cell_second{1,1} = '';

for i = 1 : nn
    globale_quick_run_ness_cell_first{1,i+1}         = num2str(t(i));
    globale_quick_run_ness_number_cell_first{1,i+1}  = num2str(t(i));
    globale_quick_run_ness_cell_second{1,i+1}        = num2str(t(i));
    globale_quick_run_ness_number_cell_second{1,i+1} = num2str(t(i));
    
end



for i = 1 : n_files
%    fprintf('%i\t %s\n', i, files(i).name); 
   load(files(i).name);
   neuron      = quick_run_ness_data.neuron;
   protocol    = quick_run_ness_data.protocol;
   stimuli     = quick_run_ness_data.stimuli;
   global_name = [neuron '_' stimuli '_' protocol]; 
   
   globale_quick_run_ness_first(i,:)                 = quick_run_ness.pure_velocity';
   globale_quick_run_ness_second(i,:)                = quick_run_ness.pure_velocity_norm';
   
   globale_quick_run_ness_cell_first{i+1,1}          = global_name;
   globale_quick_run_ness_number_cell_first{i+1,1}   = num2str(i);
   globale_quick_run_ness_cell_second{i+1,1}         = global_name;
   globale_quick_run_ness_number_cell_second{i+1,1}  = num2str(i);
   
   
   for j  = 1 : nn 
        globale_quick_run_ness_cell_first{i+1,j+1}                 = num2str(globale_quick_run_ness_first(i,j));
        globale_quick_run_ness_number_cell_first{i+1,j+1}          = num2str(globale_quick_run_ness_first(i,j));
        globale_quick_run_ness_cell_second{i+1,j+1}         = num2str(globale_quick_run_ness_second(i,j));
        globale_quick_run_ness_number_cell_second{i+1,j+1}  = num2str(globale_quick_run_ness_second(i,j));
   end
    
   clear quick_run_ness quick_run_ness_data;
    
end






[n,m]   = size(globale_quick_run_ness_cell_first);
fichier = fopen('quick_run_ness_cell_first_neurons_name.txt', 'w+');
for i = 1 : n
    for j = 1 : m
        fprintf(fichier, '%s\t', globale_quick_run_ness_cell_first{i,j} );
    end
     fprintf(fichier, '\n');
end
fclose(fichier);

[n,m]   = size(globale_quick_run_ness_cell_second);
fichier = fopen('quick_run_ness_cell_second_neurons_name.txt', 'w+');
for i = 1 : n
    for j = 1 : m
        fprintf(fichier, '%s\t', globale_quick_run_ness_cell_second{i,j} );
    end
    fprintf(fichier, '\n');
end
fclose(fichier);


[n,m]   = size(globale_quick_run_ness_number_cell_first);
fichier = fopen('quick_run_ness_cell_first_neurons_number.txt', 'w+');
for i = 1 : n
    for j = 1 : m
        fprintf(fichier, '%s\t', globale_quick_run_ness_number_cell_first{i,j} );
    end
     fprintf(fichier, '\n');
end
fclose(fichier);

[n,m]   = size(globale_quick_run_ness_number_cell_second);
fichier = fopen('quick_run_ness_cell_second_neurons_number.txt', 'w+');
for i = 1 : n
    for j = 1 : m
        fprintf(fichier, '%s\t', globale_quick_run_ness_number_cell_second{i,j} );
    end
    fprintf(fichier, '\n');
end
fclose(fichier);




save('globale_quick_run_ness_screen_scale.mat', 'globale_quick_run_ness_first', 'globale_quick_run_ness_second', ...
    'globale_quick_run_ness_cell_first', 'globale_quick_run_ness_cell_second',...
    'globale_quick_run_ness_number_cell_first', 'globale_quick_run_ness_number_cell_second');



cd(target_folder);



end