include "alldifferent.mzn";

%%%%%%%%%%%%%
% PARAMETERS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Should be loaded from the data file
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
1..infinity: nodesNumber;
array[1..nodesNumber, 1..nodesNumber] of bool: edges;
 
%%%%%%%%%%%% 
% VARIABLES         
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Variables with correct domains 
% - preserve the names from the output          
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
var 1..infinity: colorsNumber;
array[1..nodesNumber] of var 1..infinity: nodes;

%%%%%%%%%%%%%%%%
% CONSTRAINTS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% tip:
% - number of used colors = the highest used color number                     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
constraint forall(i in 1..nodesNumber)(alldifferent([nodes[j] | j in 1..nodesNumber where edges[i, j]]));
% constraint forall(i in 1..nodesNumber where edges[i,])(alldifferent(nodes));

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
