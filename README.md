# Pipeline_action_analysis_t5_pasteur_janelia

Ensemble of programs used to analyze screens performed in the Zlatic lab at the Janelia Research Campus (https://www.janelia.org/lab/zlatic-lab). 
More specifically, these programs are used to analyze the inactivation t5 screen of Tihana Jovanic.

### pipeline_extract_states: ###
The program that analyse the larva files to give the evolution of actions with time. Input files are the contour file (the outline of the larva) and the spine file (the centred line joining the head to the tail). The program output a trx_with_states.mat files with all the larvae treated, the contour and spine to plot dynamic evolution of the larvaß, numerous features and the time series of actions. Current version of the code still runs numerous routines unrelated to action detection.

### extract_output_screen_scale_t5_lean ### 
The set of routines to analyse results in the trx_with_states.mat files. The routines provide (non exhaustive list) Ethogrammes, the evolution of the probability of behaviour, the dominant behaviour, the derivatives of actions probabilities, the transition matrix, the sequences after stimuli etc.   

### Behaviours_List: ###
 the list of behaviours to be identified. Our behaviour nomenclature has recently changed. Run = crawling, Cast = all dynamical bending, Stop = stop, Hunch = head retraction, Back  =  crawling backward, roll = roll.

All classifier folders have the bags of decision trees 

### collect_hits_t5_lean: ###
 collect all results files from the extract_output_screen_scale_t5_lean


### get_all_protocols_names: ###
get all protocols of stimuli and store it in a txt file

### give_path_for_pipeline_extract_states: ### 
Provide the path to all outline files (speed up the pipeline_extract_states program)

### give_path_to_folders_for_analysis:###
Provide the path to all experiments folders (speed up the extract_output_screen_scale_t5_lean)


A “user-friendly” version of the code will soon be available in https://github.com/DecBayComp/Pipeline_action_analysis_public. 






