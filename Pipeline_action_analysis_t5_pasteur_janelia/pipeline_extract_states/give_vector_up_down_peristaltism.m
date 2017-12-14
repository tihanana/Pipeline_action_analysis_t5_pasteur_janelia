function [vecteur] = give_vector_up_down_peristaltism(I,J,t)

n          = length(t);
vecteur    = zeros(n,1);
vecteur(I) = 1;
vecteur(J) = 1;


end