from numpy import *
def simplex(C,A,b):
    [m,n] = A.shape() # Size of a matrix
    if(length(C)!=m)
        print "Size of C and M don't match"
    if(length(b)!=n)
        print "Size of b and N don't match"
    rows = m+1
    cols = n+1
    bv = zeros(1,m)
    nbv = zeros(1,n)
    bs = zeros(1,n+m)

    tabular = [[A,ones(m),b.traspose()];]
    return [m,n]; # TODO remove