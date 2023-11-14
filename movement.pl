
:- dynamic i_am_at/1, at/2, holding/1, path/3.
:- multifile path/3.

/* These rules define the direction letters as calls to go/1. */

n :- go(n).

s :- go(s).

e :- go(e).

w :- go(w).


/* This rule tells how to move in a given direction. */


% No path/door in the given direction
go(Direction) :-
    i_am_at(Here),
    \+(door(Here, Direction, _);path(Here, Direction, _)),
    !,
    write('Cannot go from '), write(Here), write(' in this direction.').

% door locked
go(Direction) :-
    i_am_at(Here),
    is_locked(door(Here, Direction, _)),
    !,
    write('The door in the direction '), write(Direction), write(' is locked.').

% door closed/unlocked
go(Direction) :-
    i_am_at(Here),
    (is_closed(door(Here, Direction, _)); is_unlocked(door(Here, Direction, _))),
    !,
    write('You need to open the door first').

% check explicitly if door is open
go(Direction) :-
    i_am_at(Here),
    path(Here, Direction, There),
    !,
    retract(i_am_at(Here)),
    assert(i_am_at(There)),
    look.

% any other case (there shouldn't be any) - deny access
go(_) :-
    write('You can''t go that way.'),
    !.

% shorthand for checking whether one can go to a place
path(Here, Direction, There) :- is_open(door(Here, Direction, There)).
