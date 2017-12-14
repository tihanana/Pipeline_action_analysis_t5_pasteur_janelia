function trx = redefine_necks_fourier(trx)




for i = 1 : length(trx)
%     fprintf('%i\n', i);
    
    trx(i).x_neck_top_fourier(:,1) = ( trx(i).x_spine_fourier(:,3) + trx(i).x_spine_fourier(:,4)  )./2;
    trx(i).y_neck_top_fourier(:,1) = ( trx(i).y_spine_fourier(:,3) + trx(i).y_spine_fourier(:,4)  )./2;

    trx(i).x_neck_down_fourier(:,1) = ( trx(i).x_spine_fourier(:,8) + trx(i).x_spine_fourier(:,9)  )./2;
    trx(i).y_neck_down_fourier(:,1) = ( trx(i).y_spine_fourier(:,8) + trx(i).y_spine_fourier(:,9)  )./2;
    
    trx(i).x_neck_fourier(:,1)     = trx(i).x_spine_fourier(:,6);
    trx(i).y_neck_fourier(:,1)     = trx(i).y_spine_fourier(:,6);
  
    trx(i).x_fourier               = trx(i).x_neck_fourier;
    trx(i).y_fourier               = trx(i).y_neck_fourier;

end






end