# Pipeline_action_analysis_t5_pasteur_janelia

Ensemble of programs used to analyze screens performed in the Zlatic lab at the Janelia Research Campus (https://www.janelia.org/lab/zlatic-lab). 
More specifically, these programs are used to analyze the inactivation t5 screen of Tihana Jovanic.

### pipeline_extract_states: ###
The program that analyse the larva files to give the evolution of actions with time. Input files are the contour file (the outline of the larva) and the spine file (the centred line joining the head to the tail)

### Behaviours_List: ###
 the list of behaviours to be identified. Our behaviour nomenclature has recently changed. Run = crawling, Cast = all dynamical bending, Stop = stop, Hunch = head retraction, Back  =  crawling backward, roll = roll.

All classifier folders have the bags of decision trees 

### collect_hits_t5_lean: ###
 collect all results files from the extract_output_screen_scale_t5_lean


### get_all_protocols_names: ###
get all protocols of stimuli and store it in a txt file

### extract_output_screen_scale_t5_lean ### 


give_path_for_pipeline_extract_states: 

A “user-friendly” version of the code will soon be available in https://github.com/DecBayComp/Pipeline_action_analysis_public. 




