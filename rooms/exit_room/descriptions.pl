describe(exit_room) :-
    write('As you\'re crawling out of the ventilation shaft, you notice an elevator.'), nl,
    write('Finally, a way out of this maze!'), nl,
    write('Lying in the corner is a power cell lighting up the mysterious room'), nl. %TODO only if it is there

describe(elevator) :-
    elevator_status(on), !, 
    write('The elevator is operational and stands ready, a beacon of potential escape.'), nl,
    write('Its doors slightly ajar, inviting you to step inside and make your way to freedom.'), nl.

describe(elevator) :-
    write('Approaching the elevator, you find it disabled, a security override in effect.'), nl,
    write('A prominent display blinks with a warning, indicating that access is restricted'), nl,
    write('and the elevator is currently non-operational. The usual hum of its machinery'), nl,
    write('is replaced by an eerie silence. Looks like the security staff can turn it on/off during emergencies.'), nl.

describe(power_cell) :-
    at(power_cell, exit_room),
    write('The power cell pulses with energy, illuminating the room'), nl,
    write('It may come in handy.'), nl.

describe(vent) :-
    i_am_at(exit_room),
    write('A ventilation shaft large enough to crawl inside'), nl.
