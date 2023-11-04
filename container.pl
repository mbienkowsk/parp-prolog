unlock(Item) :- 
    \+ container_interface(Item),
    write('This item cannot be unlocked.'),
    !.

unlock(Item) :- 
    \+ can_unlock(Item),
    write('You do not have access to unlock this item.'),
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
    \+ container_interface(Item),
    write('This item cannot be locked.'),
    !.

lock(Item) :- 
    \+ can_lock(Item),
    write('You do not have access to lock this item.'),
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
    \+ container_interface(Item),
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
    \+ container_interface(Item),
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