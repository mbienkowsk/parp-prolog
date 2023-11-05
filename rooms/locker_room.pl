:- discontiguous in/2.

/* The locker */
in(locker, locker_room).
container_interface(locker).
is_closed(locker).

/* The coat */
in(coat, locker).

/* The key */
in(locker_room_key, coat).
