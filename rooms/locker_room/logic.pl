:- discontiguous in/2, can_pick_up/1, door/3, is_locked/1, container_interface/1.
:- multifile in/2, is_closed/1, is_locked/1, can_pick_up/2, can_lock/1, can_unlock/1, is_open/1, can_pick_up/1.

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
enter(keypad, 852611) :-
    write('The light on the lock blinks green, it buzzes and unlocks. Correct!'),
    !,
    retract(is_locked(door(locker_room, n, security_room))),
    retract(is_locked(door(security_room, s, locker_room ))),
    assertz(path(locker_room, n, security_room)),
    assertz(path(security_room, s, locker_room)),
    assertz(is_open(door(locker_room, n, security_room))).

enter(keypad, _) :-
    write('The light on the lock blinks red. The provided code was incorrect.'),
    !.

in(locker_compartment, locker).
container_interface(locker_compartment).
in(lab_shoes, locker_compartment).
is_locked(locker_compartment).
can_pick_up(lab_shoes).
can_unlock(locker_compartment) :- holding(small_key).
