:- discontiguous in/2, can_pick_up/1, door/3, is_locked/1, power_on/1, generator_state/1, elevator_status/1.
:- multifile in/2, is_closed/1, is_locked/1, can_pick_up/2, can_lock/1, can_unlock/1, is_open/1, can_pick_up/1, power_on/1, generator_state/1, elevator_status/1.
:- dynamic secret_clicks/1.

/* For displaying secret message */
secret_clicks(0).

increment_clicks :-
    secret_clicks(X),
    retract(secret_clicks(X)),
    X1 is X + 1,
    assertz(secret_clicks(X1)).


/* Control panel */
in(control_panel, security_room).

% Fail - not in the same room
power_on(elevator) :-
    \+ i_am_at(security_room),
    !,
    write('I don\'t see it here...'),
    nl.

% Fail - generator not on
power_on(elevator) :-
    \+generator_state(on),
    \+elevator_status(on),
    !,
    write('You hear an unpleasant <buzz>, looks like the backup power supply system is not enough to power the elevator'), nl,
    write('It needs more juice!'),
    nl.

% Already on
power_on(elevator) :-
    elevator_status(on),
    \+secret_clicks(9),
    !,
    increment_clicks,
    write('It is already powered, it really won\'t work any better if you spam this button...'),
    nl.

% Secret!
power_on(elevator) :-
    elevator_status(on),
    secret_clicks(9),
    !,
    write('FINE, OK.'), nl,
    write('As a token of appreciation for your tireless effort, from now on the elevator goes 2% faster.'), nl.

% Success
power_on(elevator) :-
    generator_state(on),
    \+elevator_status(on),
    !,
    retract(elevator_status(off)),
    assertz(elevator_status(on)),
    write('You hear a friendly <click> sound and see a reassuring flash of green light'),
    nl.


/* Door to locker_room */
door(security_room, s, locker_room).
is_locked(door(security_room, s, locker_room)).

