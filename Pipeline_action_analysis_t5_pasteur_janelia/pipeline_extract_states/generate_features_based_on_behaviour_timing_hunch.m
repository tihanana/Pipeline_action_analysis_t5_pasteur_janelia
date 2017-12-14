function trx = generate_features_based_on_behaviour_timing_hunch(trx)

n_lim_duration    = 10;

state             = 'hunch';
core_behaviours   = {'run' , 'cast' , 'stop' , 'hunch' , 'back' , 'roll'};
core_numbers      = {1, 2, 3, 4, 5, 6};
n_core_behaviours = length(core_behaviours);
n_trx             = length(trx);

for i = 1 : length(core_behaviours)
    if ~isempty(strfind(state, core_behaviours{i}));
        nb_eff = core_numbers{i};
        break;
    end
end

liste   = {'S' , 'S_smooth_10' , 'eig' , 'eig_smooth_10' , 'larva_length' , ...
    'larva_length_smooth_5' ,'motion_velocity_5', ...
    'motion_acceleration_5', 'velocity_agitation'};
n_liste = length(liste);


for i = 1 : n_trx
    
    t                    = trx(i).t;
    n_t                  = length(t);
    start_stop           = trx(i).start_stop{nb_eff};
    [n,~]                = size(start_stop)  ;
    n_duration           = trx(i).n_duration{nb_eff};

    if ~isempty(start_stop) 

        start_before         = start_stop(:,1)-1 ;
        stop_after           = start_stop(:,2)+1 ;

    %     fprintf('n start_stop %i\n', n);
        for j = 1 : n

            if (start_before(j,1)<=0) || (stop_after(j,1)>n_t)
                trx(i).border_elimination(j) = 1;
                break;
            else
                 trx(i).border_elimination(j) = -1;
            end

            II                                  = [start_stop(j,1)  : start_stop(j,2)];
            indice                              = 1;
            trx(i).features_hunch{j}(indice)  = min(n_duration(j,1), n_lim_duration);  
            indice                              = indice + 1;

            for kkk = 1 : n_liste

                feat_loc                            = trx(i).(liste{kkk})(II);
                feat_loc_before                     = trx(i).(liste{kkk})(start_before(j,1));
                feat_loc_after                      = trx(i).(liste{kkk})(stop_after(j,1));
                feat_loc_grouped                    = [feat_loc_before; feat_loc; feat_loc_after];

                feat_loc_mean                       = mean( feat_loc );
                feat_loc_min                        = min ( feat_loc );
                feat_loc_max                        = max ( feat_loc );

                feat_loc_grouped_mean               = mean( feat_loc_grouped );
                feat_loc_grouped_min                = min ( feat_loc_grouped );
                feat_loc_grouped_max                = max ( feat_loc_grouped );

                trx(i).features_hunch{j}(indice) =  feat_loc_max - feat_loc_min;                  indice = indice + 1;
                trx(i).features_hunch{j}(indice) = (feat_loc_max - feat_loc_min)./feat_loc_mean; indice = indice + 1;
                trx(i).features_hunch{j}(indice) = (feat_loc_max - feat_loc_min)./feat_loc_min;  indice = indice + 1;
                trx(i).features_hunch{j}(indice) = (feat_loc_max - feat_loc_min)./feat_loc_max;  indice = indice + 1;

                trx(i).features_hunch{j}(indice) =  feat_loc_grouped_max - feat_loc_grouped_min;  indice = indice + 1;
                trx(i).features_hunch{j}(indice) = (feat_loc_grouped_max - feat_loc_grouped_min)./feat_loc_grouped_mean; indice = indice + 1;
                trx(i).features_hunch{j}(indice) = (feat_loc_grouped_max - feat_loc_grouped_min)./feat_loc_grouped_min; indice = indice + 1;
                trx(i).features_hunch{j}(indice) = (feat_loc_grouped_max - feat_loc_grouped_min)./feat_loc_grouped_max; indice = indice + 1;

                clear feat_loc feat_loc_before feat_loc_after feat_loc_grouped ;
                clear feat_loc_mean feat_loc_min feat_loc_max;
                clear feat_loc_grouped_mean feat_loc_grouped_min feat_loc_grouped_max ;

            end
    %         trx(i).features_hunch{j} = trx(i).features_hunch{j}';

        end

    end
    
end






end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
