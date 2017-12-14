function linear_sequence_count =  from_sequence_to_linear_path_count_select_n(sequence_in_matrix, n_choice)


sequence_in_matrix    = sequence_in_matrix(:,1:n_choice);
[n_larva, m_larva]    = size(sequence_in_matrix);
behaviour             = {'run', 'cast', 'stop', 'hunch', 'back', 'roll'};
number_behaviour      = {'1'  ,   '2' ,   '3' ,   '4'  ,  '5'  ,   '6' };
n_behaviour           = length(behaviour);
n                     = round(n_behaviour.^m_larva);

linear_sequence_count = zeros(n,1);

for j = 1 : n_larva
    
    indice = 0;
    for ll = 1 : 1 : m_larva-1
        indice = indice +  (sequence_in_matrix(j,ll) -1)*n_behaviour.^(m_larva - ll ) ;
    end
    indice = indice + sequence_in_matrix(j,m_larva);
%     fprintf('%i\t %i\n', j,indice);
    linear_sequence_count(indice,1) = linear_sequence_count(indice,1) + 1;
    clear indice;
    
end







end