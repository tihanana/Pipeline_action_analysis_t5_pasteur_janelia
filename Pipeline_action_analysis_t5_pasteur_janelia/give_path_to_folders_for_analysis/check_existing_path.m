function path = check_existing_path(path)

local_path = pwd;


indice = 1;
for i = 1 : length(path)
   try
      cd(path{i});
      path2{indice,1} = path{i};
      indice = indice + 1;
   catch
       
   end
      
    
end

clear path;
path = path2;



cd (local_path);




end