% Parameters
%%%%%%%%%%%
int: n;                      % How many squares do we have?
set of int: SQUARES = 1..n;  % Set of the available squares

% Variables
%%%%%%%%%%%
var <min>..<max>: height;    % height of the container
var <min>..<max>: width;     % width of the conainer
var <min>..<max>: area = height * width; % container's area
array[SQUARES] of var <min>..<max>: x; % squares' coordinates in the container
array[SQUARES] of var <min>..<max>: y; % squares' coordinated in the container
  
% Constraints 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

% Constraint 1: Squares should fit inside the container
  
% Constraint 2: Squares should not overlap

% Goal
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
solve minimize area; 
  

% Boring output  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
output [ show(i) ++ " > (" ++ show(x[i]) ++ "," ++ show(y[i]) ++ ")\n" | i in 1..n] ++
  ["area = " ++ show(width) ++ " * " ++ show(height) ++ " = " ++ show(area)];