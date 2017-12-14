function trx= load_spine_contour()

%pool = gcp();
path     = pwd;
files_loc = dir('*.outline');
full_path = [path '/' files_loc(1).name];

[protocol,pipeline, stimuli, neuron] = process_names(full_path);

if ~isempty(strfind(files_loc(1).name, 't15'))
%  dx = 4.1705;
%  dy = 4.1673;

 dx = 1;
 dy = 1;

end

if ~isempty(strfind(files_loc(1).name, 't5'))
dx = 1;
dy = 1;
end

if ~isempty(strfind(files_loc(1).name, 't3'))
dx = 1;
dy = 1;
end




if ~isempty(strfind(files_loc(1).name, 't150'))
dx = 1;
dy = 1;
end


if ~isempty(strfind(files_loc(1).name, 't6'))
dx = 1;
dy = 1;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[numero_exp, ~ ,numero_traj,longueur_numero_traj,state] = maximal_index();
files_loc    = dir(['*.spine']);
raw_files{1} = load(files_loc.name);  
[name, numero_traj_contour, t_contour,  contour_x, contour_y] = transform_load_outline_files;
[numero_traj_common] = get_common_numero_traj(raw_files{1}(:,2) ,numero_traj_contour);
n_numero_traj_common = length(numero_traj_common);


%for i = 1 : n_numero_traj_common

for i = n_numero_traj_common : -1 : 1
    results(i,1).full_path          = path;
    results(i,1).id                 = numero_exp; 
    results(i,1).numero_larva       = num2str( numero_traj_common(i));
    results(i,1).numero_larva_num   = numero_traj_common(i);
    results(i,1).protocol           = protocol;
    results(i,1).pipeline           = pipeline;
    results(i,1).stimuli            = stimuli;
    results(i,1).neuron             = neuron;

    t_loc                           = raw_files{1}(:,3);
    II_chore                        = find( raw_files{1}(:,2) == numero_traj_common(i)   ); 
    II_contour                      = find( numero_traj_contour == numero_traj_common(i) );
    [poule, I_chore, I_contour]     = intersect(t_loc(II_chore), t_contour(II_contour) );
    II_select_chore                 = II_chore(I_chore);
    II_select_contour               = II_contour(I_contour);
    results(i,1).t                  = raw_files{1}(II_select_chore,3);
    results(i,1).full_t             = unique(raw_files{1}(:,3));

    results(i,1).x_spine            = raw_files{1}(II_select_contour,4:2:25)*dx;
    results(i,1).y_spine            = raw_files{1}(II_select_contour,5:2:25)*dy;
    results(i,1).x_contour          = contour_x(II_select_contour,:)*dx ;
    results(i,1).y_contour          = contour_y(II_select_contour,:)*dy ;

end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
trx = results;


end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [numero_exp, max_index,numero_traj,longueur_numero_traj, state] = maximal_index()

try
%     files_loc               = dir('*.x.dat');
    files_loc               = dir('*.spine');
pause(0.1);
    test                    = load(files_loc.name);


    max_index               = test(end,2); 
    numero_traj             = unique(test(:,2));
    longueur_numero_traj	= length(numero_traj);

    clear test; 

    test                    = importdata(files_loc.name);
    pause(0.1);
    numero_exp              = test.textdata{1};
    %fprintf('%s\n', numero_exp);
    state = 1;
catch
    state =0;
    numero_exp = [];
    max_index= [];
    numero_traj= [];
    longueur_numero_traj = [];
end
    
    
    
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [numero_traj_common] = get_common_numero_traj(numero_traj_param ,numero_traj_contour)


numero_traj_common  = intersect(numero_traj_param, numero_traj_contour);



end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%