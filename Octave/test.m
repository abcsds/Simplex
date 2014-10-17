%% test cases for simplex algorithm
clc;

% disp('====================');
% clear all;
% C = [1,1];
% A = [2,3; 2,1];
% b = [8,4];

% [x,z] = simplex(C, A, b, verbose=true);

% disp('====================');
% clear all;
% C = [10,-12, 10];
% A = [2,3,2; 2,1,2; 4,5,6; 5,1,5];
% b = [8,4,3,4];

% [x,z] = simplex(C, A, b, verbose=true);

% disp('====================');
% clear all;
% C = [1,4,1,1];
% A = [1,3,0,1; 2,1,0,0; 0,1,4,1];
% b = [4,3,3];

% [x,z] = simplex(C, A, b, verbose=true);

disp('====================');
clear all;
C = [2,7,6,1];
A = [1,1,.83,.5; 1.2,1,1,1.2; .5,.7,1.2,.4];
b = [65,96,80];

[x,z] = simplex(C, A, b, verbose=true);

disp('====================');
clear all;
C = [1.2,1,1,1];
A = [1,1,.83,.5; 1.2,1,1,1.2; .5,.7,1.2,.4];
b = [65,96,80];

[x,z] = simplex(C, A, b, verbose=true);