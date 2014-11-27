%% test case for simplex algorithm
clc;
disp('====================');
disp('Example 1');
clear all;
C = [1,1];
A = [2,3; 2,1];
b = [8;4];

[x,z] = simplex(A, b, C, s= false, d=true)

% clc;
disp('====================');
disp('Example 2');
clear all;
C = [10,-12];
A = [2,3; 2,1];
b = [8;4];

[x,z] = simplex(A, b, C, s= false, d=true)
disp('====================');
disp('Example 3');
clear all;
C = [1,4,1];
A = [1,3,0; 2,1,0; 0,1,4; 3,2,4; 2,3,4];
b = [4;3;3;4;5];
s = [0;1;-1;1;1];

[x,z] = simplex(A, b, C, s, d=true)
disp('====================');
disp('Example 4');
clear all;
C = [1,1];
A = [3,4;1,0;1,1];
b = [12;1;3];
s = [0;1;-1];

[x,z] = simplex(A, b, C, s, d=true)
disp('====================');
disp('Example 5');
clear all;
C = [-1,1];
A = [1,-1;1,1];
b = [2;6];
s = [-1;-1];

[x,z] = simplex(A, b, C, s, d=true)

