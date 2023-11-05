:- discontiguous in/2.
:- discontiguous is_closed/1.

/* The locker */
in(locker, locker_room).
container_interface(locker).
is_closed(locker).

/* The coat */
in(coat, locker).

/* Key to the eastern door*/
in(locker_room_key, coat).

/* East door towards corridor 1*/
door(locker_room, e, corridor_1).
door_interface(east_door).
east_door :- door(locker_room, e, corridor_1).
is_locked(east_door).
can_unlock(east_door) :- holding(locker_room_key).
can_lock(east_door) :- holding(locker_room_key).

