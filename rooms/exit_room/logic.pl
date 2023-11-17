:- multifile path/3, in/2, enter/1, elevator_status/1.
:- dynamic in/2, elevator_status/1.

in(vent, exit_room).
in(elevator, exit_room).
in(power_cell, exit_room).
elevator_status(off).

enter(elevator) :-
    elevator_status(on),
    !,
    write('As you ascend through the elevator, leaving the depths of the lab behind, a sense'), nl,
    write('of accomplishment washes over you. The familiar hum of the machinery gradually'), nl,
    write('fades as you reach the surface, greeted by natural light and the open air. The'), nl,
    write('door opens, revealing a world beyond the confines of the secretive lab. You have'), nl,
    write('successfully escaped, leaving the mysteries and experiments behind. What lies'), nl,
    write('ahead is a new chapter, and the journey to freedom is now yours to explore.'), nl,
    finish.

enter(elevator) :- 
    write('You enter the elevator, but it is not responsive to you pressing the buttons, the security override is in effect.').