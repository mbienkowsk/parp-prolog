:- discontiguous in/2, can_pick_up/1, door/3, is_locked/1, power_on/1, generator_state/1, elevator_status/1.
:- multifile in/2, is_closed/1, is_locked/1, can_pick_up/2, can_lock/1, can_unlock/1, is_open/1, can_pick_up/1, power_on/1, generator_state/1, elevator_status/1.

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
    !,
    write('It is already powered, it really won\'t work any better if you spam this button...'),
    nl.

% Success
power_on(elevator) :-
    generator_state(on),
    \+elevator_status(on)
    !,
    retract(elevator_status(off)),
    assertz(elevator_status(on)),
    write('You hear a friendly <click> sound and see a reassuring flash of green light'),
    nl.



/* Door to locker_room */
door(security_room, s, locker_room).
is_locked(door(security_room, s, locker_room)).

