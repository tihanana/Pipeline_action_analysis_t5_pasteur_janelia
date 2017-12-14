function trx = input_all_parameters(trx, parameters)

n_trx = length(trx);

for i = 1 : n_trx
    
    trx(i).parameters_HMM = parameters;
    
end





end