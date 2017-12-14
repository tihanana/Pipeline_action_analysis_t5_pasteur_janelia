function parameters = initialize_parameters_HMM_HT(rig)


%% four states
%0 : 0-> 0
%1
parameters.n_state     = 4;

switch lower(rig)
    
    case 't15'
        
% log_likelihood
parameters.curvature    = 1. ;
parameters.orientation  = 0.5 ;
parameters.distance     = 1. ;
parameters.acceleration = 0.5  ;
parameters.speed        = 0.5  ;
parameters.beta         = 0.01;

% transition matrix

% T = [0.99  0.01    0     0; ...
%        0     0   0.01  0.99; ...
%      0.99  0.01    0     0 ; ...
%        0     0   0.01  0.99; ];
% 
%    
T = [0.9  0.10    0     0; ...
       0     0   0.1  0.9; ...
     0.9  0.1    0     0 ; ...
       0     0   0.1  0.9; ];   
   
parameters.T       = T;
   
% probab initial state
%p_init             = [0.5 0.0 0.0 0.5];   
p_init             = [0.25 0.25 0.25 0.25];  
parameters.p_init  = p_init;

case 't5'

     % log_likelihood
parameters.curvature    = 1. ;
parameters.orientation  = 0.2 ;
parameters.distance     = 1. ;
parameters.acceleration = 0.5  ;
parameters.speed        = 0.5  ;
parameters.beta         = 0.01;

% transition matrix

% T = [0.99  0.01    0     0; ...
%        0     0   0.01  0.99; ...
%      0.99  0.01    0     0 ; ...
%        0     0   0.01  0.99; ];
% 
%    
T = [0.9  0.10    0     0; ...
       0     0   0.1  0.9; ...
     0.9  0.1    0     0 ; ...
       0     0   0.1  0.9; ];   
   
parameters.T       = T;
   
% probab initial state
%p_init             = [0.5 0.0 0.0 0.5];   
p_init             = [0.25 0.25 0.25 0.25];  
parameters.p_init  = p_init;   
        
 

case 't3'

     % log_likelihood
parameters.curvature    = 1. ;
parameters.orientation  = 0.2 ;
parameters.distance     = 1. ;
parameters.acceleration = 0.5  ;
parameters.speed        = 0.5  ;
parameters.beta         = 0.01;

% transition matrix

% T = [0.99  0.01    0     0; ...
%        0     0   0.01  0.99; ...
%      0.99  0.01    0     0 ; ...
%        0     0   0.01  0.99; ];
% 
%    
T = [0.9  0.10    0     0; ...
       0     0   0.1  0.9; ...
     0.9  0.1    0     0 ; ...
       0     0   0.1  0.9; ];   
   
parameters.T       = T;
   
% probab initial state
%p_init             = [0.5 0.0 0.0 0.5];   
p_init             = [0.25 0.25 0.25 0.25];  
parameters.p_init  = p_init;   




case 't6'

     % log_likelihood
parameters.curvature    = 1. ;
parameters.orientation  = 0.2 ;
parameters.distance     = 1. ;
parameters.acceleration = 0.5  ;
parameters.speed        = 0.5  ;
parameters.beta         = 0.01;

% transition matrix

% T = [0.99  0.01    0     0; ...
%        0     0   0.01  0.99; ...
%      0.99  0.01    0     0 ; ...
%        0     0   0.01  0.99; ];
% 
%    
T = [0.9  0.10    0     0; ...
       0     0   0.1  0.9; ...
     0.9  0.1    0     0 ; ...
       0     0   0.1  0.9; ];   
   
parameters.T       = T;
   
% probab initial state
%p_init             = [0.5 0.0 0.0 0.5];   
p_init             = [0.25 0.25 0.25 0.25];  
parameters.p_init  = p_init;   



end