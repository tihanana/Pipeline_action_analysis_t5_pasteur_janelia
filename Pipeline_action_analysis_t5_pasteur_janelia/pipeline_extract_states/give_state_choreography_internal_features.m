function trx = give_state_choreography_internal_features(trx, classifier, state)
    
    n_trx             = length(trx);
    crit              = 0.5;
    n_min_duration    = 2;

    switch lower(state)
        
        case 'hunch'
            
            for i = 1 : n_trx
                for j = 1 : length(trx(i).features_hunch)
                fprintf('%i\t %i\n',i ,j);

                    feat_loc                    = trx(i).features_hunch{j};
                    [~,scores,~]                = predict(classifier,feat_loc);
                    scores_minus_1              = scores(:,1);
                    scores_plus_1               = scores(:,2);
                    II_minus_1                  = scores_minus_1>=crit;
                    II_plus_1                   = scores_plus_1>crit;
                    JJ                          = [-II_minus_1, II_plus_1];
                    state_out                   = sum(JJ,2);

                    trx(i).is_hunch(j)          = state_out;
                    trx(i).is_hunch_proba(j)    = scores_plus_1;

                end
            end
            
            
        case 'stop'
            for i = 1 : n_trx
                for j = 1 : length(trx(i).features_stop)
                    fprintf('%i\t %i\n',i ,j);
                    
                    if trx(i).features_stop{j}(1) > n_min_duration
                        trx(i).is_stop(j)          = 1.;
                        trx(i).is_stop_proba(j)    = 1.;
                    else
                        trx(i).is_stop(j)          = -1;
                        trx(i).is_stop_proba(j)    = 1.;
                    end
                    
                end
            end
                
        case 'back'
            
            for i = 1 : n_trx
                for j = 1 : length(trx(i).features_back)
                    fprintf('%i\t %i\n',i ,j);
                    
                    if trx(i).features_back{j}(1) > n_min_duration
                        trx(i).is_back(j)          = 1.;
                        trx(i).is_back_proba(j)    = 1.;
                    else
                        trx(i).is_back(j)          = -1;
                        trx(i).is_back_proba(j)    = 1.;
                    end
                    
                end
            end
            

        
        
    end

end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%