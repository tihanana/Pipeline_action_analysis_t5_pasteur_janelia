function print_sequence_number_transition_n_behaviours(name_output, sequence_in_matrix, n_post)



linear_sequence_count =  from_sequence_to_linear_path_count_select_n(sequence_in_matrix, n_post);
behaviour             = {'1', '2', '3', '4', '5', '6'};
% n_sequence            = length(linear_sequence_count) ;



fill_matrix_linear_print(name_output, linear_sequence_count, behaviour, n_post);



% 
% 
% indice = 1;
% matrix_linear_print{indice,1} = '';
% matrix_linear_print{indice,2} = 'Pre';
% matrix_linear_print{indice,3} = '1';
% matrix_linear_print{indice,4} = '2';
% matrix_linear_print{indice,5} = '3';
% matrix_linear_print{indice,6} = 'value';
% 
% 
% indice = indice + 1;
% for i = 1 : 6
%     for j = 1 : 6 
%         for k = 1 : 6
%             for l = 1 : 6
%                 matrix_linear_print{indice,1} = num2str(indice-1);
%                 matrix_linear_print{indice,2} = behaviour{i};
%                 matrix_linear_print{indice,3} = behaviour{j};
%                 matrix_linear_print{indice,4} = behaviour{k};
%                 matrix_linear_print{indice,5} = behaviour{l};  
%                 matrix_linear_print{indice,6} = num2str(linear_sequence_count(indice-1));
%                 indice = indice + 1;
%             end
%         end
%     end
% end
% 
% 
% 
% [n,m]   = size( matrix_linear_print );
% fichier = fopen([name_output '.txt'], 'w+');
% 
% for i = 1 : n
%    for j = 1 : m
%       fprintf(fichier, '%s\t', matrix_linear_print{i,j}); 
%    end
%    fprintf(fichier, '\n');     
% end
% 
% fclose(fichier);
% 
% 











end