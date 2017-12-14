function trx = give_contour_fourier_curvature(trx)

n_reconstruct = 200;
n_curve       = n_reconstruct/20;
n_trx = length(trx);

for i = 1 : n_trx;
    
    contour_fourier_x = trx(i).x_contour_fourier;
    contour_fourier_y = trx(i).y_contour_fourier;
    [n_contour, ~ ]   = size(contour_fourier_x); 
    
    for j = 1 : n_contour
        
        contour_x             = contour_fourier_x(j,:);
        contour_y             = contour_fourier_y(j,:);
        curvature             = give_curvature(contour_x, contour_y, n_curve, n_reconstruct);
        trx(i).curvature(j,:) = curvature;
        
    end
    
end

end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function curvature = give_curvature(contour_x, contour_y, n_curve, n_reconstruct, varargin)
    
curvature = zeros(1,n_reconstruct);
JJ        = [1:n_reconstruct, 1:n_reconstruct, 1:n_reconstruct];

for i =1 : n_reconstruct
    
    curvature(i) = atan2(contour_x( JJ(i+n_curve + n_reconstruct) ) - contour_x(i),contour_y(JJ(i+n_curve + n_reconstruct) ) - contour_y(i) ) - ...
        atan2(contour_x( JJ(i - n_curve + n_reconstruct) ) - contour_x(i),contour_y(JJ(i - n_curve + n_reconstruct) ) - contour_y(i));
    
    if curvature(i) < 0. 
        curvature(i) = curvature(i) + 2.*pi;
    end
end
 
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% for (int i=0; i<fitRes; i++){
%     if (i<curveDist) 
%         curve[i] = atan2( cFit[i+curveDist].y-cFit[i].y , cFit[i+curveDist].x-cFit[i].x ) 
%                     - atan2( cFit[fitRes-(curveDist-i)].y-cFit[i].y , cFit[fitRes-(curveDist-i)].x-cFit[i].x );
%     else if (i>(fitRes-curveDist-1))
%         curve[i] = atan2(cFit[curveDist-(fitRes-i)].y-cFit[i].y,cFit[curveDist-(fitRes-i)].x-cFit[i].x) 
%                     - atan2(cFit[i-curveDist].y-cFit[i].y,cFit[i-curveDist].x-cFit[i].x);
%     else 
%         curve[i] = atan2(cFit[i+curveDist].y-cFit[i].y,cFit[i+curveDist].x-cFit[i].x) 
%                     - atan2(cFit[i-curveDist].y-cFit[i].y,cFit[i-curveDist].x-cFit[i].x);
% 
%     if (curve[i]<0) curve[i] = curve[i] + 2*M_PI;
% }
% 

