function ethogramme = ethogramme_all_purpose_cluster_in_time_period(trx, behaviours, t_min, t_max, t_start,t_stop, show_me, varargin)

color_list   = {'k', 'r', 'g', 'b','c', 'y', 'm'};
color_names  = {'black', 'red', 'green', 'blue', 'cyan', 'yellow', 'magenta'};


option_shift = 'no_shift' ; 
n     = length(trx);
dt    = [];
for i = 1 : length(trx)
   dt = [dt; trx(i).t(2:end)-trx(i).t(1:end-1)];
end
dt_mean      = mean(dt);
dt           = dt_mean;
clear dt_mean;
n_behaviours = length(behaviours);

y      = [0:1:length(trx)]';
h = figure('Visible', 'off');
axes1 = axes('Parent',h,'YScale','linear','YMinorTick','off','XScale','linear', 'FontSize',20,'LineWidth',2);
box(axes1,'on');
hold(axes1,'all');

% figure1 = figure('XVisual',    '0x24 (TrueColor, depth 24, RGB mask 0xff0000 0xff00 0x00ff)',    'PaperType','a4letter',  'PaperSize',[21 30]);


indice = 1;
for i = 1 : length(trx)
        t             = trx(i).t;
        nn            = length(t);
        t_end_local   = max(t);
        t_debut_local = min(t);
    for j = 1 : n_behaviours
        
        behaviour_loc = trx(i).(behaviours{j});
        if (t_end_local >= t_min) && (t_debut_local <= t_max)
       
            t_poly                                        = [t(1) ; t ; t(end) ; t(1)];
%             fprintf('%i\t %s\t %i\t %i\n ',i,behaviours{j}, min(behaviour_loc)  , max(behaviour_loc));
            behaviour_loc_poly                            = [y(indice); behaviour_loc + y(indice) ; y(indice)   ; y(indice)];
            [~, t_start_stop, ~]                          = start_stop_behaviour_choreography(behaviour_loc,t);
            
            squares                                       = generate_square_with_color_for_ethogramme(t_start_stop, dt,y(indice), option_shift );
            for k = 1 : length(squares)
%                 fprintf('%i\t %i\n ',length(squares(k).x), length(squares(k).y) );
                h = fill(squares(k).x, squares(k).y, color_list{j});
                set(h, 'EdgeColor', 'None');
                hold on;
            end
            ethogramme(indice).([behaviours{j} '_squares'])    = squares;

%             
            hold on;
            plot([t_end_local t_end_local]     , [y(indice) y(indice)+1] , '-m', 'LineWidth',4);
            plot([t_debut_local t_debut_local] , [y(indice) y(indice)+1] , '-g', 'LineWidth',4);
        end
        
    end
    indice = indice + 1;

end
   
axis([t_min t_max y(1) y(indice)]);


if nargin>=5
   n_t_start = length(t_start);
   for k4 = 1 : n_t_start;
        plot( [t_start(k4) t_start(k4)] , [0 y(indice)+1], '-m', 'LineWidth', 4); 
        plot( [t_stop(k4) t_stop(k4)] , [0 y(indice)+1], '-m', 'LineWidth', 2); 
   end
end

name_figure = ['ethogramme_' trx(1).pipeline '_' trx(1).neuron '_' trx(1).stimuli '_' trx(1).protocol];
for k = 1 : length(behaviours);
    name_figure= [name_figure, '_' behaviours{k}];
end
saveas(h,[name_figure '.eps'], 'epsc') ;

fichier = fopen('color_code.txt', 'w');
for i = 1 : n_behaviours
   fprintf(fichier, '%s\t %s\n', behaviours{i},color_names{i}); 
end
fclose(fichier);
close all force;


neuron   = trx(1).neuron;
protocol = trx(1).protocol;
stimuli  = trx(1).stimuli;
ethogramme_data.neuron   = neuron;
ethogramme_data.protocol = protocol;
ethogramme_data.stimuli  = stimuli;



if exist('ethogramme')== 1
    try
        save('ethogramme.mat', 'ethogramme', 'ethogramme_data');
    end
else
    ethogramme = [];
end

end
