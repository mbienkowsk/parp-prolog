:- multifile is_open/1, is_closed/1, is_locked/1, is_unlocked/1, in/2, unlock/1, lock/1, open/1, close_door/1.
:- dynamic in/2, is_open/1, is_closed/1, is_locked/1, is_unlocked/1, i_am_at/1.

in(door(A, _, _), X) :- A=X.

is_open(Item) :-
    i_am_at(Place),
    (Item=north_door, door(Place, n, X), is_open(door(Place, n, X));
     Item=south_door, door(Place, s, X), is_open(door(Place, s, X));
     Item=east_door, door(Place, e, X), is_open(door(Place, e, X));
     Item=west_door, door(Place, w, X), is_open(door(Place, w, X))).

is_closed(Item) :-  
    i_am_at(Place),
    (Item=north_door, door(Place, n, X), is_closed(door(Place, n, X));
    Item=south_door, door(Place, s, X), is_closed(door(Place, s, X));
    Item=east_door, door(Place, e, X), is_closed(door(Place, e, X));
    Item=west_door, door(Place, w, X), is_closed(door(Place, w, X))).

is_unlocked(Item) :-
    i_am_at(Place),
    (Item=north_door, door(Place, n, X), is_unlocked(door(Place, n, X));
    Item=south_door, door(Place, s, X), is_unlocked(door(Place, s, X));
    Item=east_door, door(Place, e, X), is_unlocked(door(Place, e, X));
    Item=west_door, door(Place, w, X), is_unlocked(door(Place, w, X))).

is_locked(Item) :-
    i_am_at(Place),
    (Item=north_door, door(Place, n, X), is_locked(door(Place, n, X));
     Item=south_door, door(Place, s, X), is_locked(door(Place, s, X));
     Item=east_door, door(Place, e, X), is_locked(door(Place, e, X));
     Item=west_door, door(Place, w, X), is_locked(door(Place, w, X))).

unlock(Item) :-
    i_am_at(X),
    ((Item = north_door, door(X, n, Y), Door = door(X, n, Y));
        (Item = south_door, door(X, s, Y), Door = door(X, s, Y));
        (Item = east_door, door(X, e, Y), Door = door(X, e, Y));
        (Item = west_door, door(X, w, Y), Door = door(X, w, Y))),
    !,
    unlock(Door).

lock(Item) :-
    i_am_at(X),
    ((Item = north_door, door(X, n, Y), Door = door(X, n, Y));
        (Item = south_door, door(X, s, Y), Door = door(X, s, Y));
        (Item = east_door, door(X, e, Y), Door = door(X, e, Y));
        (Item = west_door, door(X, w, Y), Door = door(X, w, Y))),
    !,
    lock(Door).

open(Item) :-
    i_am_at(X),
    ((Item = north_door, door(X, n, Y), Door = door(X, n, Y));
        (Item = south_door, door(X, s, Y), Door = door(X, s, Y));
        (Item = east_door, door(X, e, Y), Door = door(X, e, Y));
        (Item = west_door, door(X, w, Y), Door = door(X, w, Y))),
    !,
    open(Door).

close_door(Item) :-
    i_am_at(X),
    ((Item = north_door, door(X, n, Y), Door = door(X, n, Y));
        (Item = south_door, door(X, s, Y), Door = door(X, s, Y));
        (Item = east_door, door(X, e, Y), Door = door(X, e, Y));
        (Item = west_door, door(X, w, Y), Door = door(X, w, Y))),
    !,
    close_door(Door).

in(north_door, Place) :- door(Place, n, _).
in(south_door, Place) :- door(Place, s, _).
in(east_door, Place) :- door(Place, e, _).
in(west_door, Place) :- door(Place, w, _).
