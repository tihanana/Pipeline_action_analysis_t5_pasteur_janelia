function [t_min, t_max, t_start,t_stop, dt_shift_before, duration_markov,multi_stim ] = get_time_associated_to_global_analysis_rig(rig)

switch lower(rig)
   
    case 't15'
%         t_min     = 25;
%         t_max     = 45;
    t_min      = 20;
    t_max      = 60;
    t_start    = 30;
    t_stop     = 45;
    multi_stim = [];
        
    case 't5'
%         t_min     = 40;
%         t_max     = 85;
    t_min      = 35;
    t_max      = 100;
    t_start    = 45;
    t_stop     = 83;
    multi_stim = [];
    
    
    case 't3'
%         t_min     = 40;
%         t_max     = 85;
    t_min      = 20;
    t_max      = 60;
    t_start    = 30;
    t_stop     = 45;
    multi_stim = [];
    
    
    
    
    case 't150'
        
    t_min     = 20;
    t_max     = 80;
    t_start   = 30;   
    multi_stim = [30:30:90];
    
    
    case 't6'
        
    t_min     = 40;
    t_max     = 50;
    t_start   = 45; 
    multi_stim = [];    
end

dt_shift_before = 0.2;
duration_markov = 5;

end
