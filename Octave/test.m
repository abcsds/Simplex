%% test case for simplex algorithm
clc;
disp('====================');
clear all;
C = [1,1];
A = [2,3; 2,1];
b = [8,4];

[x,z] = simplex(C, A, b)

% clc;
disp('====================');
clear all;
C = [10,-12];
A = [2,3; 2,1];
b = [8,4];

[x,z] = simplex(C, A, b)
disp('====================');
clear all;
C = [1,4,1,1];
A = [1,3,0,1; 2,1,0,0; 0,1,4,1];
b = [4,3,3];

[x,z] = simplex(C, A, b)
