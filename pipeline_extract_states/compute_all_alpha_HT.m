function trx = compute_all_alpha_HT(trx, parameters)


n_trx = length(trx);

for indice = 1 : n_trx;

    log_likelihood        = trx(indice).log_likelihood;
    likelihood            = trx(indice).likelihood;
    t                     = trx(indice).t;
    [alpha, log_alpha]    = compute_all_alpha(parameters,log_likelihood, likelihood );
    trx(indice).alpha     = alpha;
    trx(indice).log_alpha = log_alpha;
    
     
end




end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [alpha, log_alpha] = compute_all_alpha(parameters,log_likelihood, likelihood )

    [alpha, log_alpha] = compute_alpha_initial(parameters, log_likelihood, likelihood);
    [nn,~]              = size(log_likelihood);
    
    for time = 2 : nn 
        log_alpha_out        = compute_alpha(log_alpha,time, parameters,  log_likelihood, likelihood );
        log_alpha(time,:)    = log_alpha_out';
		alpha(time,:)        = exp(log_alpha(time,:));
    end

        
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [alpha, log_alpha] = compute_alpha_initial(parameters, log_likelihood, likelihood)

n_state           = parameters.n_state;
[nn,~]            = size(log_likelihood);

alpha             = zeros(nn,n_state);
log_alpha         = alpha;
time              = 1;

alpha(time,:)     = parameters.p_init .* likelihood(time,:);
log_alpha(time,:) = log(alpha(time,:));

end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [log_alpha_out] = compute_alpha(log_alpha,time, parameters,  log_likelihood, likelihood )
% 
% vv_loc         = vv(time,:);
% [~, log_res]   = emission_probability(vv_loc,state, parameters);
state          = [1:4];
log_res        = log_likelihood(time,:);


term_dans_exp  = bsxfun(@plus,log_res, log( parameters.T(:,state)' ) );
term_dans_exp  = bsxfun(@plus, term_dans_exp,log_alpha(time-1,:)  );
term_max       = max(term_dans_exp, [], 2);
log_alpha_out  = term_max + log(sum( exp( bsxfun(@plus,   term_dans_exp,  - term_max  ) )  , 2));

end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

