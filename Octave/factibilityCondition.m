%% factibilityCondition: function description
function [out] = factibilityCondition(ratio)
    I = find(ratio>0);
    if length(I) == 0
        out = -1;
    else
        [value,index] = min(ratio(I));
        out = I(index);
    end
endfunction
