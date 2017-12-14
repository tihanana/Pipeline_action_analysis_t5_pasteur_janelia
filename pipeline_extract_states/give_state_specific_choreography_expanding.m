function trx = give_state_specific_choreography_expanding(trx)
    
for i = 1 : length(trx);
    eig_deriv = trx(i).eig_deriv;
    state = zeros(length(eig_deriv ),1);
    expanding_proba = zeros(length(eig_deriv ),1);
    II =eig_deriv>0;
    state(II) = 1;
    expanding_proba(II) = 1;
    JJ =eig_deriv<0;
    state(JJ) = -1;
    trx(i).expanding = state;
    trx(i).expanding_proba  = expanding_proba;
    trx(i).state     = state;
    clear state;
end

    
end
