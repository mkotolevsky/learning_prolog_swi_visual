predicates 
nondeterm man(STRING)
nondeterm woman(STRING)
nondeterm married(STRING,STRING)
nondeterm wife(STRING,STRING)
nondeterm husband(STRING,STRING)
nondeterm parent(STRING, STRING)
nondeterm child(STRING,STRING)
nondeterm son(STRING,STRING)
nondeterm daughter(STRING,STRING)
nondeterm brother(STRING,STRING)
nondeterm sister(STRING,STRING)
nondeterm brother_sister(STRING,STRING)
nondeterm uncle(STRING,STRING)
nondeterm aunt(STRING,STRING)
nondeterm grandfather(STRING,STRING)
nondeterm grandmother(STRING,STRING)

clauses
man("Timofey").
man("Anatoliy").
man("Nikolai").
man("Alexandr").
man("Yuri").
man("Artem").
man("Maxim").

woman("Valentina").
woman("Liubov").
woman("Galina").
woman("Victoria").
woman("Elizaveta").

married("Timofey", "Valentina").
married("Anatoliy", "Liubov").
married("Nikolai", "Galina").
married("Victoria", "Yuri").

parent("Timofey", "Nikolai").
parent("Valentina", "Nikolai").
parent("Timofey", "Alexandr").
parent("Valentina", "Alexandr").
parent("Anatoliy", "Galina").
parent("Liubov", "Galina").
parent("Nikolai", "Maxim").
parent("Nikolai", "Victoria").
parent("Galina", "Maxim").
parent("Galina", "Victoria").
parent("Victoria", "Artem").
parent("Victoria", "Elizaveta").
parent("Yuri", "Artem").
parent("Yuri", "Elizaveta").

husband(A,B):- married(A,B), man(A).
husband(A,B):- married(B,A), man(A).

wife(A,B):- married(A,B), woman(A).
wife(A,B):- married(B,A), woman(A).

child(A,B):- parent(B,A).

son(A,B):- parent(B,A), man(A).
daughter(A,B):- parent(B,A), woman(A).

brother(A,B):- man(A), parent(C,A), parent(C,B), married(C,D), A<>B.
sister(A,B):- woman(A), parent(C,A), parent(C,B), married(C,D), A<>B.
brother_sister(A,B):- parent(C,A), parent(C,B), married(C,D), A<>B.

uncle(A,B):- man(A), parent(C,A), brother_sister(C,B).
aunt(A,B):- woman(A), parent(C,A), brother_sister(C,B).

grandfather(A,B):- man(A), parent(A,C), parent(C,B).
grandmother(A,B):- woman(A), parent(A,C), parent(C,B).

goal
%husband(X,Z).
%wife(X,Z).
%child(X,Z).
%son("Maxim",Z).
%daughter("Galina",Z).
%brother("Artem",Z).
%sister(X,Z).
%uncle(X,Z).
%aunt(X,Z).
%grandfather("Nikolai", Z).
grandmother(X, Y).