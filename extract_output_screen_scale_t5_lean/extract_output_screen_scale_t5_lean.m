function extract_output_screen_scale_t5_lean(i,  rig,target_folder, varargin)

rig = 't5';
if ischar(i)
   i = str2num(i);
end

path_mac_pro_janelia = '/Users/massonj/Dropbox (HHMI)/Path_to_all_programs_sync_hhmi/Matlab/projet/Larva/pipeline_from_choreography_full/screen_call/output_states';
path_home_mac        = '/Users/jbmasson/Dropbox (HHMI)/Path_to_all_programs_sync_hhmi/Matlab/projet/Larva/pipeline_from_choreography_full/screen_call/output_states';
path_cluster_janelia = '/groups/zlatic/home/zlaticlab/Screens_Behaviours_Display_and_Analysis/pipeline_larva_all/Behaviours_List';
path_cluster_pasteur = '/pasteur/projets/policy02/Larva-Screen/pipeline_larva_all/Behaviours_List';

where_am_I = pwd;
if ~isempty(strfind(where_am_I,'massonj' ))
    path_to_behaviours      =  path_mac_pro_janelia;
    show_me                 =  1;
end
if ~isempty(strfind(where_am_I,'zlatic' ))
    path_to_behaviours      = path_cluster_janelia;
    show_me                 =  0;
end
if ~isempty(strfind(where_am_I,'jbmasson' ))
    path_to_behaviours      =  path_home_mac;
    show_me                 =  1;
end

if ~isempty(strfind(where_am_I,'Volumes' ))
    path_to_behaviours      =  path_home_mac;
    show_me                 =  1;
end

if ~isempty(strfind(where_am_I,'policy' ))
    path_to_behaviours      =  path_cluster_pasteur;
    show_me                 =  0;
end

cd(target_folder)
%%
[t_min, t_max, t_start,t_stop, dt_shift_before, duration_markov,multi_stim ] = get_time_associated_to_global_analysis_rig(rig);

liste                            = generate_list_of_structures_for_analysis(rig);

name_loc_path = ['path_to_global_folders_for_' rig '.mat'];

try 
    load(name_loc_path);
catch

    path                             = generate_path_hierarchy_output_features(rig);
    n_path                           = length(path);
end


behaviours                       = {'run', 'cast', 'stop', 'hunch', 'back', 'roll'};
n_sequences                      = 5;
duration_1                       = 10;
duration_2                       = 20;
duration_3                       = 38;
%%


if (i<= n_path)
    
    cd(path{i});
    fprintf('%i\t %s\n', i, path{i});
%     trx                          = collect_trx_with_states_at_least_in_select(t_min,t_max);
%     trx_all                      = collect_all_trx_in_an_experiement_screen();
    
%     trx = collect_all_trx_in_an_experiement_screen_lean(liste)
    
    trx                            = collect_one_example_trx();
    cd ..;
    path_loc2 = pwd;
    cd(path_loc2);
    name_ouput                       = ['hit_analysis_screen_t5_' trx(1).neuron '_' trx(1).stimuli '_' trx(1).protocol '_lean'];
    create_a_local_output_folder_and_go_there(name_ouput);
    path_hit                         = pwd;
    
    
    neuron                       = trx(1).neuron;
    stimuli                      = trx(1).stimuli;
    protocol                     = trx(1).protocol;
    save('data.mat', 'neuron', 'stimuli', 'protocol');
    
    trx                              = collect_trx_lean_from_protocol_to_hit(liste.first_part, path{i},path_hit);
    ethogramme                       = ethogramme_all_purpose_cluster_in_time_period (trx,  behaviours, t_min, t_max, t_start,t_stop, show_me);
    behaviour_proba                  = ensemble_averaged_behaviours_cluster   (trx,  behaviours, t_min, t_max, t_start,t_stop, show_me);
    dominant                         = dominant_behaviour_population_wise(trx, t_min, t_max, t_start, t_stop,behaviour_proba, show_me);
    survival                         = kill_the_anmalous_ones(rig);
    derivatives                      = behaviour_derivatives(trx, t_min, t_max, t_start, t_stop,behaviour_proba, show_me);
    transitions                      = transition_analysis(trx, t_start, t_stop, t_max);
    transitions_normalized_larva     = transition_analysis_normalized_in_larva(trx, t_start, t_stop, t_max);
    transitions_all_normalized_larva = transition_analysis_normalized_in_larva_action_time(trx, t_start, t_stop, t_max);
    sequences                        = sequence_analysis_t5_n_behaviours_duration(trx, t_start, t_stop,n_sequences, duration_1);
    sequences                        = sequence_analysis_t5_n_behaviours_duration(trx, t_start, t_stop,n_sequences, duration_2);
    sequences                        = sequence_analysis_t5_n_behaviours_duration(trx, t_start, t_stop,n_sequences, duration_3);
    probabilities                    = probability_analysis(trx, t_start, t_stop);  
    cumulative                       = cumulative_analysis(trx, t_start, t_stop);
    persistence                      = persistence_analysis(trx, t_start, t_stop);
    duration_stop_ness               = duration_stop_ness_analysis(trx, t_start);
    quick                            = quickness_analysis(trx, t_min, t_max);
    quick_run                        = quick_run_ness_analysis(trx, t_min, t_max);
    bend                             = bendiness_analysis(trx,t_min,t_max);   
    bend_cast                        = bend_cast_ness_analysis(trx, t_min, t_max);
    length_hunch_ness                = length_hunch_ness_analysis(trx, t_start);
    amplitude_cast_ness              = amplitude_cast_ness_analysis(trx, t_start);
    
    
%     length_hunch_ness_pure           = length_hunch_ness_pure_analysis(trx, t_start);
    



%     %%
%     

end

cd(target_folder);


end



