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

    # print "A = ", A
    # print "I(m) = ", eye(m)
    print "Transpose b", b.T
    parcial = concatenate((A, eye(m)), axis=1) 
    parcial = concatenate((parcial, b.T), axis=1)
        #, b.T)
    print parcial
    # costs = [-C,zeros(1,m+1)]
    # tabular = [parcial;costs]
    # tabular = array([array([A,eye(m),b.T]),array([-C,zeros((1,m+1))])])
    # print "TABULAR : " , tabular




    return [m,n]; # TODO remove