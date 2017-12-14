function trx = compute_all_HMM_HT(trx,rig)

parameters = initialize_parameters_HMM_HT(rig);
[trx]      = input_all_parameters(trx, parameters);
[trx]      = emission_probability_HT(trx, parameters);
[trx]      = compute_all_alpha_HT(trx, parameters);
[trx]      = compute_all_beta_HT(trx, parameters);
[trx]      = compute_all_gamma_HT(trx);
[trx]      = compute_all_viberti_HT(trx, parameters);


end