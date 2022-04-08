int: nr; % number of reclaimers
           % number of rails = nr for stages A,B,C,D,E
           % number of rails = (nr + 1) div 2 for stage F
set of int: RECLAIMER = 1..nr;
bool: stageF; % is this stage F data

int: ns; % number of stockpiles
set of int: STOCKPILE = 1..ns;
array[STOCKPILE] of int: size; % size in 10000 tonnes
array[STOCKPILE] of SHIP: ship; % which ship carries stockpile
 
int: maxtime; % time considered
set of int: TIME = 0..maxtime;

int: nsh; % number of ships
set of int: SHIP = 1..nsh;
array[SHIP] of TIME: arrival; % when ship arrives in port

int: len; % length of pad
set of int: POSITION = 0..len;

int: stack_time;
int: reclaim_time;
int: reclaim_speed;

array[STOCKPILE] of var POSITION: westend;
array[STOCKPILE] of var POSITION: eastend;
array[STOCKPILE] of var TIME: stack;
array[STOCKPILE] of var TIME: endstack;
array[STOCKPILE] of var TIME: reclaim;
array[STOCKPILE] of var TIME: finished;
array[STOCKPILE] of var RECLAIMER: which;

% Go crazy here

% Stage A - Packing Problem
% Two stockpiles can't overlap in "spacetime"

% 1) what's the relation between endstack and stack times
% 2) what's the relation between reclaim and endstack times
% 3) what's the relation between finished and reclaim times
% 4) how much time the stockpiles spend on the pad?
%    - create a new array and store this info - it will be useful :)
% 5) what's the relation between eastend and westend offsets
% 6) packing problem
%    a) stockpiles should not overlap in "spacetime", treat them as rectangles
%    b) stockpiles can't use more space than there is available
%    c) we can't go beyond the time limit
  
  
  
% Stage B 
% Two stockpiles reclaimed by the same reclaimer do not overlap in time
%
% Tip: write your first custom predicate, i.e.
% predicate not_overlap(var STOCKPILE: s1, var STOCKPILE: s2) =
% <something something> ;



% Stage C
% 1) no stockpile can be reclaimed onto a ship before the arrival time of the ship
% 2) also no two stockpiles can be reclaimed onto the same ship at the same time. Make sure these reclaims do not overlap in time.
% TIP: reuse your "not_overlap" predicate



% Stage D
% Add constraints to your model to ensure that if a reclaimer finishes reclaiming a stockpile with westend at x and then has to start reclaiming a stockpile with westend at y there is at least |y − x| ∗ reclaim speed time between these two events.
% TIP: just make your "not_overlap" predicate smarter
% TIP: you can introduce local variables in the constraints/predicates
% let {
%  <local variables>
% } in <then something>



% Stage E
% Add a definition of the objective to your model and change the model to minimize this value.
% You may well need to significantly change your search strategy to get good solutions for the objective.

% TIP: definetely change the line below
var int: obj = 0;

% TIP: you may add some search annotations
solve minimize obj;

% Stage F
% Add constraints in your model so that the two reclaimers on rail i numbered 2i − 1 and 2i for i ∈ 1..nr div 2 remain so the western one 2i − 1 is never east of the eastern one 2i. Note they can legitimately be in the same position (this is for simplicity, its not very real). 
% TIP: do some "channeling" and model reclaimers' positions explicitely with a new array of variables as below
% 1) when reclaiming, reclaimers position should equal to the westend of the stockpile being reclaimed
% 2) otherwise they should not move faster than the `reclaim_speed` allows
array[RECLAIMER, TIME] of var POSITION: reclaimers_positions;

% When stage F is not active, just make it full of 0 as it doesn't matter
constraint not stageF -> forall(r in RECLAIMER, t in TIME)(
  reclaimers_positions[r,t] == 0
);



% don't change the output
output 
["westend  = ", show(westend), ";\n"] ++
["eastend  = ", show(eastend), ";\n"] ++
["stack    = ", show(stack), ";\n"] ++
["endstack = ", show(endstack), ";\n"] ++
["reclaim  = ", show(reclaim), ";\n"] ++
["finish   = ", show(finished) , ";\n"] ++
["which    = ", show(which), ";\n"] ++
["obj = ",show(obj), ";\n"]
;
