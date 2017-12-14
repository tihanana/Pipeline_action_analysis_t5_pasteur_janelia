function [name, Id, t,  contour_x, contour_y] = transform_load_outline_files
%%
max_lateral_size = 500;
%%
name = []; Id = []; t = []; contour = [];

delete('*.contour');
files = dir('*.outline');
perl('transform_outline.pl', files(1).name);
files2 = dir('*.contour');
test = load(files2(1).name);

%% name
II   = find(test == max(test));
name = max(test);
%% Id
JJ   = II + 1;
Id   = test(JJ);
%% time
JJ   = II + 2;
t    = test(JJ);
%% contour
KK   = II + 3;
II2  = II (2:end);
LL   = II2-1;
LL   = [LL; length(test)];

%%
nn        = length(II);
contour_y = nan(nn,max_lateral_size);
contour_x = nan(nn,max_lateral_size);

for i =1 : nn 
    poule           = test(KK(i):LL(i));
    kk              = length(poule(1:2:end));
    
    x_contour       = poule(1:2:end);    
    x_contour       = gaussian_smooth_choreography(x_contour, 5);
    x_contour       = [x_contour; x_contour(1)];
    
    y_contour       = poule(2:2:end);
    y_contour       = gaussian_smooth_choreography(y_contour, 5);
    y_contour       = [y_contour; y_contour(1)];
    
    contour_x(i,1:kk+1) = x_contour';
    contour_y(i,1:kk+1) = y_contour';
    
%     contour{i,1}.x  = poule(1:2:end);
%     contour{i,1}.y  = poule(2:2:end);
%     contour{i,2}.id = Id(i);
end




end