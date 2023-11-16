:- multifile describe/1.

describe(generator_room) :-
    write('You are in the generator room. interactable: generator, vent'). %TODO
 
describe(generator) :-
    generator_state(off),
    (\+holding(power_cell(_))->assertz(holding(power_cell(0)));true), %TODO this must be set to 0 at start of the game
    write('The emergency power generator looms with a single glowing cell within, flanked by two conspicuous empty slots, '),
    write('rendering the machine silent and incomplete, waiting for its missing components. In order to restore electricity in the lab, the two remaining cells have to be found.').

describe(generator) :-
    generator_state(on),
    write('With the power cells in place, the generator hums to life, its core glowing vibrantly.'),
    write('It\'s ready to go—just a switch away from unleashing its energy.').

increment_cell_count :-
    holding(power_cell(X)),
    retract(holding(power_cell(X))),
    X1 is X + 1,
    assert(holding(power_cell(X1))).

decrement_cell_count :-
    holding(power_cell(X)),
    retract(holding(power_cell(X))),
    X1 is X - 1,
    assert(holding(power_cell(X1))).