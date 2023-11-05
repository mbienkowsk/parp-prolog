
:- dynamic i_am_at/1, at/2, holding/1.
/* These rules describe how to pick up an object. */

% Case 1 - already holding the object
take(X) :-
    holding(X),
    write('You''re already holding it!'),
    !, nl.

% Case 2 - object and player in different rooms
take(X) :-
    \+((i_am_at(Place),
    at(X, Place))),
    write('I don''t see it here.'),
    nl,
    !.    

% Case 3 - object cannot be taken out of a container
take(X) :-
    \+ remove_from_container(X),
    !.

% Case 4 - All previous conditions don't apply, can be taken
take(X) :-
    retract(in(X, _)),
    assert(holding(X)),
    write('OK.'), nl.



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
