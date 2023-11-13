:- dynamic is_closed/1, is_locked/1, is_open/1, is_unlocked/1.
% Container interface - an item can be closed/open/etc.., but also stores items

% Rule describing whether an item can be removed from a container
can_remove_from_container(Thing) :-
    (in(Thing, X), container_interface(X)),
    is_open(X),
    !.

can_remove_from_container(Thing) :-
    (in(Thing, X), container_interface(X)),
    (is_closed(X); is_unlocked(X)),
    !,
    write('You must open the '), write(X), write(' first.'),
    fail.

can_remove_from_container(Thing) :-
    (in(Thing, X), container_interface(X)),
    is_locked(X),
    !,
    write('You must unlock the '), write(X), write(' first.'),
    fail.

can_remove_from_container(Thing) :-
    in(Thing, X), in(X, _), !, can_remove_from_container(X).

can_remove_from_container(_).