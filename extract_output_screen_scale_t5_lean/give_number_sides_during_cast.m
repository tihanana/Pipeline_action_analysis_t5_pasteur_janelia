function trx = give_number_sides_during_cast(trx)


thresh_side = 0.1;
n_trx = length(trx);

for i = 1 : n_trx
    
       
    t            = trx(i).t;
    As           = trx(i).As_10;
    t_start_stop = trx(i).('t_start_stop'){2};
    [n,m]        = size(t_start_stop);
    nb_loc       = zeros(n,1);
    for j = 1 : n
        II                = (t >= t_start_stop(j,1))&(t <= t_start_stop(j,2));
        
        As_loc            = As(II);
        t_loc             = t(II);
        LL                = As_loc>=0;
        As_loc(LL)        = 1;
        As_loc(~LL)       = -1; 
        [start_stop, ~, ~,~] = start_stop_behaviour_choreography(As_loc,t_loc);
        [n_ss, ~] = size(start_stop);
        
        As_loc            = As(II);
        t_loc             = t(II);
        LL                = As_loc>=0;
        As_loc(LL)        = -1;
        As_loc(~LL)       = 1;
        [start_stop2, ~, ~,~] = start_stop_behaviour_choreography(As_loc,t_loc);
        [n_ss2, ~] = size(start_stop2);
        
        
        nb_loc(j,1) = n_ss + n_ss2;
        clear start_stop start_stop2 II LL As_loc t_loc;
        
    end
    trx(i).nb_side_cast =  nb_loc;
    clear nb_loc;
    
end










end