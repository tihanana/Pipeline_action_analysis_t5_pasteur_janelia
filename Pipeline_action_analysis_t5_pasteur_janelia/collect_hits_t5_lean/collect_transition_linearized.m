function collect_transition_linearized(target_folder,rig, varargin)


cd(target_folder);
files       = subdir(fullfile(pwd,'transitions.mat'));
n_files     = length(files);
% fprintf('%i\n', n_files);
name_folder = 'screen_scale_transitions_linearized';
mkdir(name_folder);
cd(name_folder)

nn = 30;

transition_name_rules = {'T1-2' , 'T1-3' , 'T1-4' , 'T1-5' , 'T1-6' , ...
                         'T2-1' , 'T2-3' , 'T2-4' , 'T2-5' , 'T2-6' , ...
                         'T3-1' , 'T3-2' , 'T3-4' , 'T3-5' , 'T3-6' , ...
                         'T4-1' , 'T4-2' , 'T4-3' , 'T4-5' , 'T4-6' , ...
                         'T5-1' , 'T5-2' , 'T5-3' , 'T5-4' , 'T5-6' , ...
                         'T6-1' , 'T6-2' , 'T6-3' , 'T6-4' , 'T6-5'   };



globale_transition_before                    = zeros(n_files,  nn  );
globale_transition_before_cell               = cell(n_files+1, nn+1 );
globale_transition_before_number_cell        = cell(n_files+1, nn+1 );

globale_transition_norm_before               = zeros(n_files,  nn  );
globale_transition_norm_before_cell          = cell(n_files+1, nn+1 );
globale_transition_norm_before_number_cell   = cell(n_files+1, nn+1 );

globale_transition_during                    = zeros(n_files,  nn  );
globale_transition_during_cell               = cell(n_files+1, nn+1 );
globale_transition_during_number_cell        = cell(n_files+1, nn+1 );

globale_transition_norm_during               = zeros(n_files,  nn  );
globale_transition_norm_during_cell          = cell(n_files+1, nn+1 );
globale_transition_norm_during_number_cell   = cell(n_files+1, nn+1 );

globale_transition_after                    = zeros(n_files,  nn  );
globale_transition_after_cell               = cell(n_files+1, nn+1 );
globale_transition_after_number_cell        = cell(n_files+1, nn+1 );

globale_transition_norm_after               = zeros(n_files,  nn  );
globale_transition_norm_after_cell          = cell(n_files+1, nn+1 );
globale_transition_norm_after_number_cell   = cell(n_files+1, nn+1 );


globale_transition_after_start                    = zeros(n_files,  nn  );
globale_transition_after_start_cell               = cell(n_files+1, nn+1 );
globale_transition_after_start_number_cell        = cell(n_files+1, nn+1 );

globale_transition_norm_after_start               = zeros(n_files,  nn  );
globale_transition_norm_after_start_cell          = cell(n_files+1, nn+1 );
globale_transition_norm_after_start_number_cell   = cell(n_files+1, nn+1 );

globale_transition_after_stop                    = zeros(n_files,  nn  );
globale_transition_after_stop_cell               = cell(n_files+1, nn+1 );
globale_transition_after_stop_number_cell        = cell(n_files+1, nn+1 );

globale_transition_norm_after_stop               = zeros(n_files,  nn  );
globale_transition_norm_after_stop_cell          = cell(n_files+1, nn+1 );
globale_transition_norm_after_stop_number_cell   = cell(n_files+1, nn+1 );



globale_transition_before_cell{1,1}        = '';
globale_transition_before_number_cell{1,1} = '';
globale_transition_norm_before_cell{1,1}        = '';
globale_transition_norm_before_number_cell{1,1}        = '';
globale_transition_during_cell{1,1}        = '';
globale_transition_during_number_cell{1,1}        = '';
globale_transition_norm_during_cell{1,1}        = ''; 
globale_transition_norm_during_number_cell{1,1}        = '';
globale_transition_after_cell{1,1}        = '';
globale_transition_after_number_cell{1,1}        = ''; 
globale_transition_norm_after_cell{1,1}        = '';
globale_transition_norm_after_number_cell{1,1}        = '';
globale_transition_after_start_cell{1,1}        = '';
globale_transition_after_start_number_cell{1,1}        = '';
globale_transition_norm_after_start_cell{1,1}        = ''; 
globale_transition_norm_after_start_number_cell{1,1}        = '';
globale_transition_after_stop_cell{1,1}        = '';
globale_transition_after_stop_number_cell{1,1}        = '';
globale_transition_norm_after_stop_cell{1,1}        = '';
globale_transition_norm_after_stop_number_cell{1,1}        = '';

