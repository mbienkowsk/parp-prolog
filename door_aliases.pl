
% Open
open(north_door) :-
    i_am_at(X),
    (door(X, n, _) -> open(door(X, n, _)) ; write('There is no door leading north.')).

open(south_door) :-
    i_am_at(X),
    (door(X, s, _) -> open(door(X, s, _)) ; write('There is no door leading south.')).

open(east_door) :-
    i_am_at(X),
    (door(X, e, _) -> open(door(X, e, _)) ; write('There is no door leading east.')).

open(west_door) :-
    i_am_at(X),
    (door(X, w, _) -> open(door(X, w, _)) ; write('There is no door leading west.')).

% Close
close_door(north_door) :-
    i_am_at(X),
    (door(X, n, _) -> close_door(door(X, n, _)) ; write('There is no door leading north.')).

close_door(south_door) :-
    i_am_at(X),
    (door(X, s, _) -> close_door(door(X, s, _)) ; write('There is no door leading south.')).

close_door(east_door) :-
    i_am_at(X),
    (door(X, e, _) -> close_door(door(X, e, _)) ; write('There is no door leading east.')).

close_door(west_door) :-
    i_am_at(X),
    (door(X, w, _) -> close_door(door(X, w, _)) ; write('There is no door leading west.')).

% Lock
lock(north_door) :-
    i_am_at(X),
    (door(X, n, _) -> lock(door(X, n, _)) ; write('There is no door leading north.')).

lock(south_door) :-
    i_am_at(X),
    (door(X, s, _) -> lock(door(X, s, _)) ; write('There is no door leading south.')).

lock(east_door) :-
    i_am_at(X),
    (door(X, e, _) -> lock(door(X, e, _)) ; write('There is no door leading east.')).

lock(west_door) :-
    i_am_at(X),
    (door(X, w, _) -> lock(door(X, w, _)) ; write('There is no door leading west.')).

% Unlock
unlock(north_door) :-
    i_am_at(X),
    (door(X, n, _) -> unlock(door(X, n, _)) ; write('There is no door leading north.')).

unlock(south_door) :-
    i_am_at(X),
    (door(X, s, _) -> unlock(door(X, s, _)) ; write('There is no door leading south.')).

unlock(east_door) :-
    i_am_at(X),
    (door(X, e, _) -> unlock(door(X, e, _)) ; write('There is no door leading east.')).

unlock(west_door) :-
    i_am_at(X),
    (door(X, w, _) -> unlock(door(X, w, _)) ; write('There is no door leading west.')).

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