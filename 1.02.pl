list_penultimate(List, Pen) :-
    must_be(list_or_partial_list, List),
    list_penultimate_(List, Pen).

list_penultimate_([X,_], X).
list_penultimate_([_,A,B|T], X) :-
    list_penultimate_([A,B|T], X).

%% Alternate solution using DCG notation and built-in reverse:
%% list_penultimate(List, Last) :-
%%     must_be(list_or_partial_list, List),
%%     phrase(list_penultimate_(Last), List, _).
%% list_penultimate_(X) --> reverse, [_, X].

:- begin_tests(list_penultimate).

test(empty, [fail]) :-
    list_penultimate([], _).

test(singleton, [fail]) :-
    list_penultimate([_], _).

test(two_forward, [true(X == 5)]) :-
    list_penultimate([5, _], X).

test(two_backward, [true(X == 5)]) :-
    list_penultimate([X, _], 5).

test(two_fail, [fail]) :-
    list_penultimate([4, _], 5).

test(many_forward, [true(X == 5)]) :-
    list_penultimate([_, _, 5, _], X).

test(many_backward, [true(X == 5)]) :-
    list_penultimate([_, _, X, _], 5).

test(many_fail, [fail]) :-
    list_penultimate([_, _, 4, _], 5).

test(general, [nondet, true(X == Last)]) :-
    list_penultimate(List, Last),
    List = [_,_,_,X,_].

test(type_error, [error(type_error(list, potato))]) :-
    list_penultimate(potato, _).

:- end_tests(list_penultimate).

:- run_tests.
