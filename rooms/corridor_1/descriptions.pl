

% description of corridor_1
describe(corridor_1) :-
    write('You are in a dimly lit corridor. There is a door with the label "Generator room" to your north. '),
    write('The corridor continues to the south and you can\'t really see where it goes.').


describe(north_door) :-
    i_am_at(corridor_1),
    !,
    write('The door seems to be unlocked.').

