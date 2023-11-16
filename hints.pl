/* Hint about the current room */
hint(here) :-
    i_am_at(X),
    hint(X).

/* --------------------------------
locker_room
---------------------------------*/

hint(locker_room) :- write('You can interact with the locker, go north or go east'), nl.

hint(locker) :- write('Use open(locker). to open it and see what\'s inside'), nl.

hint(coat) :- write('Take a good look at it, maybe you will find something useful'), nl.

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
hint(computer_room) :- write('You can interact with: computer, desk, vent or go west'), nl.

hint(desk) :- write('Maybe taking a closer look at it will reveal something.'), nl.

hint(computer) :- write('You can use it as a decorative piece or power_on(computer). to make better use of it.'), nl.

%TODO vent, west_door

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
hint(generator_room) :- write('You can interact with power_cell, generator or go south'), nl.

hint(generator) :- write('Use power_on(generator). to power it on'), nl.

hint(power_cell) :- write('Pick it up, it may come in handy later'), nl. % TODO does it belong here?

/* --------------------------------
experiment_room
---------------------------------*/
hint(experiment_room) :- write('You need to acquire some protective gear to walk through the toxic sludge.'), nl.

hint(tool_chest) :- write('Check what\'s inside'), nl.

hint(broken_door) :- write('Maybe taking a closer look at it will reveal something?'), nl.


/* Wildcard */
hint(_) :-
    write('I have no clues about that'), nl.
