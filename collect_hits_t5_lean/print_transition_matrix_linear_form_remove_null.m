function print_transition_matrix_linear_form_remove_null(name_output, matrix)



%%  reshape matrix
behaviour           = {'run', 'cast', 'stop', 'hunch', 'back', 'roll'};
n_behaviour = length(behaviour);

index_column_kill = [];
index_row_kill    = [];
index_row         = 1;
index_column      = 1;
for i =1 : n_behaviour
    if sum(matrix(i,:))==0
       index_row_kill  = [index_row_kill ; i];
    else
        behaviour_row{1,index_row} = behaviour{i};
        indixe_row_survive(1,index_row ) = i;
        index_row = index_row + 1;
    end
    
    if sum(matrix(:,i))==0
       index_column_kill  = [index_column_kill ; i];
    else
        behaviour_column{1,index_column} = behaviour{i};
        indixe_column_survive(1,index_column ) = i;
        index_column = index_column + 1;
    end
end

n_row          = length(index_row_kill);
n_column       = length(index_column_kill);

n_row_final    = n_behaviour +1 - n_row;
n_column_final = n_behaviour +1 - n_column ;

matrix_print   = cell(n_row_final  , n_column_final );

for i = 2 : n_row_final
    matrix_print{i,1} = behaviour_row{i-1};
end 
for i = 2 : n_column_final
    matrix_print{1,i} = behaviour_column{i-1};
end 

for i = 1 :  n_behaviour - n_row;
    for j = 1 :  n_behaviour  - n_column
        matrix_print{i+1,j+1} = num2str(matrix(   indixe_row_survive(1,i )   , indixe_column_survive(1,j )  ));
    end
end





%%

nn    = 6;
n_tot = (n_behaviour - n_row)*( n_behaviour  - n_column)+1;
m     = 4;

matrix_linear_print = cell(n_tot,4);

%%


indice = 1;
matrix_linear_print{indice,1} = '';
matrix_linear_print{indice,2} = 'from';
matrix_linear_print{indice,3} = 'to';
matrix_linear_print{indice,4} = 'value';
indice = indice + 1;
for i = 1 :n_behaviour - n_row
    for j = 1 :  n_behaviour  - n_column
        matrix_linear_print{indice,1} = num2str(indice-1);
        matrix_linear_print{indice,2} = behaviour_row{i};
        matrix_linear_print{indice,3} = behaviour_column{j};
        matrix_linear_print{indice,4} = num2str(matrix( indixe_row_survive(1,i ) ,indixe_column_survive(1,j )) );
        indice = indice + 1;
    end
    
end




fichier = fopen([name_output '.txt'], 'w+');

for i = 1 : n_tot
   for j = 1 : m
      fprintf(fichier, '%s\t', matrix_linear_print{i,j}); 
   end
   fprintf(fichier, '\n');     
end

fclose(fichier);

