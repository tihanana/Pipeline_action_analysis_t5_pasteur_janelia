function trx = give_head_tail_in_boths_contours(trx)
    
    
n_trx = length(trx);

for i = 1 : n_trx;
   
    
   indice_head_tail_contour         = trx(i).indice_head_tail_contour ;
   indice_head_tail_contour_fourier = trx(i).indice_head_tail_contour_fourier;
   
   contour_x                        = trx(i).x_contour;
   contour_y                        = trx(i).y_contour;
   
   contour_fourier_x                = trx(i).x_contour_fourier ;
   contour_fourier_y                = trx(i).y_contour_fourier ;

   [nn,~]                           = size(indice_head_tail_contour);
   
   for j = 1 : nn
       
        trx(i).x_head_tail_contour( j,1 )           = contour_x( j,indice_head_tail_contour(j,1) );
        trx(i).x_head_tail_contour( j,2 )           = contour_x( j,indice_head_tail_contour(j,2) );
        
        trx(i).y_head_tail_contour( j,1 )           = contour_y( j,indice_head_tail_contour(j,1) );
        trx(i).y_head_tail_contour( j,2 )           = contour_y( j,indice_head_tail_contour(j,2) );
        
        trx(i).x_head_tail_contour_fourier( j,1 )   = contour_fourier_x( j,indice_head_tail_contour_fourier(j,1) );
        trx(i).x_head_tail_contour_fourier( j,2 )   = contour_fourier_x( j,indice_head_tail_contour_fourier(j,2) );
        
        trx(i).y_head_tail_contour_fourier( j,1 )   = contour_fourier_y( j,indice_head_tail_contour_fourier(j,1) );
        trx(i).y_head_tail_contour_fourier( j,2 )   = contour_fourier_y( j,indice_head_tail_contour_fourier(j,2) );
                
   end
   
    
end
    
    
    
    
end