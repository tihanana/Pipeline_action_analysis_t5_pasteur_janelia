function persistence = persistence_analysis(trx_all, t_start, t_stop,varargin)


n_behaviour    = 6;
n_trx_all      = length(trx_all);

dt_persistence             = cell(n_behaviour,1);
dt_persistence_since_start = cell(n_behaviour,1);
nb_active_larva            = cell(n_behaviour,1);
number_larva               = cell(n_behaviour,1);
t_end                      = cell(n_behaviour,1);

for j = 1 : n_behaviour
    dt_persistence{j,1}             = [];
    dt_persistence_since_start{j,1} = [];
    number_larva{j,1}               = [];       
    t_end{j,1}                      = [];      
end


for i = 1 : n_trx_all
    t_start_stop = trx_all(i).t_start_stop;
    for j = 1 : n_behaviour 
        t_start_stop_loc = t_start_stop{j};
        if ~isempty(t_start_stop_loc )
            II               = find((t_start_stop_loc(:,1)<= t_stop)& (t_start_stop_loc(:,2)> t_stop));
            if ~isempty(II )
                dt_persistence{j,1}             = [dt_persistence{j,1}; t_start_stop_loc(II,2)-t_stop]; 
                dt_persistence_since_start{j,1} = [dt_persistence_since_start{j,1}; t_start_stop_loc(II,2) - t_start_stop_loc(II,1) ];
                number_larva{j,1}               = [number_larva{j,1}; i];
                t_end{j,1}                      = [t_end{j,1}; trx_all(i).t(end)];
            end
            clear II;
        end
    end
    
end

for j = 1 : n_behaviour
    [nn, ~ ] = size(dt_persistence{j,1});
    nb_active_larva{j,1} = nn;
    clear nn;
end



persistence.dt_persistence             =  dt_persistence;
persistence.dt_persistence_since_start =  dt_persistence_since_start;
persistence.nb_active_larva            =  nb_active_larva ; 
persistence.number_larva               =  number_larva;
persistence.t_end                      =  t_end;



neuron                      = trx_all(1).neuron;
protocol                    = trx_all(1).protocol;
stimuli                     = trx_all(1).stimuli;
persistence_data.neuron     = neuron;
persistence_data.protocol   = protocol;
persistence_data.stimuli    = stimuli;



save('persistence.mat', 'persistence', 'persistence_data');


end