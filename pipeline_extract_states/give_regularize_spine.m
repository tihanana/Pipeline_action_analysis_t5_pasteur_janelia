function trx = give_regularize_spine(trx)


n_trx = length(trx);

for i =1 : n_trx
    
    spine_x = trx(i).x_spine;
    spine_y = trx(i).y_spine;
    [n_spine , ~] = size(spine_x);
    
    for j = 1 : n_spine
        spine_x_loc = spine_x(j,:)';
        spine_y_loc = spine_y(j,:)';
        
        spine_x_loc = gaussian_smooth_choreography(spine_x_loc, 5);
        spine_y_loc = gaussian_smooth_choreography(spine_y_loc, 5);
    
        spine_x(j,:) = spine_x_loc';
        spine_y(j,:) = spine_y_loc';
        
    end
    trx(i).x_spine_fourier= spine_x;
    trx(i).y_spine_fourier= spine_y;
    
    
end




end