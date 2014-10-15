from numpy import *
def simplex(C,A,b):
    [m,n] = shape(A) # Size of a matrix
    if(size(C)!=n):
        print "Size of C and M don't match"
    if(size(b)!=m):
        print "Size of b and N don't match"
    rows = m+1
    cols = n+1
    bv = zeros((1,m))
    nbv = zeros((1,n))
    bs = zeros((1,n+m))

    
    parcial = concatenate((A, eye(m), b[:,newaxis]), axis=1) #bT = b[:,np.newaxis]
    # print parcial
    costs = concatenate((-C,zeros((m+1))))
    # print costs

    tabular = vstack((parcial,costs))
    # print tabular
    
    #TODO
    bv = array([n+1,m+n])# Index of Basic Variables
    nbv = array([1,n]) # Index of Non-Basic Variables
    print tabular[0:m, cols]
    # bs(bv) = tabular(1:m,cols);  # basic solutions = Value of basic variables


    ##  LOOP
    # while 1
    #     in = optimalityCondition(tabular(rows,nbv));
    #     if in == -1
    #         break;
    #     end
    #     c_pivot = nbv(in);

    #     out = factibilityCondition(tabular(1:m,cols)./tabular(1:m,c_pivot));
    #     if out == -1
    #         error('No solution');
    #     end
    #     r_pivot = out;
    #     den = tabular(r_pivot, c_pivot);
    #     tabular(r_pivot,:) = tabular(r_pivot,:)/den;
    #     % Change basic variables for next iteration
    #     aux = nbv(in);
    #     nbv(c_pivot) = bv(out);
    #     bv(out) = aux;
    #     % Clear for i:/:rows
    #     for i=1:rows
    #         if i == r_pivot
    #             continue;
    #         end
    #         fact = tabular(i,c_pivot);
    #         % To see steps remove the semi-colon here
    #         tabular(i,:) = tabular(i,:)-fact*tabular(r_pivot,:);
    #     end
    #     bs(bv) = tabular(1:m,cols);
    #     bs(nbv) = 0;

    # end

    x= bs
    # z = tabular(rows,cols)


    return x,z