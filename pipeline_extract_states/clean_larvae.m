function trx = clean_larvae(trx)


%% criteria for killing larvae or blobs
crit_temporal_length        = 250;
crit_area                   = 1;

%%
trx                         = clean_loc_length(trx, crit_temporal_length);
trx                         = trim_the_edges(trx);
trx                         = give_center_of_mass(trx);
trx                         = clean_loc_area(trx, crit_area);

%%
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function trx = trim_the_edges(trx)
    
n_trx = length(trx);

for i =1 : n_trx
    
    t                   = trx(i).t;
    n                   = length(t);
    
    spine_x             = trx(i).x_spine;
    spine_y             = trx(i).y_spine;
    contour_x           = trx(i).x_contour;
    contour_y           = trx(i).y_contour;
    
    index               = [5:n-10]';
    
    t                   = t(index,1);
    spine_x             = spine_x(index,:);
    spine_y             = spine_y(index,:);    
    contour_x           = contour_x(index,:);
    contour_y           = contour_y(index,:);
    
    trx(i).t            = t;
    trx(i).x_spine      = spine_x;
    trx(i).y_spine      = spine_y;  
    trx(i).x_contour    = contour_x;
    trx(i).y_contour    = contour_y;
    
    
    clearvars -except i n_trx trx;
    
end
    
    
    
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function trx = clean_loc_length(trx, crit_temporal_length)

indice       = 1;
for i =1 : length(trx)
    if (length(trx(i).t) >= crit_temporal_length)
        trx2(indice,1) = trx(i);
        indice = indice + 1;
    end
end
if exist('trx2')~=1;
    trx = [];
else
    trx = trx2;
end
clear trx2;


end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function trx = clean_loc_area(trx, crit_area)

indice       = 1;
%%
for i =1 : length(trx)
    x_center = trx(i).x_center;
    y_center = trx(i).y_center;
    Id       = convhull(x_center, y_center);
    area_loc = polyarea(x_center(Id), y_center(Id) );
    if ( area_loc >= crit_area)
        trx2(indice,1) = trx(i);
        indice = indice + 1;
    end
end


if exist('trx2')~=1;
    trx = [];
else
    trx = trx2;
end
clear trx2;


end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



