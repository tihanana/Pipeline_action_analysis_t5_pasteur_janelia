function [min_loc, t_min_loc,  max_loc, t_max_loc] = give_min_max_time_window_choreography(t, Y, t_start, dt)



II = (t>= t_start ) & (t<= t_start + dt);

t_loc = t(II);
Y_loc = Y(II);

[min_loc,I_min_loc] = min(Y_loc);
t_min_loc           = t_loc(I_min_loc);

[max_loc,I_max_loc] = max(Y_loc);
t_max_loc           = t_loc(I_max_loc);










end