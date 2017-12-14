function trx = remove_contextual_internal_features_thrid_layer(trx, state)



names_to_be_removed = {'border_elimination'; ...
    ['features_' state]; ...
    ['is_' state]; ...
    ['is_' state '_proba']};


for i = 1 : length(names_to_be_removed  )
    try
        trx = rmfield(trx,names_to_be_removed{i} );
    end
end



end