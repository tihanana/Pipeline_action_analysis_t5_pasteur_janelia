function trx = compute_all_viberti_HT(trx, parameters)


n_trx = length(trx);
for indice = 1 : n_trx;
    
    likelihood     = trx(indice).likelihood;
    log_likelihood = trx(indice).log_likelihood;
    [mu_viberti, log_mu_viberti, psi, path] = viberti_path( parameters, likelihood, log_likelihood);
    
    trx(indice).mu_viberti      = mu_viberti;
    trx(indice).log_mu_viberti  = log_mu_viberti;
    trx(indice).psi             = psi ;
    trx(indice).path            = path;
    
    clear mu_viberti log_mu_viberti psi  path;
    
    
    
end








end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [mu_viberti, log_mu_viberti, psi, path] = viberti_path( parameters, likelihood, log_likelihood)

[n, n_state]                            = size(log_likelihood);
[mu_viberti, log_mu_viberti, psi, path] = viberti_path_initialize(parameters, likelihood, log_likelihood);
%path = zeros(length(vecteur),1);

for time = 2 : n;
   for state_f = 1 : n_state

       [mu_viberti,log_mu_viberti, psi] = update_viberti(time,state_f, mu_viberti, log_mu_viberti,psi, parameters, log_likelihood);
       
   end
end


[~, path(time)] = max(log_mu_viberti(time,:));

for time = n -1 : -1 : 1
    path(time,1) = psi(time+1,path(time+1));
end



end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [mu_viberti,log_mu_viberti, psi] = update_viberti(time,state_f, mu_viberti, log_mu_viberti,psi, parameters, log_likelihood)

% [ ~     , log_res]            = emission_probability(vv,state_f, parameters);

log_res                       = log_likelihood(time,state_f);
[max_loc , index]             = max ( log(parameters.T(:,state_f) ) +  log_mu_viberti(time-1,:)' );
log_mu_viberti(time,state_f)  = max_loc + log_res;
mu_viberti(time,state_f)      = exp(log_mu_viberti(time,state_f));
psi(time, state_f)            = index;


end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [mu_viberti, log_mu_viberti, psi, path] = viberti_path_initialize(parameters, likelihood, log_likelihood)

time                    = 1 ;
[n, n_states]           = size(likelihood);
mu_viberti              = zeros(n, n_states);
log_mu_viberti          = mu_viberti ;
psi                     = mu_viberti ;
path                    = zeros(n,1);
log_res                 = log_likelihood(time,:);
log_mu_viberti(time,:)  = log(parameters.p_init) + log_res;
mu_viberti(time,:)      = exp(log_mu_viberti(time,:));
% vv              = vecteur(time ,:);
% mu_viberti      = zeros(parameters.n,parameters.nombre_state);
% log_mu_viberti  = mu_viberti ;
% psi             = mu_viberti ;
% path            = zeros(parameters.n,1);



% 
% for state = 1: parameters.nombre_state
% 
%     [~, log_res]               = emission_probability(vv,state, parameters);
%     log_mu_viberti(time,state) = log(parameters.p_init(state)) + log_res;
%     mu_viberti(time,state)     = exp(log_mu_viberti(time,state));
% 
% end

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
