function [trx]  = pre_initialize_head_cast(trx)

n_trx = length(trx);

for i =1 : n_trx
    
    spine_x             = trx(i).x_spine;
    spine_y             = trx(i).y_spine;
    
    head_tail_x(:,1)    = spine_x(:,1); 
    head_tail_x(:,2)    = spine_x(:,11);
    
    head_tail_y(:,1)    = spine_y(:,1); 
    head_tail_y(:,2)    = spine_y(:,11);
    
    trx(i).x_head_tail  =  head_tail_x;
    trx(i).y_head_tail  =  head_tail_y;
    
    clear head_tail_x head_tail_y ;
end


end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
