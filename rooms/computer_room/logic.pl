:- discontiguous door/3.
:- dynamic is_locked/1, can_unlock/1, i_am_at/1, computer_state/1, in/2.
:- multifile in/2, is_closed/1, is_locked/1, can_pick_up/2, is_open/1, can_unlock/1.

% West door towards corridor_2 
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
    
computer_state(off).

%  Desk 
in(desk, computer_room).

% Vent
in(vent, computer_room).