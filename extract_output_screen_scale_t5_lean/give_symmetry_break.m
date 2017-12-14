%% symmetry break based on contour
function trx = give_symmetry_break(trx)


n_trx    = length(trx);
n_smooth = 5;
nn          = [5, 10 , 25 , 50 , 100 , 200 ];

for j = 1 : length(nn)
    nn_loc     = nn(j);
    nn_loc_num = num2str(nn_loc);
    
    for ind = 1 : length(trx)

            head_x      = trx(ind).x_head;
            head_y      = trx(ind).y_head;

            n = length(head_x);

            neck_top_x  = trx(ind).x_neck_top;
            neck_top_y  = trx(ind).y_neck_top;

    %         mid_x       = trx(ind).x_mid;
    %         mid_y       = trx(ind).y_mid;

            mid_x       = trx(ind).x_neck;
            mid_y       = trx(ind).y_neck;

            neck_down_x = trx(ind).x_neck_down;
            neck_down_y = trx(ind).y_neck_down;

            u_head = [head_x - neck_top_x  , head_y - neck_top_y  , zeros(n,1) ];
            u_body = [mid_x  - neck_down_x , mid_y  - neck_down_y , zeros(n,1) ];

            u_head = bsxfun(@rdivide, u_head, sqrt(sum(u_head.^2 , 2 )) );
            u_body = bsxfun(@rdivide, u_body, sqrt(sum(u_body.^2 , 2 )) );

            v           = cross(u_head, u_body);
            trx(ind).As = v(:,3);
            v     = v(:,3);
            v     = gaussian_smooth_choreography(v, nn_loc);
            
            trx(ind).(['As_' nn_loc_num])     = v;
            clear v;
    end


    
end


end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
