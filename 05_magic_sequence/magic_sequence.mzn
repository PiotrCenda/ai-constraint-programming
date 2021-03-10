% Length of the sequence
int: N;

%%%%%%%%%%%%%% 
% TODO: VARIABLES        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The sequence itself, call it 'magic'
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
%%%%%%%%%%%%%%%%%%%%
% TODO: Constraints 
%%%%%%%%%%%%%%%%%%%%
  
solve satisfy;
  
%%%%%%%%%%%%%%%%%%%%%%%%
% EXAMPLE OUTPUT  
%%%%%%%%%%%%%%%%%%%%%%%%
% - magic - magic sequence     
%%%%%%%%%%%%%%%%%%%%%%%%
output [ "magic sequence = ", show(magic),";\n"];
