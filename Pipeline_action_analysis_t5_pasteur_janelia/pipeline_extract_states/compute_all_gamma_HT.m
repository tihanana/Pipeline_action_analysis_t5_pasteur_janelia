function trx = compute_all_gamma_HT(trx)

n_trx = length(trx);
for indice = 1 : n_trx
    
   log_alpha                        = trx(indice).log_alpha;
   log_beta                         = trx(indice).log_beta;
   [gamma_k, log_gamma_k, somme_gamma_k,log_somme_gamma_k ] = compute_all_gamma( log_alpha, log_beta);
   trx(indice).gamma_k              = gamma_k ;
   trx(indice).log_gamma_k          = log_gamma_k ;
   trx(indice).somme_gamma_k        = somme_gamma_k ;
   trx(indice).log_somme_gamma_k    = log_somme_gamma_k ;
       
   
   clear gamma_k log_gamma_k somme_gamma_k log_somme_gamma_k;
   clear log_alpha log_beta;
   
end






end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [gamma_k, log_gamma_k, somme_gamma_k,log_somme_gamma_k ] = compute_all_gamma( log_alpha, log_beta)


log_gamma_k        = log_alpha + log_beta;
term_max           = max(log_gamma_k, [], 2);
term_normalization = term_max + log( sum(  exp( bsxfun(@plus,  log_gamma_k , - term_max )),2 )  );
log_gamma_k        = bsxfun(@plus, log_gamma_k, - term_normalization);
gamma_k            = exp(log_gamma_k);
gamma_k            = bsxfun(@rdivide,gamma_k, sum(gamma_k,2) );
log_gamma_k        = log(gamma_k);
term_max           = max(log_gamma_k(1:end-1,:), [], 1);
log_somme_gamma_k  = term_max + log( sum(  exp( bsxfun(@plus,  log_gamma_k(1:end-1,:) , - term_max )),1 )  );
somme_gamma_k      = exp(log_somme_gamma_k);

end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





