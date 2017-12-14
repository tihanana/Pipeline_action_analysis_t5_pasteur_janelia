function copy_perl_program_evrywhere_screen()


where_am_I    = pwd;
path          = pwd;
name_perl     = 'transform_outline.pl';

if ~isempty(strfind(where_am_I,'zlatic'))    
    target_screen = '/groups/zlatic/home/zlaticlab/Screens_Behaviours_Display_and_Analysis/screens/';
end
if ~isempty(strfind(where_am_I,'pasteur'))
    target_screen = '/pasteur/projets/policy02/Larva-Screen/';
end

postfix_name  = '.outline';

copy_file_evrywhere_hierarchy_with_ancer(path, name_perl, target_screen, postfix_name);

end