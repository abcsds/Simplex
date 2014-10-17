%% test cases for simplex algorithm
clc;

disp('====================');
clear all;
C = [1,1];
A = [2,3; 2,1];
b = [8,4];

[x,z] = simplex(C, A, b, verbose=false) 
[XOPT, FMIN, ERRNUM, EXTRA] = glpk (C, A, b)

disp('====================');
clear all;
C = [10,-12, 10];
A = [2,3,2; 2,1,2; 4,5,6; 5,1,5];
b = [8,4,3,4];

[x,z] = simplex(C, A, b, verbose=false) 
[XOPT, FMIN, ERRNUM, EXTRA] = glpk (C, A, b)

disp('====================');
clear all;
C = [1,4,1,1];
A = [1,3,0,1; 2,1,0,0; 0,1,4,1];
b = [4,3,3];

[x,z] = simplex(C, A, b, verbose=false) 
[XOPT, FMIN, ERRNUM, EXTRA] = glpk (C, A, b)

disp('===================================================================');
clear all;
C = [2,7,6,1];
A = [1,1,.83,.5; 1.2,1,1,1.2; .5,.7,1.2,.4];
b = [65,96,80];

[x,z] = simplex(C, A, b, verbose=false)

% Using Octave's glpk function
C = [2; 7; 6; 1];                                % A column array containing the objective function coefficients.
A = [1,1,.83,.5; 1.2,1,1,1.2; .5,.7,1.2,.4];     % A matrix containing the constraints coefficients.
B = [65; 96; 80];                                % A column array containing the right-hand side value for each constraint in the constraint matrix.
[XOPT, FMIN, ERRNUM, EXTRA] = glpk (C, A, B)     % Solve the linear program

% % Using MATLAB's linprog function
% z = [2; 7; 6; 1];                              % Objective function
% A = [1,1,.83,.5; 1.2,1,1,1.2; .5,.7,1.2,.4];   % Constraint matrix
% b = [65,96,80];                                % Right-hand-side vector
% lb = zeros(4,1);                               % Nonnegativity constraints
% [x,zval] = linprog(z,[],[],A,b,lb,[])          % Solve the linear program

disp('===================================================================');
clear all;
C = [1.2,1,1,1];
A = [1,1,.83,.5; 1.2,1,1,1.2; .5,.7,1.2,.4];
b = [65,96,80];

[x,z] = simplex(C, A, b, verbose=false)

% Using Octave's glpk function
C = [1.2; 1; 1; 1];                              % A column array containing the objective function coefficients.
A = [1,1,.83,.5; 1.2,1,1,1.2; .5,.7,1.2,.4];     % A matrix containing the constraints coefficients.
B = [65; 96; 80];                                % A column array containing the right-hand side value for each constraint in the constraint matrix.
[XOPT, FMIN, ERRNUM, EXTRA] = glpk (C, A, B)     % Solve the linear program

% % Using MATLAB's linprog function
% z = [1.2,1,1,1];                               % Objective function
% A = [1,1,.83,.5; 1.2,1,1,1.2; .5,.7,1.2,.4];   % Constraint matrix
% b = [65,96,80];                                % Right-hand-side vector
% lb = zeros(4,1);                               % Nonnegativity constraints
% [x,zval] = linprog(z,[],[],A,b,lb,[])          % Solve the linear program