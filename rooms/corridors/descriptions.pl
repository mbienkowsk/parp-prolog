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
    write('You are in the second segment of the corridor. west - experiment room, east - computer room.').
 
/*---------------------------------------------
END OF CORRIDOR_2
START OF VENT_SHAFT
---------------------------------------------*/

describe(vent) :-
    i_am_at(X),
    at(vent, X),
    write('A big, rectangular vent hole in the wall. It looks like a human could fit in there.').

describe(vent_shaft) :- % TODO: improve description
    write('You are in the vent shaft. East - exit room, South - computer room, North - generator room').

closed_vent_msg :-
    write('The vent is closed shut and the door doesn\'t seem to budge.'), nl,
    write('Maybe using some tool would help?').