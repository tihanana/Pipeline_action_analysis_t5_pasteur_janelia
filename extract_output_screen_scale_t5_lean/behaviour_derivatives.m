function derivatives = behaviour_derivatives(trx, t_min, t_max, t_start, t_stop,behaviour_proba, show_me, varargin)

dt_window_1       = 1;
dt_window_2       = 2;
dt_window_end     = 5;

behaviours        = {'run', 'cast', 'stop', 'hunch', 'back', 'roll'};
% [behaviour_proba] =  ensemble_averaged_behaviours_cluster_in_time_period(trx, behaviours, t_min, t_max, t_start,t_stop ,show_me);
n_smooth          = 10;
t                 = behaviour_proba.t;
II                = (t>=t_min) & (t<= t_max);



run               = behaviour_proba.run_mean;
cast              = behaviour_proba.cast_mean;
stop              = behaviour_proba.stop_mean;
hunch             = behaviour_proba.hunch_mean;
back              = behaviour_proba.back_mean;
roll              = behaviour_proba.roll_mean;
nb_active_larva_run    = behaviour_proba.run_nb_active_larva;
nb_active_larva_cast   = behaviour_proba.cast_nb_active_larva;
nb_active_larva_stop   = behaviour_proba.stop_nb_active_larva;
nb_active_larva_hunch  = behaviour_proba.hunch_nb_active_larva;
nb_active_larva_back   = behaviour_proba.back_nb_active_larva;
nb_active_larva_roll   = behaviour_proba.roll_nb_active_larva;

t                 = t(II);
run               = run(II)';
cast              = cast(II)';
stop              = stop(II)';
hunch             = hunch(II)';
back              = back(II)';
roll              = roll(II)';
nb_active_larva_run   = nb_active_larva_run(II)';
nb_active_larva_cast   = nb_active_larva_cast(II)';
nb_active_larva_stop   = nb_active_larva_stop(II)';
nb_active_larva_hunch   = nb_active_larva_hunch(II)';
nb_active_larva_back   = nb_active_larva_back(II)';
nb_active_larva_roll   = nb_active_larva_roll(II)';




II_before        = t<= t_start;
II_just_after    = (t>= t_start) & (t<= t_start + dt_window_1);

JJ_before        = ( t <= t_stop) & (t >= t_stop - dt_window_1);
JJ_after         = ( t <= t_stop + dt_window_end) & (t >= t_stop);

% nb_active_larva_start = mean(nb_active_larva(II_just_after));
% nb_active_larva_stop  = mean(nb_active_larva(JJ_after));


nb_active_larva_run_start   =  mean(nb_active_larva_run(II_just_after));
nb_active_larva_cast_start   =  mean(nb_active_larva_cast(II_just_after));
nb_active_larva_stop_start   =  mean(nb_active_larva_stop(II_just_after));
nb_active_larva_hunch_start   =  mean(nb_active_larva_hunch(II_just_after));
nb_active_larva_back_start   =  mean(nb_active_larva_back(II_just_after));
nb_active_larva_roll_start   =  mean(nb_active_larva_roll(II_just_after));

nb_active_larva_run_stop   =  mean(nb_active_larva_run(JJ_after));
nb_active_larva_cast_stop   =  mean(nb_active_larva_cast(JJ_after));
nb_active_larva_stop_stop   =  mean(nb_active_larva_stop(JJ_after));
nb_active_larva_hunch_stop   =  mean(nb_active_larva_hunch(JJ_after));
nb_active_larva_back_stop   =  mean(nb_active_larva_back(JJ_after));
nb_active_larva_roll_stop   =  mean(nb_active_larva_roll(JJ_after));


derivatives.nb_active_larva_run_start  = nb_active_larva_run_start ;
derivatives.nb_active_larva_cast_start  = nb_active_larva_cast_start ;
derivatives.nb_active_larva_stop_start  = nb_active_larva_stop_start ;
derivatives.nb_active_larva_hunch_start  = nb_active_larva_hunch_start ;
derivatives.nb_active_larva_back_start  = nb_active_larva_back_start ;
derivatives.nb_active_larva_roll_start  = nb_active_larva_roll_start ;

derivatives.nb_active_larva_run_stop  = nb_active_larva_run_stop ;
derivatives.nb_active_larva_cast_stop  = nb_active_larva_cast_stop ;
derivatives.nb_active_larva_stop_stop  = nb_active_larva_stop_stop ;
derivatives.nb_active_larva_hunch_stop  = nb_active_larva_hunch_stop ;
derivatives.nb_active_larva_back_stop  = nb_active_larva_back_stop ;
derivatives.nb_active_larva_roll_stop  = nb_active_larva_roll_stop ;


