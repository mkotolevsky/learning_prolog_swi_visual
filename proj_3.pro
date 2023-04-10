PREDICATES
nondeterm little(STRING)
nondeterm middle(STRING)
nondeterm big(STRING)
nondeterm strong(STRING)
nondeterm powerful(STRING)
nondeterm powerful_not_big(STRING)

CLAUSES
little("cat").
little("dog").
middle("tiger").
middle("bear").
big("elephant").
big("hippopotamus").
strong("tiger").

powerful(Animal):- middle(Animal), strong(Animal).
powerful(Animal):- big(Animal), !.
powerful_not_big(Animal):- powerful(Animal), not(big(Animal)).

GOAL
%powerful(Animal).
powerful_not_big(Animal).