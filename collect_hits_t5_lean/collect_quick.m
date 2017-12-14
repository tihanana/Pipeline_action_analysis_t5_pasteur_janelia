function collect_quick(target_folder,rig, varargin)



cd(target_folder);
files       = subdir(fullfile(pwd,'quickness.mat'));
n_files     = length(files);
name_folder = 'screen_scale_quickness';
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

globale_quickness_first             = zeros(n_files,  nn  );
globale_quickness_cell_first        = cell(n_files+1, nn+1 );
globale_quickness_number_cell_first = cell(n_files+1, nn+1 );

globale_quickness_second             = zeros(n_files,  nn  );
globale_quickness_cell_second        = cell(n_files+1, nn+1 );
globale_quickness_number_cell_second = cell(n_files+1, nn+1 );

globale_quickness_cell_first{1,1} = '';
globale_quickness_number_cell_first{1,1} = '';
globale_quickness_cell_second{1,1} = '';
globale_quickness_number_cell_second{1,1} = '';

for i = 1 : nn
    globale_quickness_cell_first{1,i+1}         = num2str(t(i));
    globale_quickness_number_cell_first{1,i+1}  = num2str(t(i));
    globale_quickness_cell_second{1,i+1}        = num2str(t(i));
    globale_quickness_number_cell_second{1,i+1} = num2str(t(i));
    
end



for i = 1 : n_files
%    fprintf('%i\t %s\n', i, files(i).name); 
   load(files(i).name);
   neuron      = quickness_data.neuron;
   protocol    = quickness_data.protocol;
   stimuli     = quickness_data.stimuli;
   global_name = [neuron '_' stimuli '_' protocol]; 
   
   globale_quickness_first(i,:)                 = quickness.pure_velocity';
   globale_quickness_second(i,:)                = quickness.pure_velocity_norm';
   
   globale_quickness_cell_first{i+1,1}          = global_name;
   globale_quickness_number_cell_first{i+1,1}   = num2str(i);
   globale_quickness_cell_second{i+1,1}         = global_name;
   globale_quickness_number_cell_second{i+1,1}  = num2str(i);
   
   
   for j  = 1 : nn 
        globale_quickness_cell_first{i+1,j+1}                 = num2str(globale_quickness_first(i,j));
        globale_quickness_number_cell_first{i+1,j+1}          = num2str(globale_quickness_first(i,j));
        globale_quickness_cell_second{i+1,j+1}         = num2str(globale_quickness_second(i,j));
        globale_quickness_number_cell_second{i+1,j+1}  = num2str(globale_quickness_second(i,j));
   end
    
   clear quickness quickness_data;
    
end






[n,m]   = size(globale_quickness_cell_first);
fichier = fopen('quickness_cell_first_neurons_name.txt', 'w+');
for i = 1 : n
    for j = 1 : m
        fprintf(fichier, '%s\t', globale_quickness_cell_first{i,j} );
    end
     fprintf(fichier, '\n');
end
fclose(fichier);

[n,m]   = size(globale_quickness_cell_second);
fichier = fopen('quickness_cell_second_neurons_name.txt', 'w+');
for i = 1 : n
    for j = 1 : m
        fprintf(fichier, '%s\t', globale_quickness_cell_second{i,j} );
    end
    fprintf(fichier, '\n');
end
fclose(fichier);


[n,m]   = size(globale_quickness_number_cell_first);
fichier = fopen('quickness_cell_first_neurons_number.txt', 'w+');
for i = 1 : n
    for j = 1 : m
        fprintf(fichier, '%s\t', globale_quickness_number_cell_first{i,j} );
    end
     fprintf(fichier, '\n');
end
fclose(fichier);

[n,m]   = size(globale_quickness_number_cell_second);
fichier = fopen('quickness_cell_second_neurons_number.txt', 'w+');
for i = 1 : n
    for j = 1 : m
        fprintf(fichier, '%s\t', globale_quickness_number_cell_second{i,j} );
    end
    fprintf(fichier, '\n');
end
fclose(fichier);




save('globale_quickness_screen_scale.mat', 'globale_quickness_first', 'globale_quickness_second', ...
    'globale_quickness_cell_first', 'globale_quickness_cell_second',...
    'globale_quickness_number_cell_first', 'globale_quickness_number_cell_second');



cd(target_folder);



end