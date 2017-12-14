function trx = give_second_layer_empiral_rules(trx)
    %% this scheme cleans the state 
    %% correct following human rules multistate simultaneous associations
    %% for example you cannot be running and stopping at the same time
    %% 
    
    
    core_behaviours     = {'run'      , 'cast'  , 'stop' ,  'hunch','back','roll' };
    core_numbers        = {1, 2, 3, 4, 5, 6, -1};
    postural_behaviours = {'straight' ,  'bend' , 'curl' , 'ball' };
    dynamical_postural  = {'compressing', 'expanding', 'nematicking', 'denematicking','outbending',  'inbending' , 'displacing'};
    groupped_states     = {'run_and_stop', 'wiggling' };
    amplitude_states    = {'strong_hunch', 'startle', 'strong_cast','small_cast'};
        
    trx = regularise_proba_behaviour_first_layer(trx);
    trx = stop_vs_behaviours(trx, core_behaviours);
    trx = roll_vs_behaviours(trx, core_behaviours);
    trx = back_vs_behaviours(trx, core_behaviours);
    trx = cast_vs_behaviours(trx, core_behaviours);
    trx = hunch_vs_behaviours(trx, core_behaviours);
    trx = postural_continuity(trx);
    trx = give_global_states(trx, core_behaviours, core_numbers);
    trx = remove_useless_features(trx);
    
    
    
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function trx =  stop_vs_behaviours(trx, behaviours)

behaviour_loc = 'stop';

for i = 1 : length(trx)
%     t    = trx(i).t;
    stop = trx(i).stop;
    II   = stop == 1;
    for j = 1 : length( behaviours)
        if ~strcmp(behaviours{j}, behaviour_loc)
           trx(i).(behaviours{j})(II) = -1; 
        end
    end
    
end

end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function trx =  roll_vs_behaviours(trx, behaviours)
    

behaviour_loc = 'roll';

for i = 1 : length(trx)
%     t    = trx(i).t;
    roll = trx(i).roll;
    II   = roll == 1;
    for j = 1 : length( behaviours)
        if ~strcmp(behaviours{j}, behaviour_loc)
           trx(i).(behaviours{j})(II) = -1; 
        end
    end
    
end

% 
% for i = 1 : length(trx)
% %     t    = trx(i).t;
%     cast = trx(i).cast;
%     roll = trx(i).roll;
%        
% %     II   = (cast == 1) & (roll == 1);
% %     trx(i).cast(II) = -1;
% 
%     II               = roll == 1;
%     trx(i).run(II)   = -1;
%     trx(i).cast(II)  = -1;
%     trx(i).back(II)  = -1;
%     trx(i).hunch(II) = -1;
%     
%     
% 
% end
%     
    
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function trx =  back_vs_behaviours(trx, behaviours)
    

behaviour_loc = 'back';



for i = 1 : length(trx)
%     t    = trx(i).t;
    back = trx(i).back;
    II   = back == 1;
    for j = 1 : length( behaviours)
        if ~strcmp(behaviours{j}, behaviour_loc)
           trx(i).(behaviours{j})(II) = -1; 
        end
    end
    
end

end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function trx =  cast_vs_behaviours(trx, behaviours)
    

behaviour_loc = 'cast';

for i = 1 : length(trx)
%     t    = trx(i).t;
    cast = trx(i).cast;
    II   = cast == 1;
    for j = 1 : length( behaviours)
        if ~strcmp(behaviours{j}, behaviour_loc)
           trx(i).(behaviours{j})(II) = -1; 
        end
    end
    
end

end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function trx =  hunch_vs_behaviours(trx, behaviours)


behaviour_loc = 'hunch';

for i = 1 : length(trx)
%     t    = trx(i).t;
    hunch = trx(i).hunch;
    II   = hunch == 1;
    for j = 1 : length( behaviours)
        if ~strcmp(behaviours{j}, behaviour_loc)
           trx(i).(behaviours{j})(II) = -1; 
        end
    end
    
end




