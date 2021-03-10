%%%%%%%%%%%
% REMINDER 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% There's something missing here
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%
% PARAMETERS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initial state of the board
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
int: S;
int: N = S*S;
array[<TODO>, <TODO>] of <TODO>: board;

%%%%%%%%%%% 
% VARIABLES  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% You know... Use the 'puzzle' name from the output
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%
% Constraints 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% - you know the sudoku rules
% - remember, that you have to preserve the initial state of the board  
% tips.
% - you can slice arrays like in python, e.g. board[1,1..3] 
%   is the first three elements of the first row of the board array
% - there are
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

solve satisfy;

%%%%%%%%%%%%%%%%%%%%
% OUTPUT EXAMPLE  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% - puzzle - 2d array of nxn variables
% - N - size of the board, equal S*S         
% - S - size of a single sector            
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

output [ show(puzzle[i,j]) ++ " " ++
  if j mod S == 0 then " " else "" endif ++ if j == N /\ i != N then
  if i mod S == 0 then "\n\n" else "\n" endif else "" endif
    | i,j in PuzzleRange ] ++ ["\n"];
