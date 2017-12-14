function collect_transition_for_global_averaging(target_folder,rig, varargin)


cd(target_folder);
files       = subdir(fullfile(pwd,'transitions.mat'));
n_files     = length(files);
name_folder = 'screen_scale_average_transitions';
mkdir(name_folder);
cd(name_folder)

n_behaviour = 6;


for i = 1 : n_files
    
    load(files(i).name);
%     fprintf('%i\t %s\n', i,files(i).name);
%     fprintf('%s\n', files(i).name)
    
    neuron           = transitions_data.neuron;
    protocol         = transitions_data.protocol;
    stimuli          = transitions_data.stimuli;
    global_name{i,1} = [neuron '_' stimuli '_' protocol];
    
    transition_before{i,1} = transitions.transition_globale_before;
    transition_norm_before{i,1} = transitions.transition_globale_norm_before;
    
    transition_during{i,1} = transitions.transition_globale_during;
    transition_norm_during{i,1} = transitions.transition_globale_norm_during;
    
    transition_after{i,1} = transitions.transition_globale_after;
    transition_norm_after{i,1} = transitions.transition_globale_norm_after;
    
    transition_after_start{i,1} = transitions.transition_after_start;
    transition_after_start_norm{i,1} = transitions.transition_after_start_norm;
    
    transition_after_stop{i,1} = transitions.transition_after_stop;
    transition_after_stop_norm{i,1} = transitions.transition_after_stop_norm;
    
    
    
    %%
    clear transitions transition_data;
   
end

%%
matrice_transition_during_mean = zeros(n_behaviour, n_behaviour);
matrice_transition_during_std  = zeros(n_behaviour, n_behaviour);
indice =  zeros(n_behaviour, n_behaviour);

for i = 1 : n_files
    
    for j = 1 : n_behaviour
        for k = 1 : n_behaviour
            if (transition_norm_during{i,1}(j,k) ~= 0 )
                
                matrice_transition_during_mean(j,k) = matrice_transition_during_mean(j,k) + transition_norm_during{i,1}(j,k);
                matrice_transition_during_std(j,k)  = matrice_transition_during_std(j,k)  + transition_norm_during{i,1}(j,k).^2;
                
                indice(j,k) = indice(j,k) + 1;
                
            end
        end
    end
    
    
end

matrice_transition_during_mean = matrice_transition_during_mean./indice;
matrice_transition_during_std  = matrice_transition_during_std./indice;
matrice_transition_during_std  = matrice_transition_during_std - matrice_transition_during_mean.^2;
matrice_transition_during_std  = sqrt(matrice_transition_during_std);

%%

matrice_transition_after_mean = zeros(n_behaviour, n_behaviour);
matrice_transition_after_std  = zeros(n_behaviour, n_behaviour);
indice =  zeros(n_behaviour, n_behaviour);

for i = 1 : n_files
    
    for j = 1 : n_behaviour
        for k = 1 : n_behaviour
            if (transition_norm_after{i,1}(j,k) ~= 0 )
                
                matrice_transition_after_mean(j,k) = matrice_transition_after_mean(j,k) + transition_norm_after{i,1}(j,k);
                matrice_transition_after_std(j,k)  = matrice_transition_after_std(j,k)  + transition_norm_after{i,1}(j,k).^2;
                
                indice(j,k) = indice(j,k) + 1;
                
            end
        end
    end
    
    
end

matrice_transition_after_mean = matrice_transition_after_mean./indice;
matrice_transition_after_std  = matrice_transition_after_std./indice;
matrice_transition_after_std  = matrice_transition_after_std - matrice_transition_after_mean.^2;
matrice_transition_after_std  = sqrt(matrice_transition_after_std);
%%

%%

matrice_transition_before_mean = zeros(n_behaviour, n_behaviour);
matrice_transition_before_std  = zeros(n_behaviour, n_behaviour);
indice =  zeros(n_behaviour, n_behaviour);

for i = 1 : n_files
    
    for j = 1 : n_behaviour
        for k = 1 : n_behaviour
            if (transition_norm_before{i,1}(j,k) ~= 0 )
                
                matrice_transition_before_mean(j,k) = matrice_transition_before_mean(j,k) + transition_norm_before{i,1}(j,k);
                matrice_transition_before_std(j,k)  = matrice_transition_before_std(j,k)  + transition_norm_before{i,1}(j,k).^2;
                
                indice(j,k) = indice(j,k) + 1;
                
            end
        end
    end
    
    
end

matrice_transition_before_mean = matrice_transition_before_mean./indice;
matrice_transition_before_std  = matrice_transition_before_std./indice;
matrice_transition_before_std  = matrice_transition_before_std - matrice_transition_before_mean.^2;
matrice_transition_before_std  = sqrt(matrice_transition_before_std);

%%



matrice_transition_after_start_mean = zeros(n_behaviour, n_behaviour);
matrice_transition_after_start_std  = zeros(n_behaviour, n_behaviour);
indice =  zeros(n_behaviour, n_behaviour);

