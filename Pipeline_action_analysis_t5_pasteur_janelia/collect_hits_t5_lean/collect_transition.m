function global_transitions = collect_transition(target_folder,rig, varargin)


cd(target_folder);
files       = subdir(fullfile(pwd,'transitions.mat'));
n_files     = length(files);
name_folder = 'screen_scale_transitions';
mkdir(name_folder);
cd(name_folder)




for i = 1 : n_files
    
    load(files(i).name);
%     fprintf('%s\n', files(i).name)
    
    neuron      = transitions_data.neuron;
    protocol    = transitions_data.protocol;
    stimuli     = transitions_data.stimuli;
    global_name = [neuron '_' stimuli '_' protocol];

    
    %%
    name_output = ['transition_globale_before_' global_name] ;
    print_transition_matrix_linear_form_remove_null(name_output, transitions.transition_globale_before);
    print_transition_matrix_to_txt_remove_null([name_output '_matrix'],transitions.transition_globale_before );
    name_output = ['transition_globale_norm_before_' global_name] ;
    print_transition_matrix_linear_form_remove_null(name_output, transitions.transition_globale_norm_before);
    print_transition_matrix_to_txt_remove_null([name_output '_matrix'],transitions.transition_globale_norm_before );
    %%
    name_output = ['transition_globale_during_' global_name] ;
    print_transition_matrix_linear_form_remove_null(name_output, transitions.transition_globale_during);
    print_transition_matrix_to_txt_remove_null([name_output '_matrix'],transitions.transition_globale_during);
    name_output = ['transition_globale_norm_during_' global_name] ;
    print_transition_matrix_linear_form_remove_null(name_output, transitions.transition_globale_norm_during);
    print_transition_matrix_to_txt_remove_null([name_output '_matrix'],transitions.transition_globale_norm_during);
    
    
    %%
    name_output = ['transition_globale_after_' global_name] ;
    print_transition_matrix_linear_form_remove_null(name_output, transitions.transition_globale_after);
    print_transition_matrix_to_txt_remove_null([name_output '_matrix'],transitions.transition_globale_after);
    name_output = ['transition_globale_norm_after_' global_name] ;
    print_transition_matrix_linear_form_remove_null(name_output, transitions.transition_globale_norm_after);
    print_transition_matrix_to_txt_remove_null([name_output '_matrix'], transitions.transition_globale_norm_after);
    %%
    
    name_output = ['transition_after_start_' global_name] ;
    print_transition_matrix_linear_form_remove_null(name_output, transitions.transition_after_start);
    print_transition_matrix_to_txt_remove_null([name_output '_matrix'],transitions.transition_after_start);
    name_output = ['transition_after_start_norm_' global_name] ;
    print_transition_matrix_linear_form_remove_null(name_output, transitions.transition_after_start_norm);
    print_transition_matrix_to_txt_remove_null([name_output '_matrix'],transitions.transition_after_start_norm);
    %%
    name_output = ['transition_after_stop_' global_name] ;
    print_transition_matrix_linear_form_remove_null(name_output, transitions.transition_after_stop);
    print_transition_matrix_to_txt_remove_null([name_output '_matrix'],transitions.transition_after_stop);
    name_output = ['transition_after_stop_norm_' global_name] ;
    print_transition_matrix_linear_form_remove_null(name_output, transitions.transition_after_stop_norm);
    print_transition_matrix_to_txt_remove_null([name_output '_matrix'], transitions.transition_after_stop_norm);
    %%
   
    global_transitions(i).transition_globale_before      = transitions.transition_globale_before;
    global_transitions(i).transition_globale_norm_before = transitions.transition_globale_norm_before;
    global_transitions(i).transition_globale_during      = transitions.transition_globale_during;
    global_transitions(i).transition_globale_norm_during = transitions.transition_globale_norm_during;
    global_transitions(i).transition_globale_after       = transitions.transition_globale_after;
    global_transitions(i).transition_globale_norm_after  = transitions.transition_globale_norm_after;
    %%
    global_transitions(i).transition_after_start         = transitions.transition_after_start;
    global_transitions(i).transition_after_start_norm    = transitions.transition_after_start_norm;
    global_transitions(i).transition_after_stop          = transitions.transition_after_stop;
    global_transitions(i).transition_after_stop_norm     = transitions.transition_after_stop_norm;
    
    
    
   save('global_transitions.mat', 'global_transitions');
   clear transitions transitions_data;
end










end