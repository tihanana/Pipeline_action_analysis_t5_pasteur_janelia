function [start_stop, t_start_stop, duree, n_duree] = start_stop_behaviour_choreography(state,t)
%%

% dt      = 25e-3;
state_1 = state(1:end-1);
state_2 = state(2:end);
t_1     = t(1 : end-1);
t_2     = t(2 : end);


nnn   = length(state);

II = find( (state_1 < 0.25) & ( state_2 > 0.75 ) );
JJ = find( (state_1 > 0.75) & ( state_2 < 0.25 ) );
% KK = state == 1;
% LL = state == -1 



if (isempty(II) && isempty(JJ) )

   if   (state(1) == 1 );
       
        start_stop = [1 , nnn];
        t_start_stop = t(start_stop)';
        duree      = t(end) - t(1);
        n_duree    = start_stop(end) - start_stop(1);
   else 
       
        start_stop = [];
        t_start_stop =[];
        duree      = 0;
        n_duree    = 0;
   end
   
   
elseif (isempty(II) && ~isempty(JJ) )
       
    II = 0;
    start_stop(1,1) = 1;
    start_stop(1,2) = JJ(1);

    if (length(II)>1)
    t_start_stop = t(start_stop);
    else
    t_start_stop = t(start_stop)';
    end
    duree   = t(start_stop(:,2)) - t(start_stop(:,1));
    n_duree = start_stop(:,2) - start_stop(:,1);
   
elseif (~isempty(II)&& isempty(JJ) )
    
    
    start_stop = [II(1)+1 , nnn];
    t_start_stop = t(start_stop)';
    duree      = t(end) - t(1);
    n_duree    = start_stop(end) - start_stop(1);
else
    
    if (state(1) == 1)

       II = [0; II] ;
%         II = [1; II] ;
    end

    if (state(end) ==1)

      JJ = [JJ; nnn] ; 

    end

    indice = 1;

    for i = 1 : length(II)

        start_stop(indice,1) = II(i)+1;
        start_stop(indice,2) = JJ(i);
        
        indice = indice + 1;

    end

    if (length(II)>1)
        t_start_stop = t(start_stop);
    else
        t_start_stop = t(start_stop)';
    end
      duree   = t(start_stop(:,2)) - t(start_stop(:,1));
      n_duree =  start_stop(:,2) - start_stop(:,1);
    
end

end

