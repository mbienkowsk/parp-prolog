
/* This rule tells how to look around you. */

look :-
    i_am_at(Place),
    describe(Place),
    nl,
    % notice_objects_at(Place),
    nl.

/* Rules responsible for examining items */
examine(Thing) :- describe(Thing).
inspect(Thing) :- examine(Thing).


/* These rules set up a loop to mention all the objects
in your vicinity. */

% notice_objects_at(Place) :-
%     at(X, Place),
%     write('There is a '), write(X), write(' here.'), nl,
%     fail.

% notice_objects_at(_).
