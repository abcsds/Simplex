% simplex: Linear program solving method
% Usage
% 
% [x,z] = simplex(C,A,b,verbose=false)
% 
% where:
%     C is a costs vector (m x 1)
%     A is the restrictions matrix (m x n)
%     b is the right hand vector (n x 1)
% 

function [x, z] = simplex(C, A, b, verbose=false)
    % simplex: Linear program solving method
    % Usage
    % 
    % [x,z] = simplex(C,A,b,verbose=false)
    % 
    % where:
    %     C is the objective function vector (m x 1)
    %     A is the constraints matrix (m x n)
    %     b is the right-hand-side vector (n x 1)
    %

    [m,n] = size(A);
    if (length(b)~=m)
        error('Size of C and M dont match\n');
    endif
    if (length(C)~=n)
        error('Size of b and N dont match\n');
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
            error('No solution found.\n');
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

        % For Every iteration print the result table 
        if verbose
            format short;
            fprintf('\n');
            for i=1:m+n
                fprintf('         x%d',i);
            end
            fprintf('         b\n');
            for i=1:m
                fprintf('R%d',i);
                disp(tabular(i,:));
            end
            fprintf('\n');

            fprintf('R%d',m+1);
            disp(tabular(m+1,:));
            fprintf('\n');
            input('Press a key for next iteration...');
        end

    end
    % Print last iteration
    if verbose
            format short;
            fprintf('\n');
            fprintf('Simplex method finished.\n');
            for i=1:m+n
                fprintf('         x%d',i);
            end
            fprintf('         b\n');
            for i=1:m
                fprintf('R%d',i);
                disp(tabular(i,:));
            end
            fprintf('\n');

            fprintf('R%d',m+1);
            disp(tabular(m+1,:));
            fprintf('\n');
            fprintf('Result:\n')
            % input('Press a key to end function...');
            for i=1:m+n
                fprintf('x%d = %d\n',i,bs(:,i));
            end
            fprintf('\n');
            fprintf('Z = %d\n\n', tabular(rows,cols));



        end
    % TODO: add help display

    x = bs;
    z = tabular(rows,cols);




endfunction
