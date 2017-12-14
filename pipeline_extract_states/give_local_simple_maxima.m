function [I] = give_local_simple_maxima(vecteur)

nnn      = length(vecteur);
vecteur1 = vecteur(1:end-2);
vecteur2 = vecteur(2:end-1);
vecteur3 = vecteur(3:end);


I        = find(((vecteur2>vecteur1)&(vecteur2>vecteur3)));
I        = I + 1;



JJ       = vecteur(I)>0;
I        = I(JJ);

J       = I;
clear I;
indice = 1;

for i = 1 :length(J) 
    if (J(i) <= 2)
       I(indice,1) = J(i);
       indice = indice + 1;
    elseif (J(i)>= nnn -2)
       I(indice,1) = J(i);
       indice = indice + 1;
    else    
        if ( (vecteur(J(i)) >= vecteur(J(i)-1)) & ...
             (vecteur(J(i)) >= vecteur(J(i)-2)) & ...
              (vecteur(J(i)) >= vecteur(J(i)+1)) & ...
              (vecteur(J(i)) >= vecteur(J(i)+2)) )
            I(indice,1) = J(i);
            indice = indice + 1;
        end
        
    end
    
end

if ~exist('I')
   I = []; 
end

end


