:- multifile describe/1.

describe(corridor_1) :-
    write('You are in a dimly lit corridor. There is a door with the label "Generator room" to your north. '),
    write('The corridor continues to the south and you can\'t really see where it goes.').


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
 
 /*----------------------------------------------
END OF CORRIDOR_2
START OF VENT_SHAFT
---------------------------------------------*/
describe(vent) :-
    i_am_at(generator_room),
    \+accessible(vent_shaft),
    write('The vent is pretty spacious. Perhaps you could try to see where it leads?').

describe(vent) :-
    i_am_at(X),
    at(vent, X),
    write('A big, rectangular vent hole in the wall. It looks like a human could fit in there.').

describe(vent_shaft) :-
    write('You are in the vent shaft. East - exit room, South - computer room, North - generator room').

% TODO - describe vents in every room
closed_vent_msg :-
    write('The vent is closed shut and the door doesn\'t seem to budge. '),
    write('Maybe using some tool would help?').