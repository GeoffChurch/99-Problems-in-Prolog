my_last(Last, [Last]).
my_last(Last, [_,A|As]) :-
    my_last(Last, [A|As]).

:- begin_tests(my_last).

test(empty, [fail]) :-
    my_last(_, []).

test(singleton_forward, [true(X == 5)]) :-
    my_last(X, [5]).

test(singleton_backward, [true(X == 5)]) :-
    my_last(5, [X]).

test(singleton_fail, [fail]) :-
    my_last(5, [4]).

test(many_forward, [true(X == 5)]) :-
    my_last(5, [_, _, X]).

test(many_backward, [true(X == 5)]) :-
    my_last(X, [_, _, 5]).

test(many_fail, [fail]) :-
    my_last(5, [_, _, 4]).

:- end_tests(my_last).

:- run_tests.
