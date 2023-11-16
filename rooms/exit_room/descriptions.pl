
% placeholder descriptions for exit room
describe(exit_room) :-
    write('You are in the exit room. Interactive: elevator, power_cell').

describe(elevator) :-
    elevator_status(on), !, 
    write('Elevator accessible. At last, you can escape the lab.').

describe(elevator) :-
    write('Elevator inaccessible. Security room first.').

%TODO describe power_cell
%TODO descriibe vent!
