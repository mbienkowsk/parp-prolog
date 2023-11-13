
:- discontiguous in/2, can_pick_up/1, door/3, is_locked/1, is_open/1.
:- dynamic is_closed/1, is_locked/1, is_open/1, is_unlocked/1.

/* The locker */
in(locker, locker_room).
container_interface(locker).
is_closed(locker).

/* The coat */
in(coat, locker).
can_pick_up(coat).

/* Key to the eastern door*/
in(locker_room_key, coat).
can_pick_up(key).

/* East door towards corridor 1*/
door(locker_room, e, corridor_1).
is_locked(door(locker_room, e, corridor_1)).
can_unlock(door(locker_room, e, corridor_1)) :- holding(locker_room_key).
can_lock(door(locker_room, e, corridor_1)) :- holding(locker_room_key).

/* Northern door towards security room*/
door(locker_room, n, security_room).
is_locked(door(locker_room, n, security_room)).

/* Combination lock */
in(keypad, locker_room).
enter(keypad, 123456) :-
    write('The light on the lock blinks green, it buzzes and unlocks. Correct!'),
    !,
    % todo - have to retract current state
    door(locker_room, n, security_room).

enter(keypad, _) :-
    write('The light on the lock blinks red. The code provided was incorrect.'),
    !.

/*-------------------------------------------
END OF LOCKER_ROOM
START OF CORRIDOR_1
---------------------------------------------*/

% locker room door to the west
door(corridor_1, w, locker_room).
is_open(door(corridor_1, w, locker_room)).

% corridor 2 path to the south
% todo
% path(corridor_1, s, corridor_2).

% generator room door to the north
door(corridor_1, n, generator_room).
is_open(door(corridor_1, n, generator_room)).

