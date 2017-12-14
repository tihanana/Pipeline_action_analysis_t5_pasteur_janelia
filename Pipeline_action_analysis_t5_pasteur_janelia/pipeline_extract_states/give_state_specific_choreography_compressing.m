function trx = give_state_specific_choreography_compressing(trx)
    
for i = 1 : length(trx);
    eig_deriv = trx(i).eig_deriv;
    state             = zeros(length(eig_deriv ),1);
    compressing_proba = zeros(length(eig_deriv ),1);
    II =eig_deriv>0;
    state(II) = -1;
    JJ =eig_deriv<0;
    state(JJ) = 1;
    compressing_proba(JJ) = 1;
    trx(i).compressing       = state;
    trx(i).compressing_proba = compressing_proba;
    trx(i).state       = state;
    clear state;
end

    
end
