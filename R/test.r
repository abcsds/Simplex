source('simplex.r')
print("=========================");
C <- c(1,1)
A <- rbind(c(2,3), c(2,1))
b <- c(8,4)

x_z = simplex(C, A, b)

print('====================');
C <- c(1,4,1,1)
A <- rbind(c(1,3,0,1), c(2,1,0,0), c(0,1,4,1))
b <- c(4,3,3)

x_z = simplex(C, A, b)



# list(x,z) <- simplex(C, A, b)