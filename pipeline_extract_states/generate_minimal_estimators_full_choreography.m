function trx = generate_minimal_estimators_full_choreography(trx, rig)
%%
trx = give_center_of_mass(trx);
trx = define_necks_choreography(trx);
trx = give_direction_part_body_choreography(trx); 
trx = give_agitation_velocity(trx);
trx = give_S_spine_loc_choreography(trx);
trx = give_eig_reduced_loc_choreography(trx);
trx = get_smooth_fields_small_subset_choreography(trx);
trx = give_derivative_subset_choreography(trx);
trx = get_smooth_deriv_fields_small_subset_choreography(trx);
trx = give_log_some_features(trx);
trx = give_peristaltism_choreography(trx);
trx = get_smooth_signed_derivatives(trx);
trx = add_vector_id(trx);
trx = give_head_tail(trx, rig);
trx = redefine_necks(trx);
trx = give_smooth_motion_direction_vs_larva_axis(trx);
trx = give_effective_distance_moved(trx);
trx = give_motion_velocities(trx);


%% 
end

% trx = give_decompose_fourier_contour(trx);
% trx = give_recompose_fourier_contour(trx);
% trx = give_midline_loc_choreography(trx);
% trx = give_perimeter_loc_choreography(trx);
% trx = symmetry_break_choreography(trx);
% trx = give_direct_head_tail_distance_choreography(trx);
% trx = get_fake_head_tail_choreography(trx);
% trx = get_energy_choreography(trx);
% trx = get_past_smooth_choreography(trx);
% trx = get_directions_fields_choreography(trx);
% trx = get_curvature_choreography(trx);
% trx = get_overlapping_choreography(trx);
% trx = get_smooth_deriv_fields_choreography(trx);