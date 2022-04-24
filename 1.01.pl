my_last(X, [X]).
my_last(X, [_|Xs]) :-
    my_last(X, Xs).
