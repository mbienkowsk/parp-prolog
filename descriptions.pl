/* These rules describe the various rooms.  Depending on
   circumstances, a room may have more than one description. */

describe(locker_room) :-
   write('You are in the locker room. '),
   write('There is one door to the north and one to the east. '),
   write('In the corner of the room, there is a locker.').

/* These rules describe items. */
describe(locker) :- is_unlocked(locker), write('The locker seems to be open.').
describe(locker) :- is_locked(locker), write('There is a keycard inside.').
describe(locker) :- is_open(locker), write('There is a key inside.').
describe(locker) :- is_closed(locker), write('The locker seems to be open.').


