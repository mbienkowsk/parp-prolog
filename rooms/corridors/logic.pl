:- discontiguous door/3, is_locked/1, is_open/1, can_unlock/1, can_lock/1.
:- dynamic is_closed/1, is_locked/1, is_open/1, vent_state/1.
:- multifile in/2, is_closed/1, is_locked/1, can_pick_up/2, can_lock/1, is_open/1, door/3, path/3, open/1.

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
path(corridor_2, w, experiment_room).

% paths between corridors
path(corridor_1, s, corridor_2).
path(corridor_2, n, corridor_1).


/*----------------------------------------------
END OF CORRIDOR_2
START OF VENT_SHAFT
---------------------------------------------*/


vent(vent_shaft, e, exit_room).
vent(vent_shaft, s, computer_room).
vent(vent_shaft, n, generator_room).

% entering the vent in the generator room - have to make sure the vent has been opened
enter(vent) :-
    i_am_at(generator_room),
    !,
    ((vent_state(accessible))->(retract(i_am_at(generator_room)), assertz(i_am_at(vent_shaft)), look)
    ;(closed_vent_msg)).


% other rooms where there is a vent - for now, they are freely accessible once the one in gen room is opened
enter(vent) :-
    i_am_at(X),
    at(vent, X),
    retract(i_am_at(X)), assertz(i_am_at(vent_shaft)), !,
    look.



% This is here to succeed after trying to enter the vent fails when user hasn't opened it yet
enter(vent) :-
    i_am_at(generator_room).

open(vent) :-
    i_am_at(generator_room),
    holding(crowbar),
    vent_state(inaccessible),
    !,
    write('You slide the crowbar between the vent door and its door frame and push with a lot of foce. The vent swings open!'),
    retract(vent_state(inaccessible)),
    assertz(vent_state(accessible)).

open(vent) :-
    i_am_at(generator_room),
    \+holding(crowbar),
    vent_state(inaccessible),
    !,
    closed_vent_msg.    

open(vent) :-
    i_am_at(X), 
    at(vent, X),
    write('The vent is already open.').
