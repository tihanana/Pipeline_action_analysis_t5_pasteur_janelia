function trx = compute_all_beta_HT(trx, parameters)


n_trx = length(trx);

for indice = 1 : n_trx;

    log_likelihood        = trx(indice).log_likelihood;
    likelihood            = trx(indice).likelihood;
    t                     = trx(indice).t;
    [beta, log_beta]      = compute_all_beta(parameters,log_likelihood, likelihood );
    trx(indice).beta     = beta;
    trx(indice).log_beta = log_beta;
    
end




end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [beta, log_beta] = compute_all_beta(parameters,log_likelihood, likelihood  )

    [n, n_state] = size(likelihood);

    [beta, log_beta] = compute_beta_initial(parameters, log_likelihood);
    
       
     for time = n - 1 : -1 : 1;
         for state = 1: n_state
            
            [log_beta_out]        = compute_beta(log_beta,time,state ,parameters, log_likelihood );
			log_beta(time,state)  = log_beta_out; %
	 		beta(time,state)      = exp(log_beta(time,state));
            
         end
    end

end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [log_beta_out] = compute_beta(log_beta,time,state ,parameters, log_likelihood )


% vv_loc         = vv(time+1,:);
% for l = 1 : parameters.nombre_state
% [~, log_res_temp]   = emission_probability(vv_loc,l, parameters);
% log_res(1,l)        = log_res_temp;
% end
log_res        = log_likelihood(time+1,:);
term_dans_exp  = log_res + log( parameters.T(state,:) ) + log_beta(time+1,:);
term_max       = max(term_dans_exp);
log_beta_out   = term_max + log(sum( exp(term_dans_exp - term_max)  ));

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [beta, log_beta] = compute_beta_initial(parameters, log_likelihood)


n_state           = parameters.n_state;
[nn,~]            = size(log_likelihood);


beta         = zeros(nn,n_state);
log_beta     = beta;


beta(end,:)     = ones(1,n_state);
log_beta(end,:) = log(beta(end,:));

end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
