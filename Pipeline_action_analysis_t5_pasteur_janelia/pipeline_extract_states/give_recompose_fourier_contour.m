function trx = give_recompose_fourier_contour(trx)

n_trx         = length(trx);
n_reconstruct = 200;
n_fourier     = 7;
theta_step    = 2*pi./n_reconstruct;
theta_i       = -pi;


for i = 1 :n_trx
    t = trx(i).t;
    n_t = length(t);
    for j =1  : n_t
        contour_x_reconstruct = zeros(1,n_reconstruct);
        contour_y_reconstruct = zeros(1,n_reconstruct);
        coeffs                = squeeze(trx(i).coeffs(:,:,j));
        for k = 1 : n_fourier
            theta = theta_i;
            for l = 1 :n_reconstruct
                contour_x_reconstruct(1,l) =contour_x_reconstruct(1,l) + coeffs(k,1)*cos((k-1)*theta) + coeffs(k,2)*sin((k-1)*theta);
                contour_y_reconstruct(1,l) =contour_y_reconstruct(1,l) + coeffs(k,3)*cos((k-1)*theta) + coeffs(k,4)*sin((k-1)*theta) ;
                theta = theta + theta_step ;
            end
        
        end
        trx(i).x_contour_fourier(j,:) = contour_x_reconstruct + trx(i).x_center(j);
        trx(i).y_contour_fourier(j,:) = contour_y_reconstruct + trx(i).y_center(j);
        clear  contour_x_reconstruct contour_y_reconstruct ;
    
    end
    
end


end