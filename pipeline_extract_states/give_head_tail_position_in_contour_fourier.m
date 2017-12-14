function trx = give_head_tail_position_in_contour_fourier(trx)

n_trx = length(trx);
for i = 1 : n_trx
    
    contour_x   = trx(i).x_contour_fourier;
    contour_y   = trx(i).y_contour_fourier;
    
    head_tail_x = trx(i).x_head_tail;
    head_tail_y = trx(i).y_head_tail;          
    
    [n_contour,~] = size(contour_x);
    
    for j = 1 : n_contour
        
        II                  = ~isnan(contour_x(j,:));
        contour_x_loc       = contour_x(j,II);
        contour_y_loc       = contour_y(j,II);
        contour_x_loc       = contour_x_loc(1:end-1);
        contour_y_loc       = contour_y_loc(1:end-1);
        
        head_tail_x_loc_1   = head_tail_x(j,1);
        head_tail_y_loc_1   = head_tail_y(j,1);
        head_tail_x_loc_2   = head_tail_x(j,2);
        head_tail_y_loc_2   = head_tail_y(j,2);
        
        d1                  = sqrt( (contour_x_loc - head_tail_x_loc_1).^2  + (contour_y_loc - head_tail_y_loc_1).^2  );
        d2                  = sqrt( (contour_x_loc - head_tail_x_loc_2).^2  + (contour_y_loc - head_tail_y_loc_2).^2  );
        
        i1                  = find(d1 == min(d1)); i1 = i1(1);
        i2                  = find(d2 == min(d2)); i2 = i2(1);
        
        trx(i).indice_head_tail_contour_fourier(j,1) = i1;
        trx(i).indice_head_tail_contour_fourier(j,2) = i2;
        
        clear i1 i2 d1 d2 II head_tail_x_loc_1 head_tail_x_loc_2 head_tail_y_loc_1 head_tail_y_loc_2
        clear contour_x_loc contour_y_loc;
        
    end
    
end













end