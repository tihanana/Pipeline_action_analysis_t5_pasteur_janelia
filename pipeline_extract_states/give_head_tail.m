function trx = give_head_tail(trx, rig)

% [trx] = give_local_moving_axis(trx);
[trx] = define_necks_choreography(trx);
[trx] = give_local_moving_axis(trx);
[trx] = pre_initialize_head_cast(trx);
[trx] = give_head_and_tail_speed(trx);
[trx] = give_head_tail_position_in_contour(trx);
[trx] = give_decompose_fourier_contour(trx);
[trx] = give_recompose_fourier_contour(trx);
[trx] = give_regularize_spine(trx);
[trx] = give_head_tail_position_in_contour_fourier(trx);
[trx] = give_head_tail_in_boths_contours(trx);
[trx] = give_contour_fourier_curvature(trx);
[trx] = give_local_curvature_at_head_tail(trx);
[trx] = get_local_head_tail_from_headtail_struct(trx);
[trx] = give_distance_headtail_dt(trx);
[trx] = give_head_tail_distance_matrix(trx);
[trx] = give_head_tail_to_mid_distance(trx);
[trx] = give_motion_direction_vs_larva_axis(trx); 
[trx] = give_motion_velocity(trx);
[trx] = compute_all_HMM_HT(trx,rig);
[trx] = give_head_and_tail_from_HMM(trx);
[trx] = redefine_necks(trx);
[trx] = redefine_necks_fourier(trx); 


end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% [trx] = give_double_angle_head_tail(trx); 
% [trx] = give_width_top_bottom(trx);