for i = 1 : nn

    
    globale_transition_before_cell{1,i+1}        = transition_name_rules{i};
    globale_transition_before_number_cell{1,i+1} = transition_name_rules{i};
    globale_transition_norm_before_cell{1,i+1}        = transition_name_rules{i};
    globale_transition_norm_before_number_cell{1,i+1}        = transition_name_rules{i};
    globale_transition_during_cell{1,i+1}        = transition_name_rules{i};
    globale_transition_during_number_cell{1,i+1}        = transition_name_rules{i};
    globale_transition_norm_during_cell{1,i+1}        = transition_name_rules{i}; 
    globale_transition_norm_during_number_cell{1,i+1}        = transition_name_rules{i};
    globale_transition_after_cell{1,i+1}        = transition_name_rules{i};
    globale_transition_after_number_cell{1,i+1}        = transition_name_rules{i}; 
    globale_transition_norm_after_cell{1,i+1}        = transition_name_rules{i};
    globale_transition_norm_after_number_cell{1,i+1}        = transition_name_rules{i};
    globale_transition_after_start_cell{1,i+1}        = transition_name_rules{i};
    globale_transition_after_start_number_cell{1,i+1}        = transition_name_rules{i};
    globale_transition_norm_after_start_cell{1,i+1}        = transition_name_rules{i}; 
    globale_transition_norm_after_start_number_cell{1,i+1}        = transition_name_rules{i};
    globale_transition_after_stop_cell{1,i+1}        = transition_name_rules{i};
    globale_transition_after_stop_number_cell{1,i+1}        = transition_name_rules{i};
    globale_transition_norm_after_stop_cell{1,i+1}        = transition_name_rules{i};
    globale_transition_norm_after_stop_number_cell{1,i+1}        = transition_name_rules{i};

    
end



for i = 1 : n_files
    
    load(files(i).name);
