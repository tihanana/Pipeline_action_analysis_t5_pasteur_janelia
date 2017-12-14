function trx = add_vector_id(trx)

for i = 1 : length(trx)
    t = trx(i).t;
    n_t = length(t);
    trx(i).numero_larva_num_vector =  trx(i).numero_larva_num*ones(n_t,1);
end










