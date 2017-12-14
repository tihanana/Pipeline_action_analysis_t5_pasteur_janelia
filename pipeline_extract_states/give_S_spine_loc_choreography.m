function trx = give_S_spine_loc_choreography(trx)
%% give the S nematic coefficient of the 
    m= 10;
for i = 1 : length(trx)
    
    x_spine         = trx(i).x_spine;
    y_spine         = trx(i).y_spine;
    
    dx              = x_spine(:,2:end) - x_spine(:,1:end-1);
    dy              = y_spine(:,2:end) - y_spine(:,1:end-1);
    
    u(:,:,1)  = dx;
    u(:,:,2)  = dy;
    u         = bsxfun( @rdivide, u, sqrt( sum(u.^2,3) ) ) ;
    
%     v         = trx(i).u;
    v         = trx(i).u_body;
    v         = repmat(v, [1 1 m]);
    
    u         = permute(u, [3 2 1]);
    v         = permute(v, [2 3 1]);
    
    cos_theta       = dot(u,v);
    cos_theta       = squeeze(cos_theta)';
    s               = (3.*cos_theta.^2 - 1)./2. ;
    S               = mean(s,2);
    trx(i).S        = S;
    
    clear S dS cos_theta u v dx dy x_spine y_spine;
    
end


end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
