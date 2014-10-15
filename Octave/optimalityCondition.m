%% optimalityCondition: function description
%% returns index of minimal inputvariable coeficient
function [in] = optimalityCondition(Cnbv)
    [value,index] = min(Cnbv);
    if (value<0)
        in = index;
    else
        in = -1;
    end

endfunction
