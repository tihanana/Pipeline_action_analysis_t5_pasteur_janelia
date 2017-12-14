function trx = regularise_proba_behaviour_first_layer(trx)

n_smooth = 3;

names = fieldnames(trx);
indice = 1;
for i =1 : length(names)
   if ~isempty(strfind(names{i}, 'proba'))
      names_proba{indice} = names{i}; 
      indice              = indice + 1;
   end
end

for j = 1 : length(names_proba)
    for i = 1 : length(trx)
    
        proba = trx(i).(names_proba{j}); 
%         proba = gaussian_smooth(proba,n_smooth );
        proba = gaussian_smooth_choreography(proba,n_smooth );
        trx(i).(names_proba{j}) = proba;
        clear proba;
    end
end


end