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

/* Wildcard */
hint(_) :-
    write('I have no clues about that'), nl.