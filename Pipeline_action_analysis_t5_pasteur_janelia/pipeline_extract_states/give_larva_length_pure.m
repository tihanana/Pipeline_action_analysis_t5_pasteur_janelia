function trx = give_larva_length_pure(trx)




n_trx    = length(trx);


for i = 1 : n_trx
    
    spine_x   = trx(i).x_spine;
    spine_y   = trx(i).y_spine;
    
    head_x    = trx(i).x_head;
    head_y    = trx(i).y_head;
    
    tail_x    = trx(i).x_tail;
    tail_y    = trx(i).y_tail;
    
    mid_x     = spine_x(:,6);
    mid_y     = spine_y(:,6);
    
    
    d_head_mid = sqrt( (head_x - mid_x ).^2  +  (head_y - mid_y).^2  );
    d_tail_mid = sqrt( (tail_x - mid_x ).^2  +  (tail_y - mid_y).^2  );
    

    d_spine_x = spine_x(:,2:end) - spine_x(:,1:end-1);
    d_spine_y = spine_y(:,2:end) - spine_y(:,1:end-1);
 
    d         = sum( sqrt(d_spine_x.^2 + d_spine_y.^2),2);
%     d         = sqrt(d2);
    
    trx(i).larva_length                = d;
    trx(i).larva_length_head_mid_norm  = d_head_mid./d;
    trx(i).larva_length_tail_mid_norm  = d_tail_mid./d;
    
   
    
    
end



end