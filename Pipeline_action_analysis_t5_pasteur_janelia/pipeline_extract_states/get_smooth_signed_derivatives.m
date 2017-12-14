function trx = get_smooth_signed_derivatives(trx)

name        = { 'S_deriv', 'eig_deriv' ,'velocity_agitation_deriv' };
nn          = [5,10,25];
name_smooth = {'S_deriv_smooth' , 'eig_deriv_smooth','velocity_agitation_deriv_smooth'};
n_name      = length(name);

n_trx = length(trx);
for k = 1 : length(nn);
    k_num{k} = num2str(nn(k));
end


for k = 1 : length(nn)
    for i = 1 : n_trx
        for j = 1 : n_name

            variable                            = trx(i).(name{j});
            variable_s                          = gaussian_smooth_choreography(variable, nn(k));
            trx(i).([name_smooth{j} '_' k_num{k}]) = variable_s;

        end
    end
end


end