function behaviour_existence = check_if_behaviour_exists(trx)

n_trx       = length(trx);
n_behaviour = 6;

behaviour_existence = zeros(6,1);

for j = 1 : n_behaviour
    
    for i = 1 : n_trx

        start_stop = trx(i).start_stop{j};
        if ~isempty(start_stop)
            behaviour_existence(j,1) = 1;
            break;
        end


    end
end






end