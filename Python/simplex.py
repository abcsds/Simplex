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
    print tabular
    # tabular = array([array([A,eye(m),b.T]),array([-C,zeros((1,m+1))])])
    # print "TABULAR : " , tabular




    return [m,n]; # TODO remove