function vecteur = gaussian_deriv_smooth_choreography(vecteur, n)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%/
% windowWidth              = int32(n);
% halfWidth                = windowWidth / 2;
% gaussFilter              = gausswin(n);
% gaussFilter              = gaussFilter / sum(gaussFilter); %
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%/
% 
% n_vecteur      = length(vecteur);
% vecteur        = [vecteur(1)*ones(halfWidth,1);vecteur;vecteur(n_vecteur)*ones(halfWidth,1)];
% vecteur        = conv(vecteur, gaussFilter, 'same');
% vecteur        = vecteur(halfWidth+1:length(vecteur)-halfWidth);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%/
windowWidth              = int32(n);
halfWidth                = windowWidth / 2;
% gaussFilter              = gausswin(n);
gaussFilter              = gausswin_loc(n);

gaussFilter              = gaussFilter / sum(gaussFilter); %
d1                       = gaussFilter(2)- gaussFilter(1);
dN                       = gaussFilter(end)- gaussFilter(end-1);
dgauss                   = [d1; 1./2*(gaussFilter(3:end) - gaussFilter(1:end-2)  ) ; dN];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%/

n_vecteur      = length(vecteur);
vecteur        = [vecteur(1)*ones(halfWidth,1);vecteur;vecteur(n_vecteur)*ones(halfWidth,1)];
vecteur        = conv(vecteur, dgauss, 'same');
vecteur        = vecteur(halfWidth+1:length(vecteur)-halfWidth);


end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

