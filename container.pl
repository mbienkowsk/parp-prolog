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


remove_from_container(Thing) :-
    (in(Thing, X), container_interface(X)),
    is_open(X),
    !.

remove_from_container(Thing) :-
    (in(Thing, X), container_interface(X)),
    (is_closed(X); is_unlocked(X)),
    !,
    write('You must open the '), write(X), write(' first.'),
    fail.

remove_from_container(Thing) :-
    (in(Thing, X), container_interface(X)),
    is_locked(X),
    !,
    write('You must unlock the '), write(X), write(' first.'),
    fail.

remove_from_container(Thing) :-
    in(Thing, X), in(X, _), !, remove_from_container(X).

remove_from_container(_).