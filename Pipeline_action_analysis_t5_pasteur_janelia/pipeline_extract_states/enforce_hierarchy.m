function trx = enforce_hierarchy(trx)

core_behaviours     = {'run'      , 'cast'  , 'stop' ,  'hunch','back','roll' };
core_numbers        = {1, 2, 3, 4, 5, 6, -1};



    trx = hunt_for_zeros(trx,  core_behaviours);
    trx = stop_vs_behaviours(trx, core_behaviours);
    trx = roll_vs_behaviours(trx, core_behaviours);
    trx = hunch_vs_behaviours(trx, core_behaviours);
    trx = back_vs_behaviours(trx, core_behaviours);
    trx = cast_vs_behaviours(trx, core_behaviours);
    trx = run_for_the_rest(trx,core_behaviours );







end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function trx = hunt_for_zeros(trx,  core_behaviours)



for j = 1 : length(core_behaviours)
    for i = 1 : length(trx)

        behaviour                    = trx(i).(core_behaviours{j});
        II                          = behaviour == 0;
        behaviour(II)               = -1;
        trx(i).(core_behaviours{j}) = behaviour;
    end
end


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
function trx =  run_for_the_rest(trx, behaviours)


% behaviour_loc = 'run';

for i = 1 : length(trx)
%     t    = trx(i).t;
    stop  = trx(i).stop;
    roll  = trx(i).roll;
    hunch = trx(i).hunch;
    cast  = trx(i).cast;
    back  = trx(i).back;
    
    II = (stop==-1) & (roll==-1) & (hunch==-1) & (cast==-1) & (back==-1);
    trx(i).run(II)  = 1;
    trx(i).run(~II) = -1;
    
end




end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



