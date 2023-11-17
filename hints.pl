/* Hint about the current room */
hint(here) :-
    i_am_at(X),
    hint(X).

/* --------------------------------
locker_room
---------------------------------*/

hint(locker_room) :- write('You can interact with the locker, go north or go east, use examine(north_door) to get more information'), nl.

hint(locker) :-
    \+is_open(locker), !,
    write('Use open(locker). to open it and see what\'s inside'), nl.

hint(locker) :-
    write('You can interact with coat and locker_compartment'), nl.

hint(coat) :- write('Take a good look at it, maybe you will find something useful'), nl.

hint(lab_shoes) :- write('put_on(lab_shoes). to put them on.'), nl.

hint(east_door) :-
    i_am_at(locker_room),
    write('Find a key to open this door'), nl.

hint(north_door) :-
    i_am_at(locker_room),
    write('Enter the code on the keypad to open this door'), nl.

hint(keypad) :-
    write('Use enter(keypad, <code>). to enter a code'), nl,
    write('Only 6 digits? That\'s only like 999 999 options, you can just brute force it...'), nl,
    write('...or look around for the code, it must be *somewhere*'), nl.

/* --------------------------------
security_room
---------------------------------*/
hint(security_room) :- write('You can interact with the control_panel or go south'), nl.

hint(control_panel) :- write('You can power_on(Something).'), nl.

/* --------------------------------
computer_room
---------------------------------*/
hint(computer_room) :- write('You can interact with: computer, desk, vent or try the door to the west'), nl.

hint(desk) :- write('Google it.'), nl.

hint(computer) :- write('You can use it as a decorative piece or power_on(computer). to make better use of it.'), nl.

hint(west_door) :-
    i_am_at(computer_room),
    write('Try opening them from this side'), nl.

hint(vent) :-
    i_am_at(computer_room),
    write('You can enter the vent'), nl.

/* --------------------------------
corridors
---------------------------------*/
hint(corridor_1) :- write('You can go west, north, south'), nl.

hint(corridor_2) :- write('You can go north, east, west'), nl.

/* --------------------------------
exit_room
---------------------------------*/
hint(exit_room) :- write('You can interact with vent and elevator'), nl.

hint(elevator) :- write('To go inside use enter(elevator).'), nl.


/* --------------------------------
generator_room
---------------------------------*/
hint(generator_room) :- write('You can interact with generator, vent or go south'), nl.

hint(generator) :- write('Use power_on(generator). to power it on'), nl.


/* --------------------------------
experiment_room
---------------------------------*/
hint(experiment_room) :-
    write('You need to acquire some protective gear to walk through the toxic sludge.'), nl,
    write('You can interact with tool_chest and broken_door'), nl.

hint(tool_chest) :- write('To see what\'s inside, first you need some protective gear to cross the toxic puddle'), nl.

hint(broken_door) :- write('Maybe taking a closer look at it will reveal something?'), nl.

hint(power_cell) :- write('Pick it up, it may come in handy later'), nl.


/* Wildcard */
hint(_) :-
    write('I have no clues about that'), nl.
