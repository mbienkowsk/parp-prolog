
:- dynamic i_am_at/1, at/2, holding/1.
/* These rules describe how to pick up an object. */

take(X) :-
    holding(X),
    write('You''re already holding it!'),
    !, nl.

take(X) :-
    i_am_at(Place),
    at(X, Place),
    retract(at(X, Place)),
    assert(holding(X)),
    write('OK.'),
    !, nl.

take(_) :-
    write('I don''t see it here.'),
    nl.


/* These rules describe how to put down an object. */

drop(X) :-
    holding(X),
    i_am_at(Place),
    retract(holding(X)),
    assert(at(X, Place)),
    write('OK.'),
    !, nl.

drop(_) :-
    write('You aren''t holding it!'),
    nl.


/* These rules are responsible for printing out your inventory*/

list_items([]).

list_items([Item|Rest]) :-
    tab(2), write(Item), nl,
    list_items(Rest).


display_inv([]) :- 
    write('Your inventory is empty.'), nl, !.

display_inv(Inventory) :- 
    write('You have: '), nl,
    list_items(Inventory).


inventory :-
    findall(X, holding(X), Inventory),
    display_inv(Inventory).


% Aliases
i :- inventory.
eq :- inventory.
equipment :- inventory.
