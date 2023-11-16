:- multifile describe/1.

describe(generator_room) :-
    write('As you explore the generator room, the dormant generator at the center stands in'), nl,
    write('stark contrast to the adjacent ventilation shaft. The idle turbines offer a'), nl,
    write('glimpse into the halted functionality of the lab\'s power source. The ventilation'), nl,
    write('shaft, though vibrating with a faint breeze, seems large enough for someone to'), nl,
    write('fit through.'),
    nl.
 
describe(generator) :-
    generator_state(off),
    write('The emergency power generator looms with a single glowing cell within, flanked by two conspicuous empty slots,'), nl,
    write('rendering the machine silent and incomplete, waiting for its missing components.'), nl,
    write('In order to restore electricity in the lab, the two remaining cells have to be found.'), nl.

describe(generator) :-
    generator_state(on),
    write('With the power cells in place, the generator hums to life, its core glowing vibrantly.'), nl,
    write('It\'s ready to go—just a switch away from unleashing its energy.'), nl.

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