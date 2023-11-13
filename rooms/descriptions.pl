/*-------------------------------------------
START OF LOCKER_ROOM
---------------------------------------------*/

/* Description for the locker room */
describe(locker_room) :-
   write('You are in the locker room. '),
   write('There is one door to the north and one to the east. '),
   write('In the corner of the room, there is a locker.').

/* Description for the items in the locker room. */
describe(locker) :- 
   is_open(locker), 
   write('The locker consists of two compartments: the hanger,
   on which there is a lab coat, and a smaller compartment below it which is locked.').

describe(locker) :- is_closed(locker), write('The locker seems to be unlocked.').


describe(coat) :- 
   in(locker_room_key, coat),
   write('The lab coat is white and has a name tag on it. '),
   write('The name tag reads "Dr. J. Sysy". In the front pocket you find a key.'),
   assert(holding(locker_room_key)),
   !.

describe(coat) :-
   write('The lab coat is white and has a name tag on it. '),
   write('The name tag reads "Dr. J. Sysy".').

describe(locker_room_key) :- write('Small, silver key. What does it open?').

describe(east_door) :-
   i_am_at(locker_room),
   holding(locker_room_key),
   !,
   write('The door is locked. Perhaps the key you found will work? ').

describe(east_door) :-
   i_am_at(locker_room),
   \+holding(locker_room_key),
   !,
   write('The door is locked. Maybe you need to find a key? ').


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
    write('You are in a dimly lit corridor. There is a door with the label "Generator room" to your north. '),
    write('The corridor continues to the south and you can\'t really see where it goes.').


describe(north_door) :-
    i_am_at(corridor_1),
    !,
    write('The door seems to be unlocked.').

/*-------------------------------------------
END OF CORRIDOR_1
START OF COMPUTER_ROOM
---------------------------------------------*/

describe(computer) :- write('There is a computer on the desk. Use power_on(computer) to interact with it.').

describe(desk) :- write('Wooden desk. There is a sticky note underneath! It says "pass: rot13(XvetvfJnygre)"'),
   write('What can it mean?').

describe(computer_room) :- write('You are in the computer room. There is a desk with a computer on top of it.').

/*--------------------------------------------
END OF COMPUTER_ROOM
START OF CORRIDOR_2
---------------------------------------------*/
describe(corridor_2) :-
   write('You are in the second segment of the corridor. west - experiment room, east - computer room.').
