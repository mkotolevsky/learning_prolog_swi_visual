build_pairs([], [], []).
build_pairs([Name|NameTail], [Score|ScoreTail], [(Name, Score)|PairTail]) :-
    build_pairs(NameTail, ScoreTail, PairTail).

filter_success([], []).
filter_success([(Name, Score)|Tail], [(Name, Score)|SuccessTail]) :-
    Score >= 60,
    filter_success(Tail, SuccessTail).
filter_success([(Name, Score)|Tail], SuccessTail) :-
    Score < 60,
    filter_success(Tail, SuccessTail).

build_success_list([], []).
build_success_list([(Name, Score)|Tail], [Success|SuccessTail]) :-
    atom_concat(Name, ' - ', NameWithDash),
    atom_concat(NameWithDash, Score, Success),
    build_success_list(Tail, SuccessTail).

success_students(Names, Scores, SuccessList) :-
    build_pairs(Names, Scores, Pairs),
    filter_success(Pairs, SuccessPairs),
    sort(2, @>=, SuccessPairs, SortedPairs),
    build_success_list(SortedPairs, SuccessList).