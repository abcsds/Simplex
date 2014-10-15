%% simplex: function description
function [x, z] = simplex(C, A, b)
    [m,n] = size(A)
    lenC = length(C)
    lenb = length(b)
    if (length(b)~=m)
        error('Size of C and M dont match');
    endif
    if (length(C)~=n)
        error('Size of b and N dont match');
    endif
    rows = m+1;
    cols = n+m+1;
    bv = zeros(1,m);
    nbv = zeros(1,n);
    bs = zeros(1,n+m);

    % parcial = [A,eye(m),b']
    % costs = [-C,zeros(1,m+1)]
    % tabular = [parcial;costs]
    tabular = [[A,eye(m),b'];[-C,zeros(1,m+1)]];

    bv = n+1:m+n;
    nbv = 1:n;
    bs(bv) = tabular(1:m,cols);


    % Loop
    while 1
        in = optimalityCondition(tabular(rows,nbv));
        if in == -1
            break;
        end
        c_pivot = nbv(in);

        out = factibilityCondition(tabular(1:m,cols)./tabular(1:m,c_pivot));
        if out == -1
            error('No solution');
        end
        r_pivot = out;
        den = tabular(r_pivot, c_pivot);
        tabular(r_pivot,:) = tabular(r_pivot,:)/den;
        % Change basic variables for next iteration
        aux = nbv(in);
        nbv(c_pivot) = bv(out);
        bv(out) = aux;
        % Clear for i:/:rows
        for i=1:rows
            if i == r_pivot
                continue;
            end
            fact = tabular(i,c_pivot);
            % To see steps remove the semi-colon here
            tabular(i,:) = tabular(i,:)-fact*tabular(r_pivot,:);
        end
        bs(bv) = tabular(1:m,cols);
        bs(nbv) = 0;

    end

    x= bs;
    z = tabular(rows,cols);




endfunction
