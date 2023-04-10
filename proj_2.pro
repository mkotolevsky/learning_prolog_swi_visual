predicates
nondeterm f(INTEGER, INTEGER)

clauses
f(1, 2).
f(N, A):- 
	N > 1, 
	N1 = N - 1, 
	f(N1, A1), 
	A = A1 * 4.
goal
f(4, A).