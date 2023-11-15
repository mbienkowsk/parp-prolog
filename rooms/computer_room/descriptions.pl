:- multifile describe/1.

describe(computer) :- write('There is a computer on the desk. Use power_on(computer) to interact with it.').

describe(desk) :- write('Wooden desk. There is a sticky note underneath! It says "pass: rot13(XvetvfJnygre)"'),
   write('What can it mean?').

describe(computer_room) :- write('You are in the computer room. There is a desk with a computer on top of it.').
