/*-------------------------------------------
START OF LOCKER_ROOM
---------------------------------------------*/

/* Description for the locker room */
describe(locker_room) :-
    write('The locker room is dimly lit, with a faint hum of machinery in the air. Rows'), nl,
    write('of lockers fill the space, closed and orderly. However, one locker catches'), nl,
    write('your eye — slightly open, a hint of something inside. It seems like the owner'), nl,
    write('forgot to lock it properly'), nl,
    nl,
    write('To the north, a heavy metal door labeled "Security" presents itself to you'), nl,
    write('To the east, you see another door with no labels as to where it leads'), 
    nl.

/* Description for the items in the locker room. */
describe(locker) :- 
    is_open(locker), 
    write('The locker reveals two compartments, in the upper part, a lab coat hangs neatly on a hanger'), nl,
    write('Below there is another compartment which seems to be locked.').

describe(locker) :- is_closed(locker), write('The locker seems to be unlocked.').


describe(coat) :- 
    in(locker_room_key, coat),
    write('The lab coat stirs a sense of familiarity.'), nl,
    write('The nametag reads: "Dr. J. Sysy.", it triggers a cascade of hazy memories. As you run your'), nl,
    write('fingers over the fabric, flashes of experiments and research echo in your mind.'), nl,
    write('Memories start coming back to you, it is your coat!'), nl,
    nl,
    write('Instinctively you check your pockets. You feel a small, cold object - a key'), nl,
    assert(holding(locker_room_key)),
    !.

describe(coat) :-
    write('The lab coat stirs a sense of familiarity.'), nl,
    write('The nametag reads: "Dr. J. Sysy.", it triggers a cascade of hazy memories. As you run your'), nl,
    write('fingers over the fabric, flashes of experiments and research echo in your mind.'), nl,
    write('Memories start coming back to you, it is your coat!'),
    nl.

describe(locker_room_key) :- write('Small, silver key. What does it open?').

describe(east_door) :-
   i_am_at(locker_room),
   holding(locker_room_key),
   !,
   write('The door is locked. Perhaps the key you found could unlock it?').

describe(east_door) :-
   i_am_at(locker_room),
   \+holding(locker_room_key),
   !,
   write('The door is locked. Maybe the key is somewhere to be found?').


describe(north_door) :- 
   i_am_at(locker_room),
   is_locked(north_door),
   write('The door is made of solid, red metal. Label says "Security room" .'),
   write('The door is closed. there is a keypad next to it. It requires a 6 digit code to be entered. ').

describe(keypad) :-
   write('A modern keypad, mounted beside the security room door, stands as the gateway to the lab. '),
   write('It features a digital touchscreen with a numeric grid and softly backlit keys. '),
   write('To enter, you must input the correct 6-digit code.').

/*-------------------------------------------
END OF LOCKER_ROOM
START OF CORRIDOR_1
---------------------------------------------*/

describe(corridor_1) :-
    write('You find yourself in a dimly lit corridor, the ambient light casting faint shadows.'), nl,
    write('Directly ahead to the north, a door labeled "Generator Room" stands prominently.'), nl,
    write('Looking to the south, the corridor stretches away, its destination obscured by the dim lighting,'),
    nl.

describe(north_door) :-
    i_am_at(corridor_1),
    !,
    write('The door seems to be unlocked.').

/*-------------------------------------------
END OF CORRIDOR_1
START OF COMPUTER_ROOM
---------------------------------------------*/

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

/*--------------------------------------------
END OF COMPUTER_ROOM
START OF CORRIDOR_2
---------------------------------------------*/
describe(corridor_2) :-
   write('You are in the second segment of the corridor. west - experiment room, east - computer room.').

/*----------------------------------------------
END OF CORRIDOR_2
START OF GENERATOR_ROOM
---------------------------------------------*/

describe(generator_room) :-
   write('You are in the generator room. interactable: generator').

describe(generator) :- 
   generator_state(empty),
   (\+holding(power_cell(_))->assertz(holding(power_cell(0)));true),
   write('The emergency power generator looms with a single glowing cell within, flanked by two conspicuous empty slots, '),
   write('rendering the machine silent and incomplete, waiting for its missing components. In order to restore electricity in the lab, the two remaining cells have to be found.').

describe(generator) :-
   generator_state(full),
   write('With the power cells in place, the generator hums to life, its core glowing vibrantly.'),
   write('It\'s ready to go—just a switch away from unleashing its energy.').

increment_cell_count :-
   holding(power_cell(X)),
   retract(holding(power_cell(X))),
   X1 is X + 1,
   assert(holding(power_cell(X1))).

decrement_cell_count :-
   holding(power_cell(X)),
   retract(holding(power_cell(X))),
   X1 is X - 1,
   assert(holding(power_cell(X1))).
