:- multifile describe/1.

describe(security_room) :-
    write('The security room is dimly lit, the soft glow of monitors casting a blue hue on'), nl,
    write('the walls. The air is cool, and the hum of electronic equipment fills the room.'), nl,
    write('Rows of monitors display surveillance footage, capturing glimpses of different'), nl,
    write('sections of the lab. The power control switches on the central console beckon,'), nl,
    write('suggesting a pivotal role in the functionality of the facility.'),
    nl.

describe(control_panel) :-
    write('The central console stands prominently, adorned with an array of power control'), nl,
    write('switches. Their sleek design and illuminated indicators add a touch of modernity'), nl,
    write('to the room. Labels beside each switch hint at their specific functions. The'), nl,
    write('control panel exudes an air of authority, silently overseeing the lab\'s intricate'), nl,
    write('systems from its place in the security room.'), nl,
    write('One switch catches your eye - it\'s the elevator power supply'), nl,
    write('This is what you have been looking for!'),
    nl.