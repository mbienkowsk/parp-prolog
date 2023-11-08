:- discontiguous in/2, is_closed/1, can_pick_up/1, door/3, is_locked/1, door_interface/1.

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
door_interface(east_door).
east_door :- door(locker_room, e, corridor_1).
is_locked(east_door).
in(east_door, locker_room).
can_unlock(east_door) :- holding(locker_room_key).
can_lock(east_door) :- holding(locker_room_key).

/* Northern door towards security room*/
door(locker_room, n, security_room).
north_door :- door(locker_room, n, security_room).
in(north_door, locker_room).
door_interface(north_door).
is_locked(north_door).

/* Combination lock */
in(keypad, locker_room).
enter(keypad, 123456) :-
    write('The light on the lock blinks green, it buzzes and unlocks. Correct!'),
    !,
    assert(is_open(north_door)).
    % todo: make this not reset after leaving room!

enter(keypad, _) :-
    write('The light on the lock blinks red. The code provided was incorrect.'),
    !.
