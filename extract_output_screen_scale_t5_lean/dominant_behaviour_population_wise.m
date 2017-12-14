function dominant = dominant_behaviour_population_wise(trx, t_min, t_max, t_start, t_stop,behaviour_proba, show_me, varargin)

behaviours        = {'run', 'cast', 'stop', 'hunch', 'back', 'roll'};
% [behaviour_proba] =  ensemble_averaged_behaviours_cluster_in_time_period(trx, behaviours, t_min, t_max, t_start,t_stop ,show_me);

t                 = behaviour_proba.t;
II                = (t>=t_min) & (t<= t_max);

run               = behaviour_proba.run_mean;
cast              = behaviour_proba.cast_mean;
stop              = behaviour_proba.stop_mean;
hunch             = behaviour_proba.hunch_mean;
back              = behaviour_proba.back_mean;
roll              = behaviour_proba.roll_mean;

t                 = t(II);
run               = run(II);
cast              = cast(II);
stop              = stop(II);
hunch             = hunch(II);
back              = back(II);
roll              = roll(II);

behaviour_matrix               = [run', cast' , stop' , hunch', back', roll'];
[behaviour_matrix_ordered, II] = sort(behaviour_matrix, 2, 'descend');

dominant.t                      = t;
dominant.first_behaviour        = II(:,1);
dominant.second_behaviour       = II(:,2);

fichier = fopen('dominant_behaviour_population_wise', 'w+');
for j = 1 : length(dominant.t )
   fprintf(fichier, '%f\t %i\t %i\n', t(j), dominant.first_behaviour(j), dominant.second_behaviour(j) ); 
end
fclose(fichier);



%% figure
h = figure('Visible', 'off');
axes1 = axes('Parent',h,'YScale','linear','YMinorTick','off','XScale','linear', 'FontSize',20,'LineWidth',2);
box(axes1,'on');
hold(axes1,'all');

plot(dominant.t, dominant.first_behaviour, '-k', 'LineWidth',3);
hold on;
plot(dominant.t, dominant.second_behaviour, '-r', 'LineWidth',3);

plot( [t_start(1) t_start(1)] , [0 7], '-m', 'LineWidth', 4); 
plot( [t_stop(1) t_stop(1)] , [0 7], '-m', 'LineWidth', 2); 

axis([t_min t_max 0 7]);
name_figure = ['Dominant_behaviour_' trx(1).pipeline '_' trx(1).neuron '_' trx(1).stimuli '_' trx(1).protocol];

try
saveas(h,[name_figure '.eps'], 'epsc') ;
end
close all force;


neuron                  = trx(1).neuron;
protocol                = trx(1).protocol;
stimuli                 = trx(1).stimuli;
dominant_data.neuron    = neuron;
dominant_data.protocol  = protocol;
dominant_data.stimuli   = stimuli;



save('dominant.mat', 'dominant', 'dominant_data');







end