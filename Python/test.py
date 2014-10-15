from simplex import simplex
import numpy as np


C = np.array([1,1])
A = np.array([[2,3],[2,1]])
b = np.array([8,4])

x, z = simplex(C, A, b)

# print " x, z = ", x, z

# print "===================="

# C = np.array([1,4,1,1])
# A = np.array([[1,3,0,1],[2,1,0,0],[0,1,4,1]])
# b = np.array([4,3,3])

# x, z = simplex(C, A, b)

# print " x, z = ", x, z


