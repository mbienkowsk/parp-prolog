:- dynamic is_open/1, holding/1, i_am_at/1, generator_state/1.
:- multifile door/3, is_open/1, holding/1, i_am_at/1, power_on/1, in/2, can_pick_up/1.

door(generator_room, s, corridor_1).
is_open(door(generator_room, s, corridor_1)).

in(vent, generator_room).
vent_state(inaccessible).

in(generator, generator_room).
generator_state(off).

% belongs in here because related
can_pick_up(power_cell).


power_on(generator) :-
    generator_state(on),
    !,
    write('The air vibrates with renewed energy, and the machinery\'s gentle rumble echoes through the entire lab.'),
    nl.

power_on(generator) :-
    i_am_at(generator_room),
    generator_state(off),
    holding(power_cell(2)),
    !,
    retract(generator_state(off)),
    assertz(generator_state(on)),
    write('With a satisfying click, you slot the power cells into place.'),
    write('The generator springs to life with a reassuring hum. Lights flicker on, flooding the room with a steady glow.'),
    write('The air vibrates with renewed energy, and the machinery\'s gentle rumble signals success, powering up the entire lab.').

power_on(generator) :-
    % any other case where the user tries to turn it on without bringing the cells
    i_am_at(generator_room),
    write('Power remains elusive without the necessary cells. Find and install them to awaken this dormant machine.').

%TODO open(vent) -> the vent is already open