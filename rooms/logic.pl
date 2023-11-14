
:- discontiguous in/2, can_pick_up/1, door/3, is_locked/1, is_unlocked/1, is_open/1.
:- discontiguous is_closed/1, can_unlock/1, can_lock/1, power_on/1.
:- dynamic is_closed/1, is_locked/1, is_open/1, is_unlocked/1.

in(door(A, _, _), X) :- A=X.
/*-------------------------------------------
START OF LOCKER_ROOM
---------------------------------------------*/

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
    is_open(door(locker_room, n, security_room)).

enter(keypad, _) :-
    write('The light on the lock blinks red. The provided code was incorrect.'),
    !.

/*-------------------------------------------
END OF LOCKER_ROOM
START OF CORRIDOR_1
---------------------------------------------*/

% locker room door to the west
door(corridor_1, w, locker_room).
is_locked(door(corridor_1, w, locker_room)).
can_unlock(door(corridor_1, w, locker_room)) :- holding(locker_room_key).
can_lock(door(corridor_1, w, locker_room)) :- holding(locker_room_key).

% generator room door to the north
door(corridor_1, n, generator_room).
is_open(door(corridor_1, n, generator_room)).

/*-------------------------------------------
END OF CORRIDOR_1
START OF COMPUTER_ROOM
---------------------------------------------*/

/* West door towards corridor_2 */
door(computer_room, w, corridor_2).
is_locked(door(computer_room, w, corridor_2)).
can_unlock(door(computer_room, w, corridor_2)) :- i_am_at(computer_room).

% This needs to be here so no conflicts are caused.
power_on(computer) :-
    i_am_at(computer_room),
    !,
    assertz(computer_state(on)),
    retract(computer_state(off)),
    write('Computer powered on'), nl,
    handle_input.
    

/* Desk */
in(desk, computer_room).

/*--------------------------------------------
END OF COMPUTER_ROOM
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


/*-------------------------------------------
END OF X
START OF ALIASES_FOR_DOOR_STATE
---------------------------------------------*/

is_open(Item) :-
    i_am_at(Place),
    (Item=north_door, door(Place, n, X), is_open(door(Place, n, X));
     Item=south_door, door(Place, s, X), is_open(door(Place, s, X));
     Item=east_door, door(Place, e, X), is_open(door(Place, e, X));
     Item=west_door, door(Place, w, X), is_open(door(Place, w, X))).

is_closed(Item) :-
    i_am_at(Place),
    (Item=north_door, door(Place, n, X), is_closed(door(Place, n, X));
     Item=south_door, door(Place, s, X), is_closed(door(Place, s, X));
     Item=east_door, door(Place, e, X), is_closed(door(Place, e, X));
     Item=west_door, door(Place, w, X), is_closed(door(Place, w, X))).

is_unlocked(Item) :-
    i_am_at(Place),
    (Item=north_door, door(Place, n, X), is_unlocked(door(Place, n, X));
    Item=south_door, door(Place, s, X), is_unlocked(door(Place, s, X));
    Item=east_door, door(Place, e, X), is_unlocked(door(Place, e, X));
    Item=west_door, door(Place, w, X), is_unlocked(door(Place, w, X))).

is_locked(Item) :-
    i_am_at(Place),
    (Item=north_door, door(Place, n, X), is_locked(door(Place, n, X));
     Item=south_door, door(Place, s, X), is_locked(door(Place, s, X));
     Item=east_door, door(Place, e, X), is_locked(door(Place, e, X));
     Item=west_door, door(Place, w, X), is_locked(door(Place, w, X))).

/*----------------------------------------------
END OF CORRIDOR_2
START OF GENERATOR_ROOM
---------------------------------------------*/


door(generator_room, s, corridor_1).
is_open(door(generator_room, s, corridor_1)).

in(generator, generator_room).
generator_state(empty).

power_on(generator) :-
    i_am_at(generator_room),
    holding(power_cell(2)),
    !,
    write('With a satisfying click, you slot the power cells into place.'),
    write('The generator springs to life with a reassuring hum. Lights flicker on, flooding the room with a steady glow.'),
    write('The air vibrates with renewed energy, and the machinery\'s gentle rumble signals success, powering up the entire lab.').

power_on(generator) :-
    % any other case where the user tries to turn it on without bringing the cells
    i_am_at(generator_room),
    generator_state(off),
    write('Power remains elusive without the necessary cells. Find and install them to awaken this dormant machine.').