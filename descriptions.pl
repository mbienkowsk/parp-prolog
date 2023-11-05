/* These rules describe the various rooms.  Depending on
   circumstances, a room may have more than one description. */

describe(locker_room) :-
   write('You are in the locker room. '),
   write('There is one door to the north and one to the east. '),
   write('In the corner of the room, there is a locker.').

/* These rules describe items. */
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