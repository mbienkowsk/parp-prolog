
:- dynamic is_closed/1, is_locked/1, is_open/1, is_unlocked/1.

% locker room door to the west
door(corridor_1, w, locker_room).
is_open(door(corridor_1, w, locker_room)).

% corridor 2 path to the south
path(corridor_1, s, corridor_2).

% generator room door to the north
door(corridor_1, n, generator_room).
is_open(door(corridor_1, n, generator_room)).

