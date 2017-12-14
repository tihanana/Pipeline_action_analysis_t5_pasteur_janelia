function trx = select_larva_present_in_time_window(trx, t_min, t_max)


indice = 1;

for i = 1 : length(trx)

   t             = trx(i).t;
   t_end_local   = max(t);
   t_debut_local = min(t);
   
   if (t_end_local >= t_min) && (t_debut_local <= t_max)
        trx_out(indice,1) = trx(i,1);
        indice = indice + 1;
   end
   
   clear t  t_end_local t_debut_local ;
end


trx = trx_out;



end