% Length of the sequence
int: N;

%%%%%%%%%%%%%% 
% TODO: VARIABLES        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The sequence itself, call it 'magic'
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set of int: size = 0..(N-1);
array[size] of var size: magic; 
  
%%%%%%%%%%%%%%%%%%%%
% TODO: Constraints 
%%%%%%%%%%%%%%%%%%%%
constraint forall(i in size) (count(magic, i) = magic[i]);

solve satisfy;
  
%%%%%%%%%%%%%%%%%%%%%%%%
% EXAMPLE OUTPUT  
%%%%%%%%%%%%%%%%%%%%%%%%
% - magic - magic sequence     
%%%%%%%%%%%%%%%%%%%%%%%%
output ["magic sequence = ", show(magic),";\n"];