end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function trx = give_ambiguous(trx, behaviours)
% 
% 
% 
% end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function trx =  run_vs_cast(trx)
    
for i = 1 : length(trx)

    cast       = trx(i).cast;
    run        = trx(i).run;
    proba_cast = trx(i).cast_proba;
    proba_run  = trx(i).run_proba;
        
    II       =  (cast == 1) & (run == 1) & (proba_run>=proba_cast);
    run(II)  = 1 ;
    cast(II) = -1;
    
    II       =  (cast == 1) & (run == 1) & (proba_run < proba_cast);
    cast(II) = 1;
    run(II)  = -1;
    
    trx(i).run  = run;
    trx(i).cast = cast;
    
    
end
    
    
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function trx = roll_vs_digging(trx)
    
for i = 1 : length(trx)

    roll           = trx(i).roll;
    digging        = trx(i).digging;
    proba_roll     = trx(i).roll_proba;
    proba_digging  = trx(i).digging_proba;
        
    
end
    
    
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function trx = postural_continuity(trx)

for i =1 : length(trx)
   straight       = trx(i).straight;
   proba_straight = trx(i).straight_proba;
   bend           = trx(i).bend;
   proba_bend     = trx(i).bend_proba;
   curl           = trx(i).curl;
   proba_curl     = trx(i).curl_proba;
   ball           = trx(i).ball;
   proba_ball     = trx(i).ball_proba;
   
   
   II           = (ball ==1) | ( (ball==1) & (curl==1) & (proba_ball > proba_curl) );
   straight(II) = -1;
   bend(II)     = -1;
   curl(II)     = -1;
      
   II           = (curl == 1) | ( (curl == 1) & (bend == 1) & (proba_curl > proba_bend) );
   straight(II) = -1;
   bend(II)     = -1;
  
   II           = (bend == 1) | ( (bend ==1) & (straight == 1) &  (proba_bend >= proba_straight));
   straight(II) = -1;
   bend(II)     = 1;
   
   II           = ( straight == 1) | ( (straight == 1) & (bend ==1) & (proba_straight > proba_bend) );
   straight(II) = 1;
   bend(II)     = -1;
   
   
   all          = [straight, bend, curl, ball];
   all_sum      = sum(all,2);
%    II           = (straight == -1) & (bend == -1) & (curl == -1) & (ball == -1) ;
   II           = all_sum ~=-2;
   proba_loc    = [proba_straight, proba_bend,proba_curl,proba_ball];
   [~, JJ]      = max(proba_loc, [],2);
   LL           = (JJ ==1) & (II==1);
   straight(LL) = 1; bend(LL) = -1; curl(LL) = -1; ball(LL) = -1;
   LL           = (JJ ==2) & (II==1);
   bend(LL)     = 1; straight(LL) = -1; curl(LL) = -1; ball(LL) = -1;
   LL           = (JJ ==3) & (II==1);
   curl(LL)     = 1; straight(LL) = -1; bend(LL) = -1; ball(LL) = -1;
   LL           = (JJ ==4) & (II==1);
   ball(LL)     = 1; straight(LL) = -1; bend(LL) = -1; curl(LL) = -1;
  
   trx(i).straight = straight;
   trx(i).bend     = bend;
   trx(i).curl     = curl;
   trx(i).ball     = ball;
   
   clearvars -except trx i
    
end



end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function trx = hunch_cast_run(trx)



for i = 1 : length(trx)
    
    run          = trx(i).run;
    cast         = trx(i).cast;
    hunch        = trx(i).hunch;
    strong_hunch = trx(i).strong_hunch;
    
    II  = ( (hunch == 1) & (run == 1) ) | ( (hunch == 1) & (cast == 1) ) ;
    run(II)  = -1;
    cast(II) = -1;
    
    JJ  = ( (strong_hunch == 1) & (run == 1) ) | ( (strong_hunch == 1) & (cast == 1) ) ;
    run(JJ)  = -1;
    cast(JJ) = -1;
       
    
    trx(i).run  = run;
    trx(i).cast = cast;
    
    
end


end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