%     fprintf('%s\n', files(i).name)
    
    neuron      = transitions_data.neuron;
    protocol    = transitions_data.protocol;
    stimuli     = transitions_data.stimuli;
    global_name = [neuron '_' stimuli '_' protocol];

    %%
    test = transitions.transition_globale_before;
    test(1:7:end) = nan;
    test = test';
    test = test(:);
    test = test';
     II = isnan(test);
    test(II) = [];
    globale_transition_before(i,:)               = test;
    clear test;
    globale_transition_before_cell{i+1,1}        = global_name;
    globale_transition_before_number_cell{i+1,1} = num2str(i); 

    for j  = 1 : nn 
        globale_transition_before_cell{i+1,j+1}                 = num2str(globale_transition_before(i,j));
        globale_transition_before_number_cell{i+1,j+1}          = num2str(globale_transition_before(i,j));
    end 
    %%
    
    %%
    test = transitions.transition_globale_norm_before;
    test(1:7:end) = nan;
    test = test';
    test = test(:);
    test = test';
     II = isnan(test);
    test(II) = [];
    globale_transition_norm_before(i,:)               = test;
    clear test;
    globale_transition_norm_before_cell{i+1,1}        = global_name;
    globale_transition_norm_before_number_cell{i+1,1} = num2str(i); 

    for j  = 1 : nn 
        globale_transition_norm_before_cell{i+1,j+1}                 = num2str(globale_transition_norm_before(i,j));
        globale_transition_norm_before_number_cell{i+1,j+1}          = num2str(globale_transition_norm_before(i,j));
    end 
    %%
    
    
    
    %%
    test = transitions.transition_globale_during;
    test(1:7:end) = nan;
    test = test';
    test = test(:);
    test = test';
     II = isnan(test);
    test(II) = [];
    globale_transition_during(i,:)               = test;
    clear test;
    globale_transition_during_cell{i+1,1}        = global_name;
    globale_transition_during_number_cell{i+1,1} = num2str(i); 

    for j  = 1 : nn 
        globale_transition_during_cell{i+1,j+1}                 = num2str(globale_transition_during(i,j));
        globale_transition_during_number_cell{i+1,j+1}          = num2str(globale_transition_during(i,j));
    end 
    %%
    
    %%
    test = transitions.transition_globale_norm_during;
    test(1:7:end) = nan;
    test = test';
    test = test(:);
    test = test';
     II = isnan(test);
    test(II) = [];
    globale_transition_norm_during(i,:)               = test;
    clear test;
    globale_transition_norm_during_cell{i+1,1}        = global_name;
    globale_transition_norm_during_number_cell{i+1,1} = num2str(i); 

    for j  = 1 : nn 
        globale_transition_norm_during_cell{i+1,j+1}                 = num2str(globale_transition_norm_during(i,j));
        globale_transition_norm_during_number_cell{i+1,j+1}          = num2str(globale_transition_norm_during(i,j));
    end 
    %%
    
    
    
    
    
    
    %%
    test = transitions.transition_globale_after;
    test(1:7:end) = nan;
    test = test';
    test = test(:);
    test = test';
     II = isnan(test);
    test(II) = [];
    globale_transition_after(i,:)               = test;
    clear test;
    globale_transition_after_cell{i+1,1}        = global_name;
    globale_transition_after_number_cell{i+1,1} = num2str(i); 

    for j  = 1 : nn 
        globale_transition_after_cell{i+1,j+1}                 = num2str(globale_transition_after(i,j));
        globale_transition_after_number_cell{i+1,j+1}          = num2str(globale_transition_after(i,j));
    end 
    %%
    
    %%
    test = transitions.transition_globale_norm_after;
    test(1:7:end) = nan;
    test = test';
    test = test(:);
    test = test';
     II = isnan(test);
    test(II) = [];
    globale_transition_norm_after(i,:)               = test;
    clear test;
    globale_transition_norm_after_cell{i+1,1}        = global_name;
    globale_transition_norm_after_number_cell{i+1,1} = num2str(i); 

    for j  = 1 : nn 
        globale_transition_norm_after_cell{i+1,j+1}                 = num2str(globale_transition_norm_after(i,j));
        globale_transition_norm_after_number_cell{i+1,j+1}          = num2str(globale_transition_norm_after(i,j));
    end 
    %%
    
    
    
    
    
    
    
    
    
    %%
    test = transitions.transition_after_start;
    test(1:7:end) = nan;
    test = test';
    test = test(:);
    test = test';
     II = isnan(test);
    test(II) = [];
    globale_transition_after_start(i,:)               = test;
    clear test;
    globale_transition_after_start_cell{i+1,1}        = global_name;
    globale_transition_after_start_number_cell{i+1,1} = num2str(i); 

    for j  = 1 : nn 
        globale_transition_after_start_cell{i+1,j+1}                 = num2str(globale_transition_after_start(i,j));
        globale_transition_after_start_number_cell{i+1,j+1}          = num2str(globale_transition_after_start(i,j));
    end 
    %%
    
    %%
    test = transitions.transition_after_start_norm;
    test(1:7:end) = nan;
    test = test';
    test = test(:);
    test = test';
     II = isnan(test);
    test(II) = [];
    globale_transition_norm_after_start(i,:)               = test;
    clear test;
    globale_transition_norm_after_start_cell{i+1,1}        = global_name;
    globale_transition_norm_after_start_number_cell{i+1,1} = num2str(i); 

    for j  = 1 : nn 
        globale_transition_norm_after_start_cell{i+1,j+1}                 = num2str(globale_transition_norm_after_start(i,j));
        globale_transition_norm_after_start_number_cell{i+1,j+1}          = num2str(globale_transition_norm_after_start(i,j));
    end 
    %%
    
    
    
    
    %%
    test = transitions.transition_after_stop;
    test(1:7:end) = nan;
    test = test';
    test = test(:);
    test = test';
     II = isnan(test);
    test(II) = [];
    globale_transition_after_stop(i,:)               = test;
    clear test;
    globale_transition_after_stop_cell{i+1,1}        = global_name;
    globale_transition_after_stop_number_cell{i+1,1} = num2str(i); 

    for j  = 1 : nn 
        globale_transition_after_stop_cell{i+1,j+1}                 = num2str(globale_transition_after_stop(i,j));
        globale_transition_after_stop_number_cell{i+1,j+1}          = num2str(globale_transition_after_stop(i,j));
    end 
    %%
    
    %%
    test = transitions.transition_after_stop_norm;
    test(1:7:end) = nan;
    test = test';
    test = test(:);
    test = test';
     II = isnan(test);
    test(II) = [];
    globale_transition_norm_after_stop(i,:)               = test;
    clear test;
    globale_transition_norm_after_stop_cell{i+1,1}        = global_name;
    globale_transition_norm_after_stop_number_cell{i+1,1} = num2str(i); 

    for j  = 1 : nn 
        globale_transition_norm_after_stop_cell{i+1,j+1}                 = num2str(globale_transition_norm_after_stop(i,j));
        globale_transition_norm_after_stop_number_cell{i+1,j+1}          = num2str(globale_transition_norm_after_stop(i,j));
    end 
    %%
    




    
    

