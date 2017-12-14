function trx = remove_most_fields_trx(trx, liste)


n_liste = length(liste);

all_names   = fieldnames(trx);
n_all_names = length(all_names);

for i = 1 : n_all_names
   all_names_loc =  all_names{i};
   loc = 1;
   
   for k = 1 : n_liste
       
      if strcmp(all_names_loc, liste{k})
        loc = 0;
        break;
      end

      if ~isempty( strfind(liste{k}, '*')  )
         if  ~isempty( strfind(all_names_loc, liste{k}(1:end-1)))
             loc = 0;
             break
         end
      end
      
   end
   
   
   
   
   
   if loc 
       trx = rmfield(trx, all_names_loc);
   end
   
    
end




end


