:- multifile describe/1.

/* Description for the locker room */
describe(locker_room) :-
    write('You are in the locker room. '),
    write('There is one door to the north and one to the east. '),
    write('In the corner of the room, there is a locker.').
 
 /* Description for the items in the locker room. */
 describe(locker) :- 
    is_open(locker), 
    write('The locker consists of two compartments: the hanger,
    on which there is a lab coat, and a smaller compartment below it which is locked.
    If only you could find the key to unlock it...').
 
 describe(locker) :- is_closed(locker), write('The locker seems to be unlocked.').
   
describe(locker_compartment) :-
   is_locked(locker_compartment),
   !,
   write('The bottom compartment is locked. There is a keyhole, but where is the key?').

describe(locker_compartment) :-
   write('In the smaller compartment is pair of sturdy, lab shoes. These could probably come in handy!').
 
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
 