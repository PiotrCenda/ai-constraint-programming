include "alldifferent.mzn";
include "lex_lesseq.mzn";

int: N;
set of int: indexes = 1..N;

array[indexes] of var indexes: rows;
array[indexes, indexes] of var bool: qb;
array[int] of var bool: qb0 = array1d(qb);
array[int] of var bool: qb1 = [ qb[j,i] | i,j in 1..N ];
array[int] of var bool: qb2 = [ qb[i,j] | i in reverse(1..N), j in 1..N ];
array[int] of var bool: qb3 = [ qb[j,i] | i in 1..N, j in reverse(1..N) ];
array[int] of var bool: qb4 = [ qb[i,j] | i in 1..N, j in reverse(1..N) ];
array[int] of var bool: qb5 = [ qb[j,i] | i in reverse(1..N), j in 1..N ];
array[int] of var bool: qb6 = [ qb[i,j] | i,j in reverse(1..N) ];
array[int] of var bool: qb7 = [ qb[j,i] | i,j in reverse(1..N) ];

constraint alldifferent(rows);
constraint alldifferent([rows[i] + i | i in indexes]);
constraint alldifferent([rows[i] - i | i in indexes]);

constraint forall(i,j in indexes)(qb[i, j] <-> (rows[i] = j));
constraint lex_lesseq(qb0, qb1)
        /\ lex_lesseq(qb0, qb2)
        /\ lex_lesseq(qb0, qb3)
        /\ lex_lesseq(qb0, qb4)
        /\ lex_lesseq(qb0, qb5)
        /\ lex_lesseq(qb0, qb6)
        /\ lex_lesseq(qb0, qb7);

solve satisfy; 
  
output [ if fix(rows[j]) == i then "|Q" else "|_" endif ++
  if j == N then "\n" else "" endif | i,j in 1..N];
