function [protocol,pipeline, stimuli, neuron] = process_names(name)



k    = strfind(name,'/');
k    = k(end);
name = name(k(end)+1:end);

k    = strfind(name,'.');
name = name(1:k-1);


k        = strfind(name,'@');
n        = length(k);
protocol = name(k(end-1)+1:k(end)-1);
pipeline = name(k(n-2)+1:k(n-1)-1);
stimuli  = name(k(n-3)+1:k(n-2)-1);
neuron   = name(k(n-4)+1:k(n-3)-1);






end