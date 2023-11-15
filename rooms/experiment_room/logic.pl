:- multifile open/1, path/3, describe/1, container_interface/1.
:- dynamic holding/1.

path(experiment_room, e, corridor_2).

in(tool_chest, experiment_room).
container_interface(tool_chest).
is_closed(tool_chest).
in(crowbar, tool_chest).
in(power_cell, tool_chest).
can_pick_up(crowbar).

in(broken_door, experiment_room).

put_on(lab_shoes) :-
    holding(lab_shoes),
    retract(holding(lab_shoes)),
    assertz(have_on(lab_shoes)),
    write('The boots are really heavy and feel solid. You put them on.').