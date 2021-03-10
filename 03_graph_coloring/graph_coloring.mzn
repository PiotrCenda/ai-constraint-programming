%%%%%%%%%%%%%
% PARAMETERS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Should be loaded from the data file
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
%%%%%%%%%%%% 
% VARIABLES         
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Variables with correct domains 
% - preserve the names from the output          
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%
% CONSTRAINTS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% tip:
% - number of used colors = the highest used color number                     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%
% GOAL  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Minimize the number of used colors
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
solve minimize colorsNumber;

%%%%%%%%%%%%%%%%%%%%%%%%
% OUTPUT EXAMPLE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% - colorsNumber - number of used colors
% - nodes - array of vertices with assigned colors                
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
output [show(colorsNumber), " colors\n",] ++
       [show(nodes[i]) ++ " " | i in 1..nodesNumber]
