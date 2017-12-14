function [behaviour_proba] =  ensemble_averaged_behaviours_cluster(trx, behaviours, t_min, t_max, t_start,t_stop, show_me, varargin)

color_list   = {'k', 'r', 'g', 'b','c', 'y', 'm'};
color_names  = {'black', 'red', 'green', 'blue', 'cyan', 'yellow', 'magenta'};



h = figure('Visible', 'off');
axes1 = axes('Parent',h,'YScale','linear','YMinorTick','off','XScale','linear', 'FontSize',20,'LineWidth',2);
box(axes1,'on');
hold(axes1,'all');



for j = 1 : length(behaviours)
    behaviours_loc                              = behaviours{j};

    [t, behaviour_mean, behaviour_error,nb_active_larva]        = average_evolution_all_experiments_states_choreography(trx, behaviours_loc, t_min, t_max);

    behaviour_proba.t                           = t;
    behaviour_proba.([behaviours_loc '_mean' ]) = behaviour_mean;
    behaviour_proba.([behaviours_loc '_error']) = behaviour_error;
    behaviour_proba.([behaviours_loc '_nb_active_larva']) = nb_active_larva;
end
% behaviour_proba.nb_active_larva = nb_active_larva;
%     [t, behaviour_mean, behaviour_error]        = average_evolution_all_experiments_estimator_choreography(trx,behaviours_loc);
%     fprintf('%i\t %s\t %f\n', j,behaviours_loc,behaviour_mean );

for j = 1 : length(behaviours);
    behaviours_loc                              = behaviours{j};
    plot(behaviour_proba.t, behaviour_proba.([behaviours_loc '_mean' ]),'color',color_list{j} , 'LineWidth',3);
    hold on;
end



try
if nargin>=5
   n_t_start = length(t_start);
   for k4 = 1 : n_t_start;
        plot( [t_start(k4) t_start(k4)] , [0 1], '-m', 'LineWidth', 4);  
        hold on;
        plot( [t_stop(k4) t_stop(k4)] , [0 1], '-m', 'LineWidth', 2);  
        
   end
   
end
axis([t_min t_max 0 1]);

name_figure = ['Ensemble_averaged_behaviour_' trx(1).pipeline '_' trx(1).neuron '_' trx(1).stimuli '_' trx(1).protocol];
for k = 1 : length(behaviours);
    name_figure= [name_figure, '_' behaviours{k}];
end

try
saveas(h,[name_figure '.eps'], 'epsc') ;
end
end

neuron   = trx(1).neuron;
protocol = trx(1).protocol;
stimuli  = trx(1).stimuli;
behaviour_proba_data.neuron   = neuron;
behaviour_proba_data.protocol = protocol;
behaviour_proba_data.stimuli  = stimuli;


close all force;
save('behaviour_probability.mat', 'behaviour_proba', 'behaviour_proba_data') ;





% close all force;