end


   save('global_transitions_linearized.mat' ,...
       'globale_transition_before'          , 'globale_transition_before_cell'          , 'globale_transition_before_number_cell'           ,...
       'globale_transition_norm_before'     , 'globale_transition_norm_before_cell'     , 'globale_transition_norm_before_number_cell'      ,...
       'globale_transition_during'          , 'globale_transition_during_cell'          , 'globale_transition_during_number_cell'           ,...
       'globale_transition_norm_during'     , 'globale_transition_norm_during_cell'     , 'globale_transition_norm_during_number_cell'      ,...
       'globale_transition_after'           , 'globale_transition_after_cell'           , 'globale_transition_after_number_cell'            ,...
       'globale_transition_norm_after'      , 'globale_transition_norm_after_cell'      , 'globale_transition_norm_after_number_cell'       ,...
       'globale_transition_after_start'     , 'globale_transition_after_start_cell'     , 'globale_transition_after_start_number_cell'      ,...
       'globale_transition_norm_after_start', 'globale_transition_norm_after_start_cell', 'globale_transition_norm_after_start_number_cell' ,...
       'globale_transition_after_stop'      , 'globale_transition_after_stop_cell'      , 'globale_transition_after_stop_number_cell'       , ...
       'globale_transition_norm_after_stop' , 'globale_transition_norm_after_stop_cell' , 'globale_transition_norm_after_stop_number_cell'   ) ;
   clear transitions transitions_data;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
print_stuff_locally(globale_transition_before_cell,'globale_transition_before_cell.txt');
print_stuff_locally(globale_transition_before_number_cell,'globale_transition_before_number_cell.txt');
print_stuff_locally(globale_transition_norm_before_cell,'globale_transition_norm_before_cell.txt');
print_stuff_locally(globale_transition_norm_before_number_cell,'globale_transition_norm_before_number_cell.txt');

print_stuff_locally(globale_transition_during_cell,'globale_transition_during_cell.txt');
print_stuff_locally(globale_transition_during_number_cell,'globale_transition_during_number_cell.txt');
print_stuff_locally(globale_transition_norm_during_cell,'globale_transition_norm_during_cell.txt');
print_stuff_locally(globale_transition_norm_during_number_cell,'globale_transition_norm_during_number_cell.txt');


print_stuff_locally(globale_transition_after_cell,'globale_transition_after_cell.txt');
print_stuff_locally(globale_transition_after_number_cell,'globale_transition_after_number_cell.txt');
print_stuff_locally(globale_transition_norm_after_cell,'globale_transition_norm_after_cell.txt');
print_stuff_locally(globale_transition_norm_after_number_cell,'globale_transition_norm_after_number_cell.txt');


print_stuff_locally(globale_transition_after_start_cell,'globale_transition_after_start_cell.txt');
print_stuff_locally(globale_transition_after_start_number_cell,'globale_transition_after_start_number_cell.txt');
print_stuff_locally(globale_transition_norm_after_start_cell,'globale_transition_norm_after_start_cell.txt');
print_stuff_locally(globale_transition_norm_after_start_number_cell,'globale_transition_norm_after_start_number_cell.txt');



print_stuff_locally(globale_transition_after_stop_cell,'globale_transition_after_stop_cell.txt');
print_stuff_locally(globale_transition_after_stop_number_cell,'globale_transition_after_stop_number_cell.txt');
print_stuff_locally(globale_transition_norm_after_stop_cell,'globale_transition_norm_after_stop_cell.txt');
print_stuff_locally(globale_transition_norm_after_stop_number_cell,'globale_transition_norm_after_stop_number_cell.txt');%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function print_stuff_locally(variable,name,  varargin)


[n,m]   = size(variable);
fichier = fopen(name, 'w+');
for i = 1 : n
    for j = 1 : m
        fprintf(fichier, '%s\t', variable{i,j} );
    end
     fprintf(fichier, '\n');
end
fclose(fichier);





end