% derivatives.nb_active_larva_stop  = nb_active_larva_stop;

% JJ_after         = ( t <= t(end)) & (t >= t(end) - dt_window_end);


% run         = gaussian_smooth_choreography(run   , n_smooth);
% cast        = gaussian_smooth_choreography(cast  , n_smooth);
% stop        = gaussian_smooth_choreography(stop  , n_smooth);
% hunch       = gaussian_smooth_choreography(hunch , n_smooth);
% back        = gaussian_smooth_choreography(back  , n_smooth);
% roll        = gaussian_smooth_choreography(roll  , n_smooth);

dt          = ( t(2:end) - t(1:end-1))';
d_run       = (run(2:end)-run(1:end-1))./dt;
d_cast      = (cast(2:end)-cast(1:end-1))./dt;
d_stop      = (stop(2:end)-stop(1:end-1))./dt;
d_hunch     = (hunch(2:end)-hunch(1:end-1))./dt;
d_back      = (back(2:end)-back(1:end-1))./dt;
d_roll      = (roll(2:end)-roll(1:end-1))./dt;

d_run       = [d_run   ; d_run(end)];
d_cast      = [d_cast  ; d_cast(end)];
d_stop      = [d_stop  ; d_stop(end)];
d_hunch     = [d_hunch ; d_hunch(end)];
d_back      = [d_back  ; d_back(end)];
d_roll      = [d_roll  ; d_roll(end)];


d_run         = gaussian_smooth_choreography(d_run   , n_smooth);
d_cast        = gaussian_smooth_choreography(d_cast  , n_smooth);
d_stop        = gaussian_smooth_choreography(d_stop  , n_smooth);
d_hunch       = gaussian_smooth_choreography(d_hunch , n_smooth);
d_back        = gaussian_smooth_choreography(d_back  , n_smooth);
d_roll        = gaussian_smooth_choreography(d_roll  , n_smooth);




derivatives.t       = t;
derivatives.d_run   = d_run;
derivatives.d_cast  = d_cast;
derivatives.d_stop  = d_stop;
derivatives.d_hunch = d_hunch;
derivatives.d_back  = d_back;
derivatives.d_roll  = d_roll;



%% t start

ground_run_before   = mean(run(II_before ));
ground_cast_before  = mean(cast(II_before ));
ground_stop_before  = mean(stop(II_before ));
ground_hunch_before = mean(hunch(II_before ));
ground_back_before  = mean(back(II_before ));
ground_roll_before  = mean(roll(II_before ));

just_after_run_before   = mean(run(II_just_after ));
just_after_cast_before  = mean(cast(II_just_after ));
just_after_stop_before  = mean(stop(II_just_after ));
just_after_hunch_before = mean(hunch(II_just_after ));
just_after_back_before  = mean(back(II_just_after ));
just_after_roll_before  = mean(roll(II_just_after ));


difference_after_start_ground_run   = just_after_run_before - ground_run_before;
difference_after_start_ground_cast  = just_after_cast_before - ground_cast_before;
difference_after_start_ground_stop  = just_after_stop_before - ground_stop_before;
difference_after_start_ground_hunch = just_after_hunch_before - ground_hunch_before;
difference_after_start_ground_back  = just_after_back_before - ground_back_before;
difference_after_start_ground_roll  = just_after_roll_before - ground_roll_before;

%% t stop

ground_run_before   = mean(run(JJ_before ));
ground_cast_before  = mean(cast(JJ_before ));
ground_stop_before  = mean(stop(JJ_before ));
ground_hunch_before = mean(hunch(JJ_before ));
ground_back_before  = mean(back(JJ_before ));
ground_roll_before  = mean(roll(JJ_before ));

after_run_before   = mean(run(JJ_after ));
after_cast_before  = mean(cast(JJ_after  ));
after_stop_before  = mean(stop(JJ_after  ));
after_hunch_before = mean(hunch(JJ_after  ));
after_back_before  = mean(back(JJ_after  ));
after_roll_before  = mean(roll(JJ_after  ));

difference_after_stop_ground_run   = after_run_before   - ground_run_before;
difference_after_stop_ground_cast  = after_cast_before  - ground_cast_before;
difference_after_stop_ground_stop  = after_stop_before  - ground_stop_before;
difference_after_stop_ground_hunch = after_hunch_before - ground_hunch_before;
difference_after_stop_ground_back  = after_back_before  - ground_back_before;
difference_after_stop_ground_roll  = after_roll_before  - ground_roll_before;



%% calcul derivative

