:- multifile path/3, in/2, enter/1, elevator_status/1.
:- dynamic in/2, elevator_status/1.

in(vent, exit_room).
in(elevator, exit_room).
in(power_cell, exit_room).
elevator_status(off).

enter(elevator) :-
    elevator_status(on),
    !,
    write('You enter the now functioning elevator and finally leave the lab. Good job!'),
    finish.

enter(elevator) :- 
    write('You enter the elevator, but it is not responsive to you pressing the buttons. Maybe there is some way to activate it?').