:- discontiguous door/3, is_locked/1, is_open/1, can_unlock/1, can_lock/1.
:- dynamic is_closed/1, is_locked/1, is_open/1.
:- multifile in/2, is_closed/1, is_locked/1, can_pick_up/2, can_lock/1, is_open/1, door/3, path/3.

% locker room door to the west
door(corridor_1, w, locker_room).
is_locked(door(corridor_1, w, locker_room)).
can_unlock(door(corridor_1, w, locker_room)) :- holding(locker_room_key).
can_lock(door(corridor_1, w, locker_room)) :- holding(locker_room_key).

% generator room door to the north
door(corridor_1, n, generator_room).
is_open(door(corridor_1, n, generator_room)).

/*----------------------------------------------
END OF CORRIDOR_1
START OF CORRIDOR_2
---------------------------------------------*/


% East door towards computer room
door(corridor_2, e, computer_room).
is_locked(door(corridor_2, e, computer_room)).
% can only unlock from inside the computer room
can_unlock(door(corridor_2, e, computer_room)) :- i_am_at(computer_room).

% West door towards experiment room (blown open)
door(corridor_2, w, experiment_room).
is_open(door(corridor_2, w, experiment_room)).

% paths between corridors
path(corridor_1, s, corridor_2).
path(corridor_2, n, corridor_1).