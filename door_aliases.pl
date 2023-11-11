:- dynamic is_open/1, is_closed/1, is_locked/1, is_unlocked/1.

% is_open
is_open(north_door) :-
    i_am_at(X),
    (door(X, n, _) -> is_open(door(X, n, _)) ; write('There is no door leading north.')).

is_open(south_door) :-
    i_am_at(X),
    (door(X, s, _) -> is_open(door(X, s, _)) ; write('There is no door leading south.')).

is_open(east_door) :-
    i_am_at(X),
    (door(X, e, _) -> is_open(door(X, e, _)) ; write('There is no door leading east.')).

is_open(west_door) :-
    i_am_at(X),
    (door(X, w, _) -> is_open(door(X, w, _)) ; write('There is no door leading west.')).

% is_closed
is_closed(north_door) :-
    i_am_at(X),
    (door(X, n, _) -> is_closed(door(X, n, _)) ; write('There is no door leading north.')).

is_closed(south_door) :-
    i_am_at(X),
    (door(X, s, _) -> is_closed(door(X, s, _)) ; write('There is no door leading south.')).

is_closed(east_door) :-
    i_am_at(X),
    (door(X, e, _) -> is_closed(door(X, e, _)) ; write('There is no door leading east.')).

is_closed(west_door) :-
    i_am_at(X),
    (door(X, w, _) -> is_closed(door(X, w, _)) ; write('There is no door leading west.')).

% is_locked
is_locked(north_door) :-
    i_am_at(X),
    (door(X, n, _) -> is_locked(door(X, n, _)) ; write('There is no door leading north.')).

is_locked(south_door) :-
    i_am_at(X),
    (door(X, s, _) -> is_locked(door(X, s, _)) ; write('There is no door leading south.')).

is_locked(east_door) :-
    i_am_at(X),
    (door(X, e, _) -> is_locked(door(X, e, _)) ; write('There is no door leading east.')).

is_locked(west_door) :-
    i_am_at(X),
    (door(X, w, _) -> is_locked(door(X, w, _)) ; write('There is no door leading west.')).

% is_unlocked
is_unlocked(north_door) :-
    i_am_at(X),
    (door(X, n, _) -> is_unlocked(door(X, n, _)) ; write('There is no door leading north.')).

is_unlocked(south_door) :-
    i_am_at(X),
    (door(X, s, _) -> is_unlocked(door(X, s, _)) ; write('There is no door leading south.')).

is_unlocked(east_door) :-
    i_am_at(X),
    (door(X, e, _) -> is_unlocked(door(X, e, _)) ; write('There is no door leading east.')).

is_unlocked(west_door) :-
    i_am_at(X),
    (door(X, w, _) -> is_unlocked(door(X, w, _)) ; write('There is no door leading west.')).
