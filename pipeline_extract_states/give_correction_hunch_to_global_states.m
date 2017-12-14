function trx = give_correction_hunch_to_global_states(trx)

n_trx = length(trx);

for i = 1 : n_trx
   fprintf('%i\n', i);
   t                  = trx(i).t;
   n_t                = length(t);
   global_state       = trx(i).global_state;
   start_stop         = trx(i).start_stop{4};
   border_elimination = trx(i).border_elimination;
   is_hunch           = trx(i).is_hunch; 
   for j = 1 : length(is_hunch)
       if border_elimination(j) ==1
           global_state = rectify_border(global_state, start_stop, j, n_t);
       else
           if is_hunch(j) == -1
                global_state = rectify_hunch_between_states(global_state, start_stop, j);
           end
       end
   end
   trx(i).global_state = global_state;
    
   clear  global_state start_stop border_elimination
end









end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function global_state = rectify_border(global_state, start_stop, j, n_t)

if start_stop(j,1) == 1
    
    II               = [start_stop(j,1): start_stop(j,2)];
    global_state(II) =  global_state(start_stop(j,2)+1);
    
elseif start_stop(j,2) == n_t 

    II               = [start_stop(j,1): start_stop(j,2)];
    global_state(II) =  global_state(start_stop(j,1)-1);

end

end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function global_state = rectify_hunch_between_states(global_state, start_stop, j)

    II               = [start_stop(j,1): start_stop(j,2)];
    n_II             = length(II);
    if n_II == 1
        
        global_state(II) = global_state(start_stop(j,1)-1);
        
    else
        
    
        II_1               = [start_stop(j,1): start_stop(j,1)+floor(n_II./2)];
        II_2               = [ start_stop(j,1)+floor(n_II./2) + 1:start_stop(j,2)];
        global_state(II_1) = global_state(start_stop(j,1)-1);
        global_state(II_2) = global_state(start_stop(j,2)+1);
        
        
    
    end
    


end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%