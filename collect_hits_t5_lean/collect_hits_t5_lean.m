function collect_hits_t5_lean(target_folder,varargin)


warning off;
rig = 't5';

%%
%%
cd(target_folder);
system('rm -r all_hits*');

files       = subdir(fullfile(pwd,'*_lean'));
n_files     = length(files);
fprintf('%i\n', n_files );

folder_out = 'all_hits_lean';
mkdir(folder_out);
cd(folder_out); 

path = pwd;

%%
%%


effecteur    = 'UAS_TNT_2_0003';
effecteur2   = 'tubGAL80_tsh_Lex_UAS_DSCP_23_0068';
effecteur3   = 'tsh_Lex_IVSGAL80_UAS_DSCP_23_0067';
protocol1   = 'p_8_45s1x30s0s#p_8_105s10x2s10s#n#n';
protocol2   = 'p_3gradient1_45s1x30s0s#p_3gradient1_105s10x2s10s#n#n';
reference_1 = 'FCF_attP2_1500062';
reference_2 = 'MZZ_R_3013849';



name1       = ['t5_effecteur_' effecteur '_protocol_' protocol1 '_reference_' reference_1 '_lean'];
name2       = ['t5_effecteur_' effecteur '_protocol_' protocol1 '_reference_' reference_2 '_lean'];

name3       = ['t5_effecteur_' effecteur '_protocol_' protocol2 '_reference_' reference_1 '_lean'];
name4       = ['t5_effecteur_' effecteur '_protocol_' protocol2 '_reference_' reference_2 '_lean'];


name5       =  ['t5_effecteur_' effecteur2 '_protocol_' protocol1 '_reference_' reference_1 '_lean'];
name6       =  ['t5_effecteur_' effecteur2 '_protocol_' protocol2 '_reference_' reference_1 '_lean'];

name7       =  ['t5_effecteur_' effecteur3 '_protocol_' protocol1 '_reference_' reference_1 '_lean'];
name8       =  ['t5_effecteur_' effecteur3 '_protocol_' protocol2 '_reference_' reference_1 '_lean'];


nature_SS      = '_SS';




cd(target_folder);
cd ..
mkdir(name1);
mkdir(name2);
mkdir(name3);
mkdir(name4);

mkdir(name5);
mkdir(name6);
mkdir(name7);
mkdir(name8);






fprintf('%i\n', 1);
cd(name1)


for i =1 : n_files
    name_loc = files(i).name;
    if  (~isempty(strfind(name_loc, protocol1))) && (~isempty(strfind(name_loc, effecteur))) 
        system(['scp -r ' name_loc ' .']);
    end
end

files_in       = dir('hit_*');
n_files_in     = length(files_in);

for i =1 : n_files_in
    name_loc = files_in(i).name;
    if  (~isempty(strfind(name_loc, 'MZZ')))
        system(['rm -r ' name_loc]);
    end
end

files_in       = dir('hit_*');
n_files_in     = length(files_in);

for i =1 : n_files_in
    name_loc = files_in(i).name;
    if  (~isempty(strfind(name_loc, 'attP2')))
    else
        if  (~isempty(strfind(name_loc, nature_SS)))
            system(['rm -r ' name_loc]);
        end
    end
end




cd ..

%
%
cd(name2)
fprintf('%i\n', 2);

for i =1 : n_files
    name_loc = files(i).name;
    if  (~isempty(strfind(name_loc, protocol1))) && (~isempty(strfind(name_loc, effecteur)))
        system(['scp -r ' name_loc ' .']);
    end
    
end


files_in       = dir('hit_*');
n_files_in     = length(files_in);

for i =1 : n_files_in
    name_loc = files_in(i).name;
    if  (~isempty(strfind(name_loc, 'attP2')))
        system(['rm -r ' name_loc]);
    end
end

files_in       = dir('hit_*');
n_files_in     = length(files_in);

for i =1 : n_files_in
    name_loc = files_in(i).name;
    if (~isempty(strfind(name_loc, 'MZZ')))
    else
    
        if  (isempty(strfind(name_loc, nature_SS)))
            system(['rm -r ' name_loc]);
        end
    end
end


cd ..


%
fprintf('%i\n', 3);
cd(name3)


for i =1 : n_files
    name_loc = files(i).name;
    if  (~isempty(strfind(name_loc, protocol2))) && (~isempty(strfind(name_loc, effecteur)))
        system(['scp -r ' name_loc ' .']);
    end
    
end



files_in       = dir('hit_*');
n_files_in     = length(files_in);

for i =1 : n_files_in
    name_loc = files_in(i).name;
    if  (~isempty(strfind(name_loc, 'MZZ')))
        system(['rm -r ' name_loc]);
    end
end

files_in       = dir('hit_*');
n_files_in     = length(files_in);

