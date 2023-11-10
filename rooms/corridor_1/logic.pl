

% locker room door to the west
door(corridor_1, w, locker_room).
west_door :- door(corridor_1, w, locker_room).
door_interface(west_door).
is_open(west_door).

% corridor 2 path to the south
path(corridor_1, s, corridor_2).

% generator room door to the north
door(corridor_1, n, generator_room).
north_door :- door(corridor_1, n, generator_room).
door_interface(north_door).

