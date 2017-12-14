function trx = collect_one_example_trx()


files   = subdir(fullfile(pwd,'trx_with_*'));
n_files = length(files);

for j = 1 : n_files 
    load(files(j).name);
    if ~isempty(trx)
        break;
    end
end

