function trx = give_eig_reduced_loc_choreography(trx)

m_tot = 500;

for i = 1 : length(trx)
    
   %  fprintf('%i\n', i);
    x_neck    = trx(i).x_neck;
    y_neck    = trx(i).y_neck;
    
    x_contour = trx(i).x_contour;
    y_contour = trx(i).y_contour;
    
    x_neck    = repmat(x_neck, [1 m_tot]);
    y_neck    = repmat(y_neck, [1 m_tot]);
    
    x_contour = x_contour - x_neck;
    y_contour = y_contour - y_neck;
    
    mean_x2    = nanmean(x_contour.^2,2);
    mean_y2    = nanmean(y_contour.^2,2);
    mean_xy    = nanmean(x_contour.*y_contour,2);
    
   
    trx(i).eig(:,1)       = sqrt(1. - 4.*(mean_x2.*mean_y2 -mean_xy.^2 )./(mean_x2 + mean_y2).^2  );
%     trx(i).eig_plus(:,1)  = 1./2*(  (mean_x2 + mean_y2) + sqrt(  (mean_x2 + mean_y2).^2 -4.*(mean_x2.*mean_y2 -mean_xy.^2 )  )  );

    
    
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





end