function trx = get_local_head_tail_from_headtail_struct(trx)


n_trx = length(trx);
for i =1 : n_trx

    %% raw
    head_tail_x   = trx(i).x_head_tail ;
    head_tail_y   = trx(i).y_head_tail ;
    
    trx(i).x_head = head_tail_x(:,1);
    trx(i).y_head = head_tail_y(:,1);
    
    trx(i).x_tail = head_tail_x(:,2);
    trx(i).y_tail = head_tail_y(:,2);
    
    %% contour
    head_tail_x   = trx(i).x_head_tail_contour ;
    head_tail_y   = trx(i).y_head_tail_contour ;
    
    trx(i).x_head_contour = head_tail_x(:,1);
    trx(i).y_head_contour = head_tail_y(:,1);
    
    trx(i).x_tail_contour = head_tail_x(:,2);
    trx(i).y_tail_contour = head_tail_y(:,2);
    
    %% fourier
    head_tail_x   = trx(i).x_head_tail_contour_fourier ;
    head_tail_y   = trx(i).y_head_tail_contour_fourier ;
    
    trx(i).x_head_fourier = head_tail_x(:,1);
    trx(i).y_head_fourier = head_tail_y(:,1);
    
    trx(i).x_tail_fourier = head_tail_x(:,2);
    trx(i).y_tail_fourier = head_tail_y(:,2);
    
    
    
end






end