function trx = collect_all_trx_in_an_experiement_screen_lean(liste)


files   = subdir(fullfile(pwd,'trx_with_*'));
n_files = length(files);

for j = 1 : n_files 
    load(files(j).name);
    trx_out = trx;
    
    if ~isempty(trx_out)
        trx_out = remove_most_fields_trx(trx_out, liste);
        break;
    end
end
clear trx

for i = j+1 : n_files
%     fprintf('%i\t %i\n', i, n_files);
    try
        load(files(i).name);
        if ~isempty(trx)
            trx = remove_most_fields_trx(trx, liste);
            trx_out = [trx_out; trx];
            
        end
    end
    clear trx;
end


if exist('trx_out')
    trx = trx_out;
    clear trx_out;
    trx = remove_most_fields_trx(trx, liste);
else
    trx = [];
end
clear trx_out;
