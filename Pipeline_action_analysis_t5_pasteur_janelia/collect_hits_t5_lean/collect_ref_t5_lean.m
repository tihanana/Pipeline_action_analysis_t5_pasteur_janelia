function collect_ref_t5_lean(path, i )

rig = 't5';
cd(path);
name_folder = ['screen_scale_ref_' rig];


effecteur   = 'UAS_TNT_2_0003';
protocol1   = 'p_8_45s1x30s0s#p_8_105s10x2s10s#n#n';
protocol2   = 'p_3gradient1_45s1x30s0s#p_3gradient1_105s10x2s10s#n#n';
reference_1 = 'FCF_attP2_1500062';
reference_2 = 'MZZ_R_3013849';

name1       = ['t5_effecteur_' effecteur '_protocol_' protocol1 '_reference_' reference_1 '_lean'];
name2       = ['t5_effecteur_' effecteur '_protocol_' protocol1 '_reference_' reference_2 '_lean'];

name3       = ['t5_effecteur_' effecteur '_protocol_' protocol2 '_reference_' reference_1 '_lean'];
name4       = ['t5_effecteur_' effecteur '_protocol_' protocol2 '_reference_' reference_2 '_lean'];



name_ref_loc = {'hit_analysis_screen_t5_FCF_attP2_1500062_UAS_TNT_2_0003_p_8_45s1x30s0s#p_8_105s10x2s10s#n#n_lean',...
                'hit_analysis_screen_t5_MZZ_R_3013849_UAS_TNT_2_0003_p_8_45s1x30s0s#p_8_105s10x2s10s#n#n_lean', ...
                'hit_analysis_screen_t5_FCF_attP2_1500062_UAS_TNT_2_0003_p_3gradient1_45s1x30s0s#p_3gradient1_105s10x2s10s#n#n_lean', ...
                'hit_analysis_screen_t5_MZZ_R_3013849_UAS_TNT_2_0003_p_3gradient1_45s1x30s0s#p_3gradient1_105s10x2s10s#n#n_lean', ...
                'hit_analysis_screen_t5_FCF_attP2_1500062_tubGAL80_tsh_Lex_UAS_DSCP_23_0068_p_8_45s1x30s0s#p_8_105s10x2s10s#n#n_lean', ...
                'hit_analysis_screen_t5_FCF_attP2_1500062_tubGAL80_tsh_Lex_UAS_DSCP_23_0068_p_3gradient1_45s1x30s0s#p_3gradient1_105s10x2s10s#n#n_lean', ...
                'hit_analysis_screen_t5_FCF_attP2_1500062_tsh_Lex_IVSGAL80_UAS_DSCP_23_0067_p_8_45s1x30s0s#p_8_105s10x2s10s#n#n_lean', ...
                'hit_analysis_screen_t5_FCF_attP2_1500062_tsh_Lex_IVSGAL80_UAS_DSCP_23_0067_p_3gradient1_45s1x30s0s#p_3gradient1_105s10x2s10s#n#n_lean',...
                };


name_ref = name_ref_loc{i};




mkdir(name_folder);
cd(name_ref);
files       = subdir(fullfile(pwd,'*.mat'));
n_files     = length(files);

cd ..

cd(name_folder);
for i = 1 : n_files
   copyfile(files(i).name, pwd); 
end

cd .. ; 



end