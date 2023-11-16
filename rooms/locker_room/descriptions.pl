:- multifile describe/1.

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

describe(locker_compartment) :-
   is_locked(locker_compartment),
   !,
   write('The bottom compartment is locked. There is a keyhole, but where is the key?').

describe(locker_compartment) :-
   write('In the smaller compartment is pair of sturdy, lab shoes. These could probably come in handy!').
 
 
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
    write('The door is locked. Perhaps the key you found will work? ').
 
describe(east_door) :-
    i_am_at(locker_room),
    \+holding(locker_room_key),
    !,
    write('The door is locked. Maybe the key is somewhere to be found?').


describe(north_door) :-
    i_am_at(locker_room),
    is_locked(north_door),
    write('The door is made of solid, red metal. Label says "Security room".'), nl,
    write('The door is closed. there is a keypad next to it. It requires a 6 digit code to be entered. ').

describe(keypad) :-
    write('A modern keypad, mounted beside the security room door, stands as the gateway to the lab. '),
    write('It features a digital touchscreen with a numeric grid and softly backlit keys. '),
    write('To enter, you must input the correct 6-digit code.').
