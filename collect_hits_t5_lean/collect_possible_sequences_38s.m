function collect_possible_sequences_38s(target_folder, rig, varargin)


cd(target_folder);
files       = subdir(fullfile(pwd,'sequences_n_changes_5_duration_window_38.mat'));
n_files     = length(files);
name_folder = 'screen_scale_modeles_sequences_38s';
mkdir(name_folder);
cd(name_folder)

for i = 1 : n_files
    
    load(files(i).name);
    
    neuron      = sequences_data.neuron;
    protocol    = sequences_data.protocol;
    stimuli     = sequences_data.stimuli;
    global_name = [neuron '_' stimuli '_' protocol];
    
    global_sequences(i).sequence_signal_start = sequences.sequence_signal_start;
    global_sequences(i).sequence_signal_stop  = sequences.sequence_signal_stop;
    global_all_names(i).name                  =  global_name;
    
    save('global_sequences.mat', 'global_sequences', 'global_all_names');
    clear sequences sequences_data ;
    
end

%% 3 after signals

test = [];
for i =1 : length(global_sequences)
try
test = [test;  global_sequences(i).sequence_signal_start(:,2:4)];
end
end

modele3   = unique(test, 'rows');
n_modele3 = length(modele3(:,1));

%% 4 after signals 

test = [];
for i =1 : length(global_sequences)
try
test = [test;  global_sequences(i).sequence_signal_start(:,2:5)];
end
end

modele4   = unique(test, 'rows');
n_modele4 = length(modele4(:,1));
%%  
%% 5 after signals 

test = [];
for i =1 : length(global_sequences)
try
test = [test;  global_sequences(i).sequence_signal_start(:,2:6)];
end
end

modele5   = unique(test, 'rows');
n_modele5 = length(modele5(:,1));





%% 3 after signals avec previous

test = [];
for i =1 : length(global_sequences)
try
test = [test;  global_sequences(i).sequence_signal_start(:,1:4)];
end
end

modele3_with_before   = unique(test, 'rows');
n_modele3_with_before = length(modele3_with_before(:,1));

%% 4 after signals  avec previous

test = [];
for i =1 : length(global_sequences)
try
test = [test;  global_sequences(i).sequence_signal_start(:,1:5)];
end
end

modele4_with_before   = unique(test, 'rows');
n_modele4_with_before = length(modele4_with_before(:,1));

%% 5 after signals  avec previous

test = [];
for i =1 : length(global_sequences)
try
test = [test;  global_sequences(i).sequence_signal_start(:,1:6)];
end
end

modele5_with_before   = unique(test, 'rows');
n_modele5_with_before = length(modele5_with_before(:,1));


save('modele_sequences.mat', 'modele3', 'n_modele3','modele4', 'n_modele4','modele5', 'n_modele5', ...
 'modele3_with_before', 'n_modele3_with_before','modele4_with_before', 'n_modele4_with_before', ...
 'modele5_with_before', 'n_modele5_with_before');


cd ..


end