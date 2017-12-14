function trx = give_state_specific_choreography_denematicking(trx)
    
for i = 1 : length(trx);
    S_deriv = trx(i).S_deriv;
    state = zeros(length(S_deriv ),1);
    denematicking_proba = zeros(length(S_deriv ),1);
    II =S_deriv>0;
    state(II) = -1;
    JJ =S_deriv<0;
    state(JJ) = 1;
    denematicking_proba(JJ)    = 1;
    trx(i).denematicking       = state;
    trx(i).denematicking_proba = denematicking_proba;
    trx(i).state     = state;
    clear state;
end

    
end