for i =1 : n_files_in
    name_loc = files_in(i).name;
    if  (~isempty(strfind(name_loc, 'attP2')))
    else
        if  (~isempty(strfind(name_loc, nature_SS)))
            system(['rm -r ' name_loc]);
        end
    end
end


cd ..



%
%
fprintf('%i\n', 4);
cd(name4)


for i =1 : n_files
    name_loc = files(i).name;
    if  (~isempty(strfind(name_loc, protocol2))) && (~isempty(strfind(name_loc, effecteur)))
        system(['scp -r ' name_loc ' .']);
    end
    
end


files_in       = dir('hit_*');
n_files_in     = length(files_in);

for i =1 : n_files_in
    name_loc = files_in(i).name;
    if  (~isempty(strfind(name_loc, 'attP2')))
        system(['rm -r ' name_loc]);
    end
end

files_in       =dir('hit_*');
n_files_in     = length(files_in);

for i =1 : n_files_in
    name_loc = files_in(i).name;
    if (~isempty(strfind(name_loc, 'MZZ')))
    else
    
        if  (isempty(strfind(name_loc, nature_SS)))
            system(['rm -r ' name_loc]);
        end
    end
end



cd ..


%

fprintf('%i\n', 5);
cd(name5)


for i =1 : n_files
    name_loc = files(i).name;
    if  (~isempty(strfind(name_loc, protocol1))) && (~isempty(strfind(name_loc, effecteur2))) 
        system(['scp -r ' name_loc ' .']);
    end
end

files_in       = dir('hit_*');
n_files_in     = length(files_in);

for i =1 : n_files_in
    name_loc = files_in(i).name;
    if  (~isempty(strfind(name_loc, 'MZZ')))
        system(['rm -r ' name_loc]);
    end
end


cd ..

%
%

fprintf('%i\n', 6);
cd(name6)


for i =1 : n_files
    name_loc = files(i).name;
    if  (~isempty(strfind(name_loc, protocol2))) && (~isempty(strfind(name_loc, effecteur2))) 
        system(['scp -r ' name_loc ' .']);
    end
end

files_in       = dir('hit_*');
n_files_in     = length(files_in);

for i =1 : n_files_in
    name_loc = files_in(i).name;
    if  (~isempty(strfind(name_loc, 'MZZ')))
        system(['rm -r ' name_loc]);
    end
end


cd ..




% 
% 

fprintf('%i\n', 7);
cd(name7)


for i =1 : n_files
    name_loc = files(i).name;
    if  (~isempty(strfind(name_loc, protocol1))) && (~isempty(strfind(name_loc, effecteur3))) 
        system(['scp -r ' name_loc ' .']);
    end
end

files_in       = dir('hit_*');
n_files_in     = length(files_in);

for i =1 : n_files_in
    name_loc = files_in(i).name;
    if  (~isempty(strfind(name_loc, 'MZZ')))
        system(['rm -r ' name_loc]);
    end
end


cd ..

%%
%%

fprintf('%i\n', 8);
cd(name8)


for i =1 : n_files
    name_loc = files(i).name;
    if  (~isempty(strfind(name_loc, protocol2))) && (~isempty(strfind(name_loc, effecteur3))) 
        system(['scp -r ' name_loc ' .']);
    end
end

files_in       = dir('hit_*');
n_files_in     = length(files_in);

for i =1 : n_files_in
    name_loc = files_in(i).name;
    if  (~isempty(strfind(name_loc, 'MZZ')))
        system(['rm -r ' name_loc]);
    end
end


cd ..

%%
%%

name_folders = {name1, name2, name3, name4, name5, name6, name7, name8};
n_name_folder = length(name_folders);


for jj = 1 : n_name_folder
    fprintf('%i\n', jj);
    cd(name_folders{jj});    
    path  = pwd;
    
    collect_dominant(path    , rig);
    collect_derivatives(path , rig);
    collect_transition(path  , rig);
    collect_transition_linearized(path  , rig);
    collect_sequence_38s(path    , rig);
    collect_transition_for_global_averaging(path, rig);
    collect_probabilities(path, rig);
    collect_cumulative(path, rig);
    collect_quick(path, rig);
    collect_quick_run(path, rig)
    collect_bend(path,rig);
    collect_deriv_bend(path,rig);
    collect_bend_cast(path,rig);
    collect_deriv_bend_cast(path,rig);
    collect_length_hunch(path, rig);
    collect_ratio_length_hunch(path, rig);
    collect_amplitude_cast_ness(path, rig);
    collect_duration_stop_ness(path, rig);
    collect_possible_sequences_38s(path, rig);
    collect_ref_t5_lean(path,jj);
    cd ..;
end
cd (path);



end
%     colect_transition_embedding(path, rig);
%     collect_sequence(path    , rig);
%     collect_sequence_10s(path    , rig);
%     collect_sequence_20s(path    , rig);
%     collect_possible_sequences(path, rig);
%     collect_possible_sequences_10s(path, rig);
%     collect_possible_sequences_20s(path, rig);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%







