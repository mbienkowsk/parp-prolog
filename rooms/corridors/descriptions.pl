:- multifile describe/1.

describe(corridor_1) :-
    write('You find yourself in a dimly lit corridor, the ambient light casting faint shadows.'), nl,
    write('Directly ahead to the north, a door labeled "Generator Room" stands prominently.'), nl,
    write('Looking to the south, the corridor stretches away, its destination obscured by the dim lighting,'),
    nl.


describe(north_door) :-
    i_am_at(corridor_1),
    !,
    write('The door seems to be unlocked.').

/*--------------------------------------------
END OF CORRIDOR_1
START OF CORRIDOR_2
---------------------------------------------*/
describe(corridor_2) :-
    write('You are further down the corridor, to the west - entrance to the experiment chamber.'), nl,
    write('The air is heavy with the weight of past scientific endeavors ...or are those toxic fumes?'), nl,
    write('To the east - a locked door guards more secrets.'), nl.
 
/*---------------------------------------------
END OF CORRIDOR_2
START OF VENT_SHAFT
---------------------------------------------*/

describe(vent) :-
    i_am_at(X),
    at(vent, X),
    write('A big, rectangular vent hole in the wall. It looks like a human could fit in there.').

describe(vent_shaft) :-
    write('You are in the vent shaft. You can proceed east, south or north').

closed_vent_msg :-
    write('The vent is closed shut and the door doesn\'t seem to budge.'), nl,
    write('Maybe using some tool would help?').