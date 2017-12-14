function trx = give_decompose_fourier_contour(trx)

n_fourier = 7;
n_trx     = length(trx);
for i = 1 : n_trx
    
    contour_x   = trx(i).x_contour;
    contour_y   = trx(i).y_contour;
    x_center    = trx(i).x_center;
    y_center    = trx(i).y_center;
    
    
    [n_contour,~] = size(contour_x);
    coeffs        = zeros(n_fourier, 4);
    for j = 1 : n_contour
        
        II                  = ~isnan(contour_x(j,:));
        x_center_loc        = x_center(j);
        y_center_loc        = y_center(j);        
        contour_x_loc       = contour_x(j,II);
        contour_y_loc       = contour_y(j,II);
        contour_x_loc       = contour_x_loc(1:end-1) - x_center_loc ;
        contour_y_loc       = contour_y_loc(1:end-1) - y_center_loc ;
        
        n_contour_loc       = length(contour_x_loc);
        
        for k = 1 : n_fourier
            for l = 1 : n_contour_loc
                coeffs(k,1) = coeffs(k,1) + (contour_x_loc(l)) * cos( (k-1) * pi * (l-1) * 2.0 / (n_contour_loc));
                coeffs(k,2) = coeffs(k,2) + (contour_x_loc(l)) * sin( (k-1) * pi * (l-1) * 2.0 / (n_contour_loc));
                coeffs(k,3) = coeffs(k,3) + (contour_y_loc(l)) * cos( (k-1) * pi * (l-1) * 2.0 / (n_contour_loc));
                coeffs(k,4) = coeffs(k,4) + (contour_y_loc(l)) * sin( (k-1) * pi * (l-1) * 2.0 / (n_contour_loc));  
            end
            for l=1:4
                coeffs(k,l)   = coeffs(k,l)*2.0./n_contour_loc;
            end
        end
        
        coeffs(1,1)   = coeffs(1,1)./2.0 ;
        coeffs(1,3)   = coeffs(1,3)./2.0 ;
        trx(i).coeffs(:,:,j) = coeffs;       
        clear II contour_x_loc contour_y_loc n_contour_loc ;
    end
    clear coeffs contour_x contour_y;
    
    
    

end