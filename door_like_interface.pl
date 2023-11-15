:- dynamic is_closed/1, is_open/1, is_locked/1, is_unlocked/1.
:- multifile unlock/1, lock/1, open/1, close_door/1.


/* Items with door-like interface can be locked, unlocked, opened and closed */
door_like_interface(X) :- container_interface(X); door_interface(X).

/* If a door is initialized, it automatically has a door interface */
door_interface(door(_, _, _)).

/* no item should be initalized as one with a door_like interface - door interface is used for it.
    door_like_interface is abstract and shared by doors and containers. */



unlock(Item) :- 
    i_am_at(X), \+in(Item, X),
    write('Don\'t see it here.'),
    !.    

unlock(Item) :- 
    \+ door_like_interface(Item),
    write('This item cannot be unlocked.'),
    !.

unlock(Item) :- 
    i_am_at(X), \+in(Item, X),
    write('Don\'t see it here.'),
    !.

unlock(Item) :- 
    \+ can_unlock(Item),
    write('You can\'t unlock this item. Perhaps you need a key?'),
    !.

unlock(Item) :- 
    is_locked(Item), 
    (Item=door(_, _, _) -> (
        opposite_door(Item, X),
        retract(is_locked(X)),
        assert(is_unlocked(X)))
        ; true),
    retract(is_locked(Item)),
    assert(is_unlocked(Item)),
    write('Ok, the '), write(Item), write(' is unlocked.'), % TODO: fix wirte(Item)
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
    i_am_at(X), \+in(Item, X),
    write('Don\'t see it here.'),
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
    (Item=door(_, _, _) -> (
        opposite_door(Item, X),
        retract(is_unlocked(X)),
        assert(is_locked(X)))
        ; true),
    retract(is_unlocked(Item)),
    assert(is_locked(Item)),
    write('Ok, the '), write(Item), write(' is locked.'),
    !.

lock(Item) :- 
    is_locked(Item),
    write('It is already locked.'),
    !.

lock(Item) :-
    is_closed(Item),
    retract(is_closed(Item)),
    assert(is_locked(Item)),
    (Item=door(_, _, _) -> (
        opposite_door(Item, X),
        retract(is_closed(X)),
        assert(is_locked(X)))
        ; true),
    write('Ok, the '), write(Item), write(' is locked.'),
    !.


    
open(Item) :- 
    i_am_at(X), \+in(Item, X),
    write('Don\'t see it here.'),
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
    (Item=door(_, _, _) -> (
        opposite_door(Item, X),
        retract(is_unlocked(X)),
        assert(is_open(X)))
        ; true),
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
    (Item=door(_, _, _) -> (
        opposite_door(Item, X),
        retract(is_closed(X)),
        assert(is_open(X)))
        ; true),
    retract(is_closed(Item)),
    assert(is_open(Item)),
    write('Ok, the '), write(Item), write(' is open.'),
    !.

close_door(Item) :- 
    i_am_at(X), \+in(Item, X),
    write('Don\'t see it here.'),
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
    (Item=door(_, _, _) -> (
        opposite_door(Item, X),
        retract(is_open(X)),
        assert(is_closed(X)))
        ; true),
    write('Ok, the '), write(Item), write(' is closed.'),
    !.

close_door(Item) :-
    is_closed(Item),
    write('It is already closed.'),
    !.


opposite_door(X, Y) :-
    (X=door(A, n, B), Y=door(B, s, A));
    (X=door(A, s, B), Y=door(B, n, A));
    (X=door(A, e, B), Y=door(B, w, A));
    (X=door(A, w, B), Y=door(B, e, A)).
