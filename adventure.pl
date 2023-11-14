/* Sysy biega 2, by Mikolaj Garbowski and Maksym Bienkowski. */

:- dynamic i_am_at/1, at/2, holding/1, is_open/1, is_closed/1, is_locked/1, is_unlocked/1, in/2.
:- discontiguous reset_world/0.

reset_world :- retractall(at(_, _)), retractall(i_am_at(_)), retractall(alive(_)), retractall(is_closed(_)), retractall(is_closed(_)),
   retractall(is_open(_)), retractall(is_locked(_)), retractall(is_unlocked(_)).

/* Source databases */
import_data:-
        consult('inventory_management.pl'),
        consult('movement.pl'),
        consult('exploration.pl'),
        consult('container.pl'),
        consult('door_like_interface.pl'),
        consult('rooms/logic.pl'),
        consult('rooms/descriptions.pl'),
        consult('computer_interface.pl').


/* Initial setup */
setup :- 
        consult('setup.pl').


/* Under UNIX, the "halt." command quits Prolog but does not
   remove the output window. On a PC, however, the window
   disappears before the final output can be seen. Hence this
   routine requests the user to perform the final "halt." */

finish :-
        nl,
        write('The game is over. Please enter the "halt." command.'),
        nl.


/* This rule just writes out game instructions. */

instructions :-
        nl,
        write('Enter commands using standard Prolog syntax.'), nl,
        write('Available commands are:'), nl,
        write('start.             -- to start the game.'), nl,
        write('n.  s.  e.  w.     -- to go in that direction.'), nl,
        write('take(Object).      -- to pick up an object.'), nl,
        write('drop(Object).      -- to put down an object.'), nl,
        write('open(Object).      -- to open door or container'), nl,
        write('look.              -- to look around you again.'), nl,
        write('instructions.      -- to see this message again.'), nl,
        write('halt.              -- to end the game and quit.'), nl,
        nl.


introduction :-
    write('As you slowly open your eyes, a throbbing ache reverberates through your head,'), nl,
    write('and the acrid scent of chemicals fills the air. Disoriented, you find yourself lying'), nl,
    write('on a cold metal floor in what appears to be a dimly lit locker room. The flickering'), nl,
    write('light above casts unsettling shadows on the lockers that surround you.'), nl,
    nl,
    write('A soft hum of emergency alarms pulsates through the room, and the distant echoes'), nl,
    write('of chaotic commotion resonate in the air. Struggling to your feet, you notice a faint'), nl,
    write('glow emanating from a small screen embedded hanged on the wall near the entrance.'), nl,
    write('The screen flickers to life, displaying a message in stark white letters:'), nl,
    nl,
    write('"Subject 42, the experiment has failed. Containment breach detected. Evacuation'), nl,
    write('protocol initiated. Escape the facility before critical systems fail. Beware of'), nl,
    write('anomalies. Your survival is paramount. Time is of the essence."'), nl,
    nl,
    write('With a sense of urgency, you realize that your fate is entwined with the impending'), nl,
    write('collapse of the lab. The clock is ticking, and the path to freedom is uncertain.'),
    nl.


/* This rule prints out instructions and tells where you are. */
start :-
        reset_world,
        import_data,
        setup,
        instructions,
        introduction.

