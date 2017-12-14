function trx = give_local_curvature_at_head_tail(trx)

n_smooth      = 40;
n_reconstruct = 200;
n_search      = 20;
n_trx         = length(trx);

JJ = [1:n_reconstruct,1:n_reconstruct,1:n_reconstruct ];

for i = 1 : n_trx;
    
    n_t       = length(trx(i).t);
    indice    = trx(i).indice_head_tail_contour_fourier;
    curvature = trx(i).curvature; 
    
    for j = 1 : n_t
        
        indice_loc    = indice   (j,:);
        indice1       = indice_loc(1);
        indice2       = indice_loc(2);
        curvature_loc = curvature(j,:);
        
        curv1         = curvature_loc( JJ(indice1 + n_reconstruct - n_search : indice1 + n_reconstruct + n_search)  );
        curv2         = curvature_loc( JJ(indice2 + n_reconstruct - n_search : indice2 + n_reconstruct + n_search)  );
        
        max_curv1     = max(curv1);
        max_curv2     = max(curv2);
        
        II            = find(curvature_loc == max_curv1);
        KK            = find(curvature_loc == max_curv2);
        
        trx(i).curvature_head_tail(j,1) = curvature_loc(II(1));
        trx(i).curvature_head_tail(j,2) = curvature_loc(KK(1));
        
        clear indice_loc indice1 indice2 curvature_loc curv1 curv2 max_curv1 max_curv2 II KK ;
        
    end
    
    trx(i).curvature_head_tail(:,1)   = gaussian_smooth_choreography(trx(i).curvature_head_tail(:,1), n_smooth);
    trx(i).curvature_head_tail(:,2)   = gaussian_smooth_choreography(trx(i).curvature_head_tail(:,2), n_smooth);
    
    trx(i).d_curvature_head_tail(:,1) = trx(i).curvature_head_tail(:,1)- trx(i).curvature_head_tail(:,2) ;
    trx(i).d_curvature_head_tail(:,2) = -trx(i).d_curvature_head_tail(:,1); 
    
    trx(i).d_curvature_head_tail      = tanh(trx(i).d_curvature_head_tail);
    
    clear curvature;
end






end