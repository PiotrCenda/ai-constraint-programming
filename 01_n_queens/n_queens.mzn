% number of queens
int: N;

%%%%%%%%%%%%% 
% TODO: VARIABLES 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% add variables with correct domains 
% tip:                       
% var 1..N: x; declares a variable with domain 1..N   
% use names from the oput
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%
% TODO: CONSTRAINTS 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% add constraints
% tip:
% rows[i] = rows[j] (-/+) (j - i)                 
% matches queens placed on the same diagonal, where:
% - i,j - column index
% - rows[n] - queen's position in the nth col 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


solve satisfy; 
  
%%%%%%%%%%%%%%%%%%%
% OUTPUT EXAMPLE  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% - rows[i] - queen's position in the ith row 
% - N - number of queens                     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
output [ if fix(rows[j]) == i then "|Q" else "|_" endif ++
  if j == N then "\n" else "" endif | i,j in 1..N];
