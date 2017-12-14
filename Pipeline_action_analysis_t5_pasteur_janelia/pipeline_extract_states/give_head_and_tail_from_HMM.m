function trx = give_head_and_tail_from_HMM(trx)

n_trx = length(trx);

for indice = 1 : n_trx
    
    path                                = trx(indice).path;
    head_tail_x                         = trx(indice).x_head_tail;
    head_tail_y                         = trx(indice).y_head_tail;
    head_tail_contour_x                 = trx(indice).x_head_tail_contour;
    head_tail_contour_y                 = trx(indice).y_head_tail_contour;
    head_tail_contour_fourier_x         = trx(indice).x_head_tail_contour_fourier;
    head_tail_contour_fourier_y         = trx(indice).y_head_tail_contour_fourier;
    spine_x                             = trx(indice).x_spine;
    spine_y                             = trx(indice).y_spine;
    spine_x_fourier                     = trx(indice).x_spine_fourier;
    spine_y_fourier                     = trx(indice).y_spine_fourier;
    
    
        
    [n,~]  = size(head_tail_x);
    [indice_head, indice_tail, II_head_1, II_head_2, II_tail_1, II_tail_2] = ...
        indice_from_path(path, n);
    
    x_head                              = zeros(n,1);
    y_head                              = zeros(n,1);
    x_tail                              = zeros(n,1);
    y_tail                              = zeros(n,1);
    x_head_contour                      = zeros(n,1);
    y_head_contour                      = zeros(n,1);
    x_tail_contour                      = zeros(n,1);
    y_tail_contour                      = zeros(n,1);
    x_head_contour_fourier              = zeros(n,1);
    y_head_contour_fourier              = zeros(n,1);
    x_tail_contour_fourier              = zeros(n,1);
    y_tail_contour_fourier              = zeros(n,1);
    
    
    spine_x(II_head_2, :)                       = spine_x(II_head_2, end:-1:1);
    spine_y(II_head_2, :)                       = spine_y(II_head_2, end:-1:1);
    
    spine_x_fourier(II_head_2, :)                       = spine_x_fourier(II_head_2, end:-1:1);
    spine_y_fourier(II_head_2, :)                       = spine_y_fourier(II_head_2, end:-1:1);
    
    
    
    
    x_head(II_head_1)                           = head_tail_x(II_head_1,1);
    x_head(II_head_2)                           = head_tail_x(II_head_2,2);
    y_head(II_head_1)                           = head_tail_y(II_head_1,1);
    y_head(II_head_2)                           = head_tail_y(II_head_2,2);
    x_tail(II_tail_1)                           = head_tail_x(II_tail_1,1);
    x_tail(II_tail_2)                           = head_tail_x(II_tail_2,2);
    y_tail(II_tail_1)                           = head_tail_y(II_tail_1,1);
    y_tail(II_tail_2)                           = head_tail_y(II_tail_2,2);

    
    x_head_contour(II_head_1)                   = head_tail_contour_x(II_head_1,1);
    x_head_contour(II_head_2)                   = head_tail_contour_x(II_head_2,2);
    y_head_contour(II_head_1)                   = head_tail_contour_y(II_head_1,1);
    y_head_contour(II_head_2)                   = head_tail_contour_y(II_head_2,2);
    x_tail_contour(II_tail_1)                   = head_tail_contour_x(II_tail_1,1);
    x_tail_contour(II_tail_2)                   = head_tail_contour_x(II_tail_2,2);
    y_tail_contour(II_tail_1)                   = head_tail_contour_y(II_tail_1,1);
    y_tail_contour(II_tail_2)                   = head_tail_contour_y(II_tail_2,2);
    
    x_head_contour_fourier(II_head_1)           = head_tail_contour_fourier_x(II_head_1,1);
    x_head_contour_fourier(II_head_2)           = head_tail_contour_fourier_x(II_head_2,2);
    y_head_contour_fourier(II_head_1)           = head_tail_contour_fourier_y(II_head_1,1);
    y_head_contour_fourier(II_head_2)           = head_tail_contour_fourier_y(II_head_2,2);
    x_tail_contour_fourier(II_tail_1)           = head_tail_contour_fourier_x(II_tail_1,1);
    x_tail_contour_fourier(II_tail_2)           = head_tail_contour_fourier_x(II_tail_2,2);
    y_tail_contour_fourier(II_tail_1)           = head_tail_contour_fourier_y(II_tail_1,1);
    y_tail_contour_fourier(II_tail_2)           = head_tail_contour_fourier_y(II_tail_2,2);
    
   
    trx(indice).x_head                  = x_head;
    trx(indice).y_head                  = y_head;
    trx(indice).x_tail                  = x_tail;
    trx(indice).y_tail                  = y_tail;
    
    trx(indice).x_head_contour          = x_head_contour;
    trx(indice).y_head_contour          = y_head_contour;
    trx(indice).x_tail_contour          = x_tail_contour;
    trx(indice).y_tail_contour          = y_tail_contour;
    
    trx(indice).x_head_contour_fourier  = x_head_contour_fourier;
    trx(indice).y_head_contour_fourier  = y_head_contour_fourier;
    trx(indice).x_tail_contour_fourier  = x_tail_contour_fourier;
    trx(indice).y_tail_contour_fourier  = y_tail_contour_fourier;
    
    trx(indice).x_head_fourier          = x_head_contour_fourier;
    trx(indice).y_head_fourier          = y_head_contour_fourier;
    trx(indice).x_tail_fourier          = x_tail_contour_fourier;
    trx(indice).y_tail_fourier          = y_tail_contour_fourier;
    
    trx(indice).x_spine                 = spine_x;
    trx(indice).y_spine                 = spine_y;
    
    trx(indice).x_spine_fourier         = spine_x_fourier;
    trx(indice).y_spine_fourier         = spine_y_fourier;
    
    
    
    clearvars -except indice n_trx trx ;
    
end


end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [indice_head, indice_tail, II_head_1, II_head_2, II_tail_1, II_tail_2] = indice_from_path(path, n)

JJ = [1:1:n];

indice_head = zeros(n,1);
indice_tail = zeros(n,1);

if  path(1) <= 2
    
    indice_head(1) = 1;
    indice_tail(1) = 2;
    
else
    
    indice_head(1) = 2;
    indice_tail(1) = 1;
    
end

for j = 1:n-1
   
    if     path(j) == 1 
        
        indice_head(j+1) = 1;
        indice_tail(j+1) = 2;
    
    elseif path(j) == 2
    
        indice_head(j+1) = 2;
        indice_tail(j+1) = 1;
        
    elseif path(j) == 3
        
        indice_head(j+1) = 1;  
        indice_tail(j+1) = 2;
    
    elseif path(j) == 4
        
        indice_head(j+1) = 2; 
        indice_tail(j+1) = 1;
        
    end
    
end

II_head_1 = (indice_head == 1);
II_head_2 = (indice_head == 2);

II_tail_1 = (indice_tail == 1);
II_tail_2 = (indice_tail == 2);

II_head_1 = JJ(II_head_1)';
II_head_2 = JJ(II_head_2)';

II_tail_1 = JJ(II_tail_1)';
II_tail_2 = JJ(II_tail_2)';




end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%