
:- dynamic at/2.

/* This rule tells how to look around you. */
look :-
    i_am_at(Place),
    describe(Place),
    nl,
    % notice_objects_at(Place),
    nl.

/* Rules responsible for examining items */
examine(Thing) :- 
    ((i_am_at(Place), at(Thing, Place)); 
        holding(Thing)),
    describe(Thing),
    !.

examine(_) :- 
    write('I don\'t see that here.'),
    !.

% Aliases
inspect(Thing) :- examine(Thing).
e(Thing) :- examine(Thing).


/* In (Thing, Place) represents no container being between Thing and Place.
At also checks recursively for containers in Place that contain Thing. */
at(Thing, Place) :-
    in(Thing, Place),
    !.

at(Thing, Place) :-
    in(Thing, ThingContainer), at(ThingContainer, Place).
