function squares = generate_square_with_color_for_ethogramme(t_start_stop, dt,y_start, option_shift, varargin )


switch lower(option_shift)
    
    case 'no_shift' 
    
        [n,~] = size(t_start_stop);
        for i = 1 : n;

            squares(i).x = [t_start_stop(i,1); t_start_stop(i,1); t_start_stop(i,2); t_start_stop(i,2)];
            squares(i).y = [y_start; y_start+1; y_start+1; y_start];

        end

    case 'shift'
        
        [n,~] = size(t_start_stop);
        for i = 1 : n;

            squares(i).x = [t_start_stop(i,1)-dt/2; t_start_stop(i,1)-dt/2; t_start_stop(i,2)+dt/2; t_start_stop(i,2)+dt/2];
            squares(i).y = [y_start; y_start+1; y_start+1; y_start];

        end
        
        
end


if ~exist('squares')
    squares = [];
end


end