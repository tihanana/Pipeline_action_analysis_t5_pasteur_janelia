function global_sequences = collect_sequence_38s(target_folder, rig, varargin)


cd(target_folder);
files       = subdir(fullfile(pwd,'sequences_n_changes_5_duration_window_38.mat'));
n_files     = length(files);
name_folder = 'screen_scale_sequences_n_changes_5_duration_window_38';
mkdir(name_folder);
cd(name_folder)

for i = 1 : n_files
    
    load(files(i).name);
    
    neuron      = sequences_data.neuron;
    protocol    = sequences_data.protocol;
    stimuli     = sequences_data.stimuli;
    global_name = [neuron '_' stimuli '_' protocol];
   
    %%
%     
%     name_output = ['sequence_signal_start_' global_name] ;
%     print_sequence_number_transition_3_behaviours(name_output, sequences.sequence_signal_start);
%     %%
%     
%     name_output = ['sequence_signal_stop_' global_name] ;
%     print_sequence_number_transition_3_behaviours(name_output, sequences.sequence_signal_stop);




    %%
    n_post      = 3; n_post_num = num2str(n_post);
    name_output = ['sequence_' n_post_num '_behaviours_signal_start_' global_name] ;
    print_sequence_number_transition_n_behaviours(name_output, sequences.sequence_signal_start, n_post);
    
    n_post      = 4; n_post_num = num2str(n_post);
    name_output = ['sequence_' n_post_num '_behaviours_signal_start_' global_name] ;
    print_sequence_number_transition_n_behaviours(name_output, sequences.sequence_signal_start, n_post);
    
    n_post      = 5; n_post_num = num2str(n_post);
    name_output = ['sequence_' n_post_num '_behaviours_signal_start_' global_name] ;
    print_sequence_number_transition_n_behaviours(name_output, sequences.sequence_signal_start, n_post);
    
    n_post      = 6; n_post_num = num2str(n_post);
    name_output = ['sequence_' n_post_num '_behaviours_signal_start_' global_name] ;
    print_sequence_number_transition_n_behaviours(name_output, sequences.sequence_signal_start, n_post);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %%
    n_post      = 3; n_post_num = num2str(n_post);
    name_output = ['sequence_' n_post_num '_behaviours_signal_stop_' global_name] ;
    print_sequence_number_transition_n_behaviours(name_output, sequences.sequence_signal_stop, n_post);

    n_post      = 4; n_post_num = num2str(n_post);
    name_output = ['sequence_' n_post_num '_behaviours_signal_stop_' global_name] ;
    print_sequence_number_transition_n_behaviours(name_output, sequences.sequence_signal_stop, n_post);

    n_post      = 5; n_post_num = num2str(n_post);
    name_output = ['sequence_' n_post_num '_behaviours_signal_stop_' global_name] ;
    print_sequence_number_transition_n_behaviours(name_output, sequences.sequence_signal_stop, n_post);

    n_post      = 6; n_post_num = num2str(n_post);
    name_output = ['sequence_' n_post_num '_behaviours_signal_stop_' global_name] ;
    print_sequence_number_transition_n_behaviours(name_output, sequences.sequence_signal_stop, n_post);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
    
    
    global_sequences(i).sequence_signal_start = sequences.sequence_signal_start;
    global_sequences(i).sequence_signal_stop  = sequences.sequence_signal_stop;
    global_all_names(i).name                  =  global_name;
    
    
    clear sequences sequences_data ;
    
end

save('global_sequences_n_changes_5_duration_window_38.mat', 'global_sequences', 'global_all_names');
cd(target_folder);
