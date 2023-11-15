:- multifile describe/1.
:- dynamic small_key_collected/0, have_on/1.
small_key_collected:- false.


describe(experiment_room) :-
    i_am_at(experiment_room),
    have_on(lab_shoes), 
    !,
    write('You are in the experiment room. With the shoes that you are wearing, you should be able to walk through that sludge.').

describe(experiment_room) :-
    i_am_at(experiment_room),
    holding(lab_shoes),
    !,
    write('You are in the experiment room. The floor is covered in a sticky, toxic sludge. ') ,
    write('On the other side of the room, you see a small metal tool chest. Maybe you should put on the shoes you found in the locker room? '),
    write('The door was blown open by the failure of the experiment, it seems. It is laying next to where you stand').
    
describe(experiment_room) :-
    i_am_at(experiment_room),
    write('You are in the experiment room. The floor is covered in a sticky, toxic sludge. ') ,
    write('On the other side of the room, you see a small metal tool chest. If you were only able to go through the sludge, '),
    write('you could see what\'s inside. The door was blown open by the failure of the experiment, it seems. It is laying next to where you stand').

describe(tool_chest) :-
    have_on(lab_shoes), 
    !,
    write('Inside the chest there is a crowbar and a power cell! They could come in handy.').

describe('tool_chest') :-
    write('The tool chest is made of silver metal. If you could only walk through the sludge to find out its contents...').

describe(broken_door) :- 
    small_key_collected, !,
    write('broken door description.').

describe(broken_door) :- 
    write('You inspect the door closely and decide to flip it over. What a surprise! Somebody must\'ve put a key into the keyhole. '),
    write('The key is bent, but it is attached to a keychain, on which there is another key. What could it unlock?'),
    assertz(holding(small_key)),
    assertz(small_key_collected).



