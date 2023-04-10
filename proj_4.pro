DOMAINS
list = integer*

PREDICATES
write_a_list(list)
average(list, integer)
sum(list, integer)
findsum(list, integer)
length_of(list, integer)
sumlist(list, list, list)
nondeterm max_list(list, integer, integer)

CLAUSES
write_a_list([]).
write_a_list([H|T]):- write(H), nl, write_a_list(T).

findsum(L, Sum):- sum(L, Sum), write("Sum=", Sum).
sum([],0).
sum([X|Tail], Sum):- sum(Tail, Temp), Sum=Temp+X.
        
length_of([], 0).
length_of([_|T],L):- length_of(T,TailLength), L=TailLength+1.
	
average(List, Average):- findsum(List, Sum),length_of(List, Length), Average = Sum/Length.

sumlist([],[],[]).
sumlist([H1|T1],[H2|T2],[H|R]):- H=H1-H2, sumlist(T1,T2,R).

max_list([],M,M).
max_list([H|T],N,M):- H>N, max_list(T,H,M).
max_list([H|T],N,M):- H<=N, max_list(T,N,M).

GOAL
%write_a_list([1, 5, 2, 7, 13, 16, 13, 9, 8, 6]).
%write_a_list([10, 9, 11, 8, 9, 7, 9, 10, 7, 4]).
%average([1, 5, 2, 7, 13, 16, 13, 9, 8, 6], Average).
%average([10, 9, 11, 8, 9, 7, 9, 10, 7, 4], Average).
%sumlist([1, 5, 2, 7, 13, 16, 13, 9, 8, 6], [10, 9, 11, 8, 9, 7, 9, 10, 7, 4], L3).
sumlist([1, 5, 2, 7, 13, 16, 13, 9, 8, 6], [10, 9, 11, 8, 9, 7, 9, 10, 7, 4], L),L=[H|T],max_list(T, H, Max).