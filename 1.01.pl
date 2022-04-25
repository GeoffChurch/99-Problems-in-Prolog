list_last(List, Last) :-
    must_be(list_or_partial_list, List),
    list_last_(List, Last).

list_last_([Last], Last).
list_last_([_,A|As], Last) :-
    list_last_([A|As], Last).

%% Alternate solution using DCG notation and built-in reverse:
%% list_last(List, Last) :-
%%     must_be(list_or_partial_list, List),
%%     phrase(list_last_(Last), List, _).
%% list_last_(X) --> reverse, [X].

:- begin_tests(list_last).

test(empty, [fail]) :-
    list_last([], _).

test(singleton_forward, [true(X == 5)]) :-
    list_last([5], X).

test(singleton_backward, [true(X == 5)]) :-
    list_last([X], 5).

test(singleton_fail, [fail]) :-
    list_last([4], 5).

test(many_forward, [true(X == 5)]) :-
    list_last([_, _, 5], X).

test(many_backward, [true(X == 5)]) :-
    list_last([_, _, X], 5).

test(many_fail, [fail]) :-
    list_last([_, _, 4], 5).

test(general, [nondet, true(X == Last)]) :-
    list_last(List, Last),
    List = [_,_,_,X].

test(type_error, [error(type_error(list, potato))]) :-
    list_last(potato, _).

:- end_tests(list_last).

:- run_tests.