for i = 1 : n_files
    
    for j = 1 : n_behaviour
        for k = 1 : n_behaviour
            if (transition_after_start_norm{i,1}(j,k) ~= 0 )
                
                matrice_transition_after_start_mean(j,k) = matrice_transition_after_start_mean(j,k) + transition_after_start_norm{i,1}(j,k);
                matrice_transition_after_start_std(j,k)  = matrice_transition_after_start_std(j,k)  + transition_after_start_norm{i,1}(j,k).^2;
                
                indice(j,k) = indice(j,k) + 1;
                
            end
        end
    end
    
    
end

matrice_transition_after_start_mean = matrice_transition_after_start_mean./indice;
matrice_transition_after_start_std  = matrice_transition_after_start_std./indice;
matrice_transition_after_start_std  = matrice_transition_after_start_std - matrice_transition_after_start_mean.^2;
matrice_transition_after_start_std  = sqrt(matrice_transition_after_start_std);


%%




matrice_transition_after_stop_mean = zeros(n_behaviour, n_behaviour);
matrice_transition_after_stop_std  = zeros(n_behaviour, n_behaviour);
indice =  zeros(n_behaviour, n_behaviour);

for i = 1 : n_files
    
    for j = 1 : n_behaviour
        for k = 1 : n_behaviour
            if (transition_after_stop_norm{i,1}(j,k) ~= 0 )
                
                matrice_transition_after_stop_mean(j,k) = matrice_transition_after_stop_mean(j,k) + transition_after_stop_norm{i,1}(j,k);
                matrice_transition_after_stop_std(j,k)  = matrice_transition_after_stop_std(j,k)  + transition_after_stop_norm{i,1}(j,k).^2;
                
                indice(j,k) = indice(j,k) + 1;
                
            end
        end
    end
    
    
end

matrice_transition_after_stop_mean = matrice_transition_after_stop_mean./indice;
matrice_transition_after_stop_std  = matrice_transition_after_stop_std./indice;
matrice_transition_after_stop_std  = matrice_transition_after_stop_std - matrice_transition_after_stop_mean.^2;
matrice_transition_after_stop_std  = sqrt(matrice_transition_after_stop_std);

%%

%%
matrice_transition_global_mean = zeros(n_behaviour, n_behaviour);
matrice_transition_global_std  = zeros(n_behaviour, n_behaviour);
indice =  zeros(n_behaviour, n_behaviour);

for i = 1 : n_files
    
    for j = 1 : n_behaviour
        for k = 1 : n_behaviour
            if (transition_norm_before{i,1}(j,k) ~= 0 )
                
                matrice_transition_global_mean(j,k) = matrice_transition_global_mean(j,k) + transition_norm_before{i,1}(j,k);
                matrice_transition_global_std(j,k)  = matrice_transition_global_std(j,k)  + transition_norm_before{i,1}(j,k).^2;
                
                indice(j,k) = indice(j,k) + 1;
                
            end
        end
    end
    
    
    
    
    for j = 1 : n_behaviour
        for k = 1 : n_behaviour
            if (transition_norm_during{i,1}(j,k) ~= 0 )
                
                matrice_transition_global_mean(j,k) = matrice_transition_global_mean(j,k) + transition_norm_during{i,1}(j,k);
                matrice_transition_global_std(j,k)  = matrice_transition_global_std(j,k)  + transition_norm_during{i,1}(j,k).^2;
                
                indice(j,k) = indice(j,k) + 1;
                
            end
        end
    end
    
    for j = 1 : n_behaviour
        for k = 1 : n_behaviour
            if (transition_norm_after{i,1}(j,k) ~= 0 )
                
                matrice_transition_global_mean(j,k) = matrice_transition_global_mean(j,k) + transition_norm_after{i,1}(j,k);
                matrice_transition_global_std(j,k)  = matrice_transition_global_std(j,k)  + transition_norm_after{i,1}(j,k).^2;
                
                indice(j,k) = indice(j,k) + 1;
                
            end
        end
    end
    
    
    
end

matrice_transition_global_mean = matrice_transition_global_mean./indice;
matrice_transition_global_std  = matrice_transition_global_std./indice;
matrice_transition_global_std  = matrice_transition_global_std - matrice_transition_global_mean.^2;
matrice_transition_global_std  = sqrt(matrice_transition_global_std);









save(['tout_' rig '.mat'], 'global_name', 'transition_before', 'transition_norm_before', ...
    'transition_during', 'transition_norm_during', 'transition_after', 'transition_norm_after', ...
    'transition_after_start', 'transition_after_start_norm', 'transition_after_stop', ...
    'transition_after_stop_norm',...
    'matrice_transition_during_mean','matrice_transition_during_std',...
    'matrice_transition_after_mean', 'matrice_transition_after_std' , ...
    'matrice_transition_before_mean', 'matrice_transition_before_std', ...
   'matrice_transition_after_start_mean', 'matrice_transition_after_start_std' , ... 
   'matrice_transition_after_stop_mean', 'matrice_transition_after_stop_std', ...
   'matrice_transition_global_mean','matrice_transition_global_std');








end