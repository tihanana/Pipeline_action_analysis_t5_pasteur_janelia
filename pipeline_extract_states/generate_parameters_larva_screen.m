function parameters = generate_parameters_larva_screen(rig, varargin)

list_designation = {'pipeline','neuron','stimuli','protocol', 'id', 'numero_larva', 't'};

list_behaviour = {'straight', 'bend', 'curl', 'ball', ...
    'compressing', 'expanding','nematicking', 'denematicking',...
    'outbending', 'inbending',...
    'run','cast','stop','back','roll', 'head_wiggle', 'wiggling', 'hunch','digging','roll_first_instar'};


switch lower(rig)
    
    case 't5'

        list_rig_dependent_behaviour = {'pure_cast', 'global_cast','strong_cast',...
            'global_run', 'strong_hunch', 'head_hunch', 'run_cast'};
   
    case 't15'    
        
        list_rig_dependent_behaviour = {'pure_cast', 'global_cast','strong_cast',...
            'global_run', 'strong_hunch', 'head_hunch', 'run_cast'};
        
    case 't3'    
        
        list_rig_dependent_behaviour = {'pure_cast', 'global_cast','strong_cast',...
            'global_run', 'strong_hunch', 'head_hunch', 'run_cast'};
        
        
        
        
    case 't6'
        
        list_rig_dependent_behaviour = {'pure_cast', 'global_cast','strong_cast',...
            'global_run', 'strong_hunch', 'head_hunch', 'run_cast'};
        
    case 't150'
        
        list_rig_dependent_behaviour = {'pure_cast', 'global_cast','strong_cast',...
            'global_run', 'strong_hunch', 'head_hunch', 'run_cast'};
        
end

threshold_strong_cast_on_S                                = 0.8;
threshold_strong_hunch_on_normalized_midline              = 0.81;
threshold_strong_hunch_eig                                = 0.68;
threshold_relative_velocity                               = 1.5;
threshold_moving_back                                     = -0.8;


parameters.list_designation                               = list_designation;
parameters.list_behaviour                                 = list_behaviour;
parameters.list_rig_dependent_behaviour                   = list_rig_dependent_behaviour;
parameters.threshold_strong_cast_on_S                     = threshold_strong_cast_on_S;
parameters.threshold_strong_hunch_on_normalized_midline   = threshold_strong_hunch_on_normalized_midline;
parameters.threshold_strong_hunch_eig                     = threshold_strong_hunch_eig;
parameters.threshold_relative_velocity                    = threshold_relative_velocity;
parameters.threshold_moving_back                          = threshold_moving_back;

switch lower(rig)
   
    
    
    case 't15'
        t_min         = 20;
        t_max         = 30;
        t_stimuli_min = 30;
        t_stimuli_max = 60;
        
        
    case 't5'
        
        t_min         = 30;
        t_max         = 45;
        t_stimuli_min = 45;
        t_stimuli_max = 85;
        
        
    case 't3'
        t_min         = 20;
        t_max         = 30;
        t_stimuli_min = 30;
        t_stimuli_max = 60;        
        
    case 't6'
        
        t_min         = 30;
        t_max         = 45;
        t_stimuli_min = 45;
        t_stimuli_max = 85;    
        
    case 't4'
        
        t_min         = 30;
        t_max         = 45;
        t_stimuli_min = 45;
        t_stimuli_max = 85;
        
    case 't150'
        
        t_min         = 30;
        t_max         = 45;
        t_stimuli_min = 45;
        t_stimuli_max = 85;
        
        
end

dt_before      = 5;
dt_after       = 10;
dt_short_after = 5;

parameters.t_min_normalize = t_min;
parameters.t_max_normalize = t_max;
parameters.t_stimuli_min   = t_stimuli_min;
parameters.t_stimuli_max   = t_stimuli_max;

parameters.t_before_stimuli       = parameters.t_stimuli_min - dt_before;
parameters.t_after_stimuli        = parameters.t_stimuli_min + dt_after;
parameters.t_short_after_stimuli  = parameters.t_stimuli_min + dt_short_after;

end
