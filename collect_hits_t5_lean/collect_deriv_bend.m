function collect_deriv_bend(target_folder,rig, varargin)



cd(target_folder);
files       = subdir(fullfile(pwd,'bendiness.mat'));
n_files     = length(files);
name_folder = 'screen_scale_deriv_bendiness';
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

globale_bendiness_first             = zeros(n_files,  nn  );
globale_bendiness_cell_first        = cell(n_files+1, nn+1 );
globale_bendiness_number_cell_first = cell(n_files+1, nn+1 );

globale_bendiness_second             = zeros(n_files,  nn  );
globale_bendiness_cell_second        = cell(n_files+1, nn+1 );
globale_bendiness_number_cell_second = cell(n_files+1, nn+1 );

globale_bendiness_cell_first{1,1} = '';
globale_bendiness_number_cell_first{1,1} = '';
globale_bendiness_cell_second{1,1} = '';
globale_bendiness_number_cell_second{1,1} = '';

for i = 1 : nn
    globale_bendiness_cell_first{1,i+1}         = num2str(t(i));
    globale_bendiness_number_cell_first{1,i+1}  = num2str(t(i));
    globale_bendiness_cell_second{1,i+1}        = num2str(t(i));
    globale_bendiness_number_cell_second{1,i+1} = num2str(t(i));
    
end



for i = 1 : n_files
%    fprintf('%i\t %s\n', i, files(i).name); 
   load(files(i).name);
   neuron      = bendiness_data.neuron;
   protocol    = bendiness_data.protocol;
   stimuli     = bendiness_data.stimuli;
   global_name = [neuron '_' stimuli '_' protocol]; 
   
   globale_bendiness_first(i,:)                 = bendiness.deriv_S_norm';
   globale_bendiness_second(i,:)                = bendiness.deriv_S_norm_norm';
   
   globale_bendiness_cell_first{i+1,1}          = global_name;
   globale_bendiness_number_cell_first{i+1,1}   = num2str(i);
   globale_bendiness_cell_second{i+1,1}         = global_name;
   globale_bendiness_number_cell_second{i+1,1}  = num2str(i);
   
   
   for j  = 1 : nn 
        globale_bendiness_cell_first{i+1,j+1}                 = num2str(globale_bendiness_first(i,j));
        globale_bendiness_number_cell_first{i+1,j+1}          = num2str(globale_bendiness_first(i,j));
        globale_bendiness_cell_second{i+1,j+1}         = num2str(globale_bendiness_second(i,j));
        globale_bendiness_number_cell_second{i+1,j+1}  = num2str(globale_bendiness_second(i,j));
   end
    
   clear bendiness bendiness_data;
    
end






[n,m]   = size(globale_bendiness_cell_first);
fichier = fopen('bendiness_cell_first_neurons_name.txt', 'w+');
for i = 1 : n
    for j = 1 : m
        fprintf(fichier, '%s\t', globale_bendiness_cell_first{i,j} );
    end
     fprintf(fichier, '\n');
end
fclose(fichier);

[n,m]   = size(globale_bendiness_cell_second);
fichier = fopen('bendiness_cell_second_neurons_name.txt', 'w+');
for i = 1 : n
    for j = 1 : m
        fprintf(fichier, '%s\t', globale_bendiness_cell_second{i,j} );
    end
    fprintf(fichier, '\n');
end
fclose(fichier);


[n,m]   = size(globale_bendiness_number_cell_first);
fichier = fopen('bendiness_cell_first_neurons_number.txt', 'w+');
for i = 1 : n
    for j = 1 : m
        fprintf(fichier, '%s\t', globale_bendiness_number_cell_first{i,j} );
    end
     fprintf(fichier, '\n');
end
fclose(fichier);

[n,m]   = size(globale_bendiness_number_cell_second);
fichier = fopen('bendiness_cell_second_neurons_number.txt', 'w+');
for i = 1 : n
    for j = 1 : m
        fprintf(fichier, '%s\t', globale_bendiness_number_cell_second{i,j} );
    end
    fprintf(fichier, '\n');
end
fclose(fichier);




save('globale_bendiness_screen_scale.mat', 'globale_bendiness_first', 'globale_bendiness_second', ...
    'globale_bendiness_cell_first', 'globale_bendiness_cell_second',...
    'globale_bendiness_number_cell_first', 'globale_bendiness_number_cell_second');



cd(target_folder);



end