[d_run_min_loc  ,  d_run_t_min_loc,   d_run_max_loc    , d_run_t_max_loc]    = give_min_max_time_window_choreography(t, d_run,   t_start,   dt_window_1);
[d_cast_min_loc , d_cast_t_min_loc,  d_cast_max_loc    , d_cast_t_max_loc]   = give_min_max_time_window_choreography(t, d_cast,  t_start,   dt_window_1);
[d_stop_min_loc , d_stop_t_min_loc  ,  d_stop_max_loc  , d_stop_t_max_loc]   = give_min_max_time_window_choreography(t, d_stop,  t_start,   dt_window_1);
[d_hunch_min_loc, d_hunch_t_min_loc,  d_hunch_max_loc  , d_hunch_t_max_loc]  = give_min_max_time_window_choreography(t, d_hunch, t_start,   dt_window_1);
[d_back_min_loc , d_back_t_min_loc,  d_back_max_loc    , d_back_t_max_loc]   = give_min_max_time_window_choreography(t, d_back,  t_start,   dt_window_1);
[d_roll_min_loc , d_roll_t_min_loc,  d_roll_max_loc    , d_roll_t_max_loc]   = give_min_max_time_window_choreography(t, d_roll,  t_start,   dt_window_1);


%% t_start
if difference_after_start_ground_run>0
    derivatives.start_run = d_run_max_loc;
else
    derivatives.start_run = d_run_min_loc;
end

if difference_after_start_ground_cast>0
    derivatives.start_cast = d_cast_max_loc;
else
    derivatives.start_cast = d_cast_min_loc;
end
if difference_after_start_ground_stop>0
    derivatives.start_stop = d_stop_max_loc;
else
    derivatives.start_stop = d_stop_min_loc;
end
if difference_after_start_ground_hunch>0
    derivatives.start_hunch = d_hunch_max_loc;
else
    derivatives.start_hunch = d_hunch_min_loc;
end
if difference_after_start_ground_back>0
    derivatives.start_back = d_back_max_loc;
else
    derivatives.start_back = d_back_min_loc;
end
if difference_after_start_ground_roll>0
    derivatives.start_roll = d_roll_max_loc;
else
    derivatives.start_roll = d_roll_min_loc;
end

%% t_stop
[d_run_min_loc  ,  d_run_t_min_loc,   d_run_max_loc    , d_run_t_max_loc]    = give_min_max_time_window_choreography(t, d_run,   t_stop,   dt_window_2);
[d_cast_min_loc , d_cast_t_min_loc,  d_cast_max_loc    , d_cast_t_max_loc]   = give_min_max_time_window_choreography(t, d_cast,  t_stop,   dt_window_2);
[d_stop_min_loc , d_stop_t_min_loc  ,  d_stop_max_loc  , d_stop_t_max_loc]   = give_min_max_time_window_choreography(t, d_stop,  t_stop,   dt_window_2);
[d_hunch_min_loc, d_hunch_t_min_loc,  d_hunch_max_loc  , d_hunch_t_max_loc]  = give_min_max_time_window_choreography(t, d_hunch, t_stop,   dt_window_2);
[d_back_min_loc , d_back_t_min_loc,  d_back_max_loc    , d_back_t_max_loc]   = give_min_max_time_window_choreography(t, d_back,  t_stop,   dt_window_2);
[d_roll_min_loc , d_roll_t_min_loc,  d_roll_max_loc    , d_roll_t_max_loc]   = give_min_max_time_window_choreography(t, d_roll,  t_stop,   dt_window_2);

if difference_after_stop_ground_run>0
    derivatives.stop_run = d_run_max_loc;
else
    derivatives.stop_run = d_run_min_loc;
end

if difference_after_stop_ground_cast>0
    derivatives.stop_cast = d_cast_max_loc;
else
    derivatives.stop_cast = d_cast_min_loc;
end
if difference_after_stop_ground_stop>0
    derivatives.stop_stop = d_stop_max_loc;
else
    derivatives.stop_stop = d_stop_min_loc;
end
if difference_after_stop_ground_hunch>0
    derivatives.stop_hunch = d_hunch_max_loc;
else
    derivatives.stop_hunch = d_hunch_min_loc;
end
if difference_after_stop_ground_back>0
    derivatives.stop_back = d_back_max_loc;
else
    derivatives.stop_back = d_back_min_loc;
end
if difference_after_stop_ground_roll>0
    derivatives.stop_roll = d_roll_max_loc;
else
    derivatives.stop_roll = d_roll_min_loc;
end

neuron   = trx(1).neuron;
protocol = trx(1).protocol;
stimuli  = trx(1).stimuli;

derivatives_data.neuron   = neuron;
derivatives_data.protocol = protocol;
derivatives_data.stimuli  = stimuli;





save('derivatives.mat', 'derivatives', 'derivatives_data');




end







