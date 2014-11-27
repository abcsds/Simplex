%% simplex: Revised Simplex implementation adapted for bigM method.

% Usage

% [x,z] = simplex(A, b, C, s, d=false, max=true, M=1000000)

% where:
%     A is the restrictions matrix (n x m)
%     b is the right hand vector (1 x m)
%     C is a costs vector (n x 1)
%     s is the signs vector (1 x m) if set to false defaults to -1
%     d is a debug flag that defaults to false
%     max is boolean flag that represents maximization, problem solves minimzation when set to false
%     M is the constant used for BigM value, defaults to one million

% Signs are represented by the following values:
%     -1 ≤
%     0 =
%     1 ≥

function [x, z] = simplex(A, b, C, s, d=false, max=true, M=1000000)
    [m, n] = size(A);
    [mC, nC] = size(C);
    [mb, nb] = size(b);

    % Check for dimentions
    if (m ~= mb)
        error('Size of C and A dont match')
    elseif (n ~= nC)
        error('Size of b and A dont match')
    elseif (mC ~= 1)
        error('Size of b and A dont match')
    elseif (nb ~= 1)
        error('Size of b and A dont match')
    end

    % Check if BigM is necesary
    if (s == false)
        bigM = false;
        s = ones(m,1)*-1;
    else
        bigM = true;
    end

    % DEBUG:
    if d
        disp('SIMPLEX METHOD');
        disp('______________');
        disp('Recieved Variables:');
        A
        b
        C
        s
    end
    
    % === Preparation for BigM method (step 0) === 

    % Generate table to arrange conditions
    unorderedTable = [s,A,b];
    orderedTable = sortrows(unorderedTable);

    % Arrenged conditions, signs and restrictions
    s = orderedTable(1:m,1:1);
    A = orderedTable(1:m,2:n+1);
    b = orderedTable(1:m,n+2:n+2);

    % Get number of -1, 0 and 1 in S vector
    lesser = sum(s==-1);
    equal = sum(s==0);
    greater = sum(s==1);

    % Generate matrix for artificial variables in greater-than restrictions
    if (lesser+equal > greater)
        artificial = [zeros(lesser+equal, greater);[-1*eye(greater)]];
    elseif (lesser+equal < greater)
        artificial = [zeros(lesser+equal,greater-lesser+equal);-1*eye(greater)];
    else
        artificial = [zeros(lesser+equal);-1*eye(greater)];
    end

    % Generate BigM matrix without costs
    upperBigM = [A,eye(m),artificial,b];

    % Fix C size: Add a zero for every sign, plus one for every greater sign, plus Z
    if (max)
        C = [C,zeros(1,lesser),-M*ones(1, equal+greater),zeros(1, greater),0];
    else
        C = [C,zeros(1,lesser),M*ones(1, equal+greater),zeros(1, greater),0];
    end

    % % Get C added to BigM deppending on upperBigM
    % for i=lesser+1:m
    %     C = C+M*upperBigM(i,:);
    % end

    % DEBUG:
    if d
        SimplexTable = [upperBigM;C]
    end

    % Get size of upperBigM
    [rows,cols] = size(upperBigM);
    
    % Get Values to start revised simplex
    A = upperBigM(1:rows,1:cols-1);
    b = upperBigM(1:rows,cols:cols);
    SubstractToZ = C(cols);

    % C = [C(1:cols-1),0] % Not necessary

    nbvIndex = [1:n,n+m+1:cols-1];
    bvIndex = [n+1:n+m];
    B = eye(m);
    BInv = eye(m);

    % === === REVISED SIMPLEX === ===

    iter = 0;
    stop = 0;

    while 1
        iter = iter +1;
        if stop == 1
            break;
        end

        if d
            input('Continue? ');
            disp('');
            disp(' ============= ');
            disp('Iteration number '), disp(iter);
        end

        % Step 1: Get Variables.
        xb = BInv*b;
        Cb = C(bvIndex);
        Z = Cb*xb; % -SubstractToZ

        % DEBUG:
        if d
            disp('');
            disp('Step 1: Get Variables:');
            disp('');
            disp('Indexes of non basic Variables:'), disp (nbvIndex);
            disp('Indexes of basic Variables:'), disp (bvIndex);
            disp('Values of X vector:'), disp(xb);
            disp('Values of C vector:'), disp(Cb);
            disp('Value of Z:'), disp(Z);
        end

        % Step 2: Input Variables.
        W = Cb*BInv;
        ZjCj = [];
        ZjCjIndex = [];
        for i = nbvIndex
            ZjCj(end+1) = W*A(:,i)-C(i);
        end
        if(max)
            valIn = min(ZjCj);
            if (valIn >= 0 )
                disp('Value Found!');
                break;
            end
        else
            valIn = max(ZjCj);
            if (valIn <= 0 )
                disp('Value Found');
                break;
            end
        end
        % This is the index of the INPUT variable
        K = lookup(ZjCj,valIn);

        % DEBUG:
        if d
            disp('');
            disp('Step 2: Input Variables.');
            disp('');
            disp('Posible vaules for input:'), disp(ZjCj);
            disp('Best value for input:'), disp(valIn);
            disp('Index of input Variable:'), disp(K);
        end

        % Step 3: Output Variables.
        Yk = BInv*A(:,K);
        if (lookup(Yk./abs(Yk),1)<1)
            stop = 1;
            disp('No Solution Found');
            break;
        end
        xbYk = xb./Yk;
        for i = 1:length(xbYk)
            if xbYk(i) <= 0
                xbYk(i) = M;
            end
        end
        valOut = min(xbYk);
        r = lookup(xbYk,valOut);

        % DEBUG:
        if d
            disp('');
            disp('Step 3: Output Variables.');
            disp('');
            disp('Posible vaules for output:'), disp(xbYk);
            disp('Best value for output:'), disp(valOut);
            disp('Index of output Variable:'), disp(r);
        end

        % Step 4: Update Values.
        E = eye(m);
        YkE = zeros(length(Yk),1);
        for i = 1:length(Yk)
            if i == r
                YkE(i,1) = 1/Yk(i,1);
                continue;
            end
            YkE(i,1) = -Yk(i,1)/Yk(r,1);
        end
        E(:,r) = YkE;
        BInv = E*BInv;
        % Switch input and output variable
        IN = nbvIndex(K);
        OUT = bvIndex(r);
        nbvIndex(K) = OUT;
        bvIndex(r) = IN;

        % DEBUG:
        if d
            disp('');
            disp('Step 4: Update Values.');
            disp('');
            disp('Value of Yk vector:'), disp(YkE);
            disp('Value of E Matrix:'), disp(E);
            disp('Value of Updated Inverse B Matrix:'), disp(BInv);
            disp('Index of input Variable:'), disp(IN);
            disp('Index of output Variable:'), disp(OUT);
        end


    end

    x = BInv*b;
    z = Z - SubstractToZ;

    if d
        disp('');
        disp('Values found:');
        disp('X:'), disp(x);
        disp('Z:'), disp(z);
    end

    % TODO: What to do with SubstractToZ?


endfunction
