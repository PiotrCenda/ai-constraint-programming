include "alldifferent.mzn";
include "lex_lesseq.mzn";

int: n;
set of int: indexes = 1..n;

array[indexes] of var indexes: rows;
array[indexes, indexes] of var bool: qb;
array[int] of var bool: qb0 = array1d(qb);
array[int] of var bool: qb1 = [ qb[j,i] | i,j in 1..n ];
array[int] of var bool: qb2 = [ qb[i,j] | i in reverse(1..n), j in 1..n ];
array[int] of var bool: qb3 = [ qb[j,i] | i in 1..n, j in reverse(1..n) ];
array[int] of var bool: qb4 = [ qb[i,j] | i in 1..n, j in reverse(1..n) ];
array[int] of var bool: qb5 = [ qb[j,i] | i in reverse(1..n), j in 1..n ];
array[int] of var bool: qb6 = [ qb[i,j] | i,j in reverse(1..n) ];
array[int] of var bool: qb7 = [ qb[j,i] | i,j in reverse(1..n) ];

constraint alldifferent(rows);
constraint alldifferent([rows[i] + i | i in indexes]);
constraint alldifferent([rows[i] - i | i in indexes]);

constraint forall(i,j in indexes)(qb[i, j] <-> (rows[i] = j));
constraint lex_lesseq(qb0, qb1);
constraint lex_lesseq(qb0, qb2);
constraint lex_lesseq(qb0, qb3);
constraint lex_lesseq(qb0, qb4);
constraint lex_lesseq(qb0, qb5);
constraint lex_lesseq(qb0, qb6);
constraint lex_lesseq(qb0, qb7);

solve satisfy; 
  
output [ if fix(rows[j]) == i then "|Q" else "|_" endif ++
  if j == n then "\n" else "" endif | i,j in 1..n];
output ["\(rows) \n"];
output [ if fix(qb[i,j]) == true then "|Q" else "|_" endif ++
  if j == n then "\n" else "" endif | i,j in 1..n];