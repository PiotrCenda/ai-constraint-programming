include "alldifferent.mzn";
include "lex_lesseq.mzn";

int: N;
set of int: indexes = 1..N;

array[indexes] of var indexes: rows;

constraint alldifferent(rows);
constraint alldifferent([rows[i] + i | i in indexes]);
constraint alldifferent([rows[i] - i | i in indexes]);

constraint symmetry_breaking_constraint(
let {
  array[1..N, 1..N] of var bool: qb;
} in forall (i,j in 1..N) ( qb[i,j] <-> (rows[i] = j) )
/\  lex_lesseq(array1d(qb), [ qb[j,i] | i,j in 1..N ])
/\  lex_lesseq(array1d(qb), [ qb[i,j] | i in reverse(1..N), j in 1..N ])
/\  lex_lesseq(array1d(qb), [ qb[j,i] | i in 1..N, j in reverse(1..N) ])
/\  lex_lesseq(array1d(qb), [ qb[i,j] | i in 1..N, j in reverse(1..N) ])
/\  lex_lesseq(array1d(qb), [ qb[j,i] | i in reverse(1..N), j in 1..N ])
/\  lex_lesseq(array1d(qb), [ qb[i,j] | i,j in reverse(1..N) ])
/\  lex_lesseq(array1d(qb), [ qb[j,i] | i,j in reverse(1..N) ])
);

solve :: int_search(rows, most_constrained, indomain_max, complete) satisfy; 
  
output [ if fix(rows[j]) == i then "|Q" else "|_" endif ++
  if j == N then "\n" else "" endif | i,j in 1..N];