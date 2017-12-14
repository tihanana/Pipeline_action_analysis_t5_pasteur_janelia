function trx = Generate_non_states_for_all(trx, parameters)


list_behaviour                  = parameters.list_behaviour ;
list_rig_dependent_behaviour    = parameters.list_rig_dependent_behaviour ;

n_trx = length(trx);


for j = 1 : length(list_behaviour)
    for i = 1 : n_trx
        
        t = trx(i).t;
        n = length(t);
        trx(i).(list_behaviour{j}) = -1*ones(n,1);
%         trx(i).(list_behaviour{j}) = zeros(n,1);       
        
    end
end


for j = 1 : length(list_rig_dependent_behaviour)
    for i = 1 : n_trx
        
        t = trx(i).t;
        n = length(t);
        trx(i).(list_rig_dependent_behaviour{j}) = -1*ones(n,1);
               
        
    end
end






end