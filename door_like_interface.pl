:- dynamic is_closed/1, is_open/1, is_locked/1, is_unlocked/1.


/* Items with door-like interface can be locked, unlocked, opened and closed */
door_like_interface(X) :- container_interface(X); door_interface(X).

/* If a door is initialized, it automatically has a door interface */
door_interface(door(_, _, _)).

/* no item should be initalized as one with a door_like interface - door interface is used for it.
    door_like_interface is abstract and shared by doors and containers. */

unlock(Item) :-
    i_am_at(X),
    ((Item = north_door, door(X, n, Y), Door = door(X, n, Y));
     (Item = south_door, door(X, s, Y), Door = door(X, s, Y));
     (Item = east_door, door(X, e, Y), Door = door(X, e, Y));
     (Item = west_door, door(X, w, Y), Door = door(X, w, Y))),
    !,
    unlock(Door).

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
    i_am_at(X),
    ((Item = north_door, door(X, n, Y), Door = door(X, n, Y));
        (Item = south_door, door(X, s, Y), Door = door(X, s, Y));
        (Item = east_door, door(X, e, Y), Door = door(X, e, Y));
        (Item = west_door, door(X, w, Y), Door = door(X, w, Y))),
    !,
    lock(Door).

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
    retract(is_unlocked(Item)),
    assert(is_locked(Item)),
    write('Ok, the '), write(Item), write(' is locked.'),
    !.

lock(Item) :- 
    is_locked(Item),
    write('It is already locked.'),
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
    i_am_at(X),
    ((Item = north_door, door(X, n, Y), Door = door(X, n, Y));
     (Item = south_door, door(X, s, Y), Door = door(X, s, Y));
     (Item = east_door, door(X, e, Y), Door = door(X, e, Y));
     (Item = west_door, door(X, w, Y), Door = door(X, w, Y))),
    !,
    open(Door).
    
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
    i_am_at(X),
    ((Item = north_door, door(X, n, Y), Door = door(X, n, Y));
        (Item = south_door, door(X, s, Y), Door = door(X, s, Y));
        (Item = east_door, door(X, e, Y), Door = door(X, e, Y));
        (Item = west_door, door(X, w, Y), Door = door(X, w, Y))),
    !,
    close_door(Door).

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
    write('Ok, the '), write(Item), write(' is closed.'),
    !.

close_door(Item) :-
    is_closed(Item),
    write('It is already closed.'),
    !.
