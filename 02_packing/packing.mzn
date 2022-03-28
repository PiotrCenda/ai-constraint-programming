% Parameters
%%%%%%%%%%%
int: n;                      % How many squares do we have?
set of int: SQUARES = 1..n;  % Set of the available squares

% Variables
%%%%%%%%%%%
var n..sum([i | i in SQUARES]): height;    % height of the container
var n..sum([i | i in SQUARES]): width;     % width of the conainer
var sum([pow(i, 2) | i in SQUARES])..n*sum([i | i in SQUARES]): area = height * width; % container's area
array[SQUARES] of var 0..(sum([i | i in SQUARES]) - 1): x; % squares' coordinates in the container
array[SQUARES] of var 0..(sum([i | i in SQUARES]) - 1): y; % squares' coordinated in the container
  
% Constraints 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

% Constraint 1: Squares should fit inside the container
constraint width = max([x[i] + i | i in SQUARES]);
constraint height = max([y[i] + i | i in SQUARES]);

% Constraint 2: Squares should not overlap
constraint forall(i, j in SQUARES where i != j)(x[i] + i <= x[j]);
constraint forall(i, j in SQUARES where i != j)(y[i] + i <= y[j]);
constraint forall(i, j in SQUARES where i != j)(x[i] >= x[j] + j);
constraint forall(i, j in SQUARES where i != j)(y[i] >= y[j] + j);

% Goal
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
solve minimize area; 
  

% Boring output  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
output [ show(i) ++ " > (" ++ show(x[i]) ++ "," ++ show(y[i]) ++ ")\n" | i in 1..n] ++
  ["area = " ++ show(width) ++ " * " ++ show(height) ++ " = " ++ show(area)];