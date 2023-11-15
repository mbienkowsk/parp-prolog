:- multifile describe/1.

describe(computer) :-
    write('On the desk, a computer sits dormant. Its screen is powered off, casting a'), nl,
    write('dark reflection in the quiet room. The keyboard awaits your interaction,'), nl,
    write('could its hard drives have some answers for you?'), nl,
    nl.

describe(desk) :-
    write('The desk in the room is simple yet functional. It holds a powered-off computer'), nl,
    write('at its center. The smooth surface suggests a place for work or study, while'), nl,
    write('the surrounding space remains uncluttered, you bend to see what\'s underneath it'), nl,
    write('There is a sticky note! It says "pass: rot13(XvetvfJnygre)"'),
    write('What\'s rot13? The computer nerds from the lab wouldn\'t just leave a password in plain text for everyone to see').

describe(computer_room) :-
    write('As you step into the room bathed in soft light, you notice a solitary desk at'), nl,
    write('its center. On the desk rests a computer, its screen silent and'), nl,
    write('dark. The absence of the usual hum of electronic activity adds an eerie calm'), nl,
    write('to the room, leaving the space seemingly dormant.'), nl,
    nl.
