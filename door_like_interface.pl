
/* Items with door-like interface can be locked, unlocked, opened and closed */
door_like_interface(X) :- container_interface(X); door_interface(X).

/* no item should be initalized as one with a door_like interface - door interface is used for it.
    door_like_interface is abstract and shared by doors and containers. */


unlock(Item) :- 
    \+ door_like_interface(Item),
    write('This item cannot be unlocked.'),
    !.

unlock(Item) :- 
    \+ can_unlock(Item),
    write('You can\'t lock this item. Perhaps you need a key?'),
    !.

unlock(Item) :- 
    is_locked(Item), 
    retract(is_locked(Item)),
    assert(is_unlocked(Item)),
    write('Ok, the '), write(Item), write(' is unlocked.'),
    !.

unlock(Item) :- 
    is_unlocked(Item),
    write('It is already unlocked.'),
    !.

unlock(Item) :- 
    is_open(Item),
    write('It is already unlocked.'),
    !.

unlock(Item) :- 
    is_closed(Item),
    write('It is already unlocked.'),
    !.


lock(Item) :- 
    \+ door_like_interface(Item),
    write('This item cannot be locked.'),
    !.

lock(Item) :- 
    \+ can_lock(Item),
    write('You can\'t lock this item. Perhaps you need a key?'),
    !.

lock(Item) :-     
    is_unlocked(Item), 
    retract(is_unlocked(Item)),
    assert(is_locked(Item)),
    write('Ok, the '), write(Item), write(' is locked.'),
    !.

lock(Item) :- 
    is_locked(Item),
    write('It is already locked.'),
    !.

lock(Item) :-
    is_open(Item), 
    retract(is_open(Item)),
    assert(is_locked(Item)),
    write('Ok, the '), write(Item), write(' is locked.'),
    !.

lock(Item) :-
    is_closed(Item),
    retract(is_closed(Item)),
    assert(is_locked(Item)),
    write('Ok, the '), write(Item), write(' is locked.'),
    !.


open(Item) :- 
    \+ door_like_interface(Item),
    write('This item cannot be opened.'),
    !.

open(Item) :- 
    is_locked(Item),
    write('It is locked.'),
    !.

open(Item) :-   
    is_unlocked(Item), 
    retract(is_unlocked(Item)),
    assert(is_open(Item)),
    write('Ok, the '), write(Item), write(' is open.'),
    !.

open(Item) :-
    is_open(Item),
    write('It is already open.'),
    !.

open(Item) :-   
    is_closed(Item), 
    retract(is_closed(Item)),
    assert(is_open(Item)),
    write('Ok, the '), write(Item), write(' is open.'),
    !.


close_door(Item) :- 
    \+ door_like_interface(Item),
    write('This item cannot be closed.'),
    !.

close_door(Item) :- 
    is_locked(Item),
    write('It is already closed.'),
    !.

close_door(Item) :-
    is_unlocked(Item),
    write('It is already closed.'),
    !.

close_door(Item) :-
    is_open(Item),
    retract(is_open(Item)),
    assert(is_closed(Item)),
    write('Ok, the '), write(Item), write(' is closed.'),
    !.

close_door(Item) :-
    is_closed(Item),
    write('It is already closed.'),
    !.
