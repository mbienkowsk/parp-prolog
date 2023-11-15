/* Sysy biega 2, by Mikolaj Garbowski and Maksym Bienkowski. */

:- dynamic i_am_at/1, at/2, holding/1, is_open/1, is_closed/1, is_locked/1, is_unlocked/1, in/2.
:- discontiguous reset_world/0.

reset_world :- retractall(at(_, _)), retractall(i_am_at(_)), retractall(alive(_)), retractall(is_closed(_)), retractall(is_closed(_)),
   retractall(is_open(_)), retractall(is_locked(_)), retractall(is_unlocked(_)), (retract(small_key_collected); true), retractall(holding(_)).

/* Source databases */
import_data:-
        consult('rooms/locker_room/logic.pl'),
        consult('rooms/locker_room/descriptions.pl'),
        consult('rooms/corridors/logic.pl'),
        consult('rooms/corridors/descriptions.pl'),
        consult('rooms/computer_room/logic.pl'),
        consult('rooms/computer_room/descriptions.pl'),
        consult('rooms/computer_room/computer_interface.pl'),
        consult('rooms/generator_room/logic.pl'),
        consult('rooms/generator_room/descriptions.pl'),
        consult('rooms/exit_room/descriptions.pl'),
        consult('rooms/exit_room/logic.pl'),
        consult('rooms/experiment_room/descriptions.pl'),
        consult('rooms/experiment_room/logic.pl'),
        consult('inventory_management.pl'),
        consult('movement.pl'),
        consult('exploration.pl'),
        % it is important that door aliases is before dli and container
        consult('door_aliases.pl'),
        consult('container.pl'),
        consult('door_like_interface.pl').




/* Initial setup */
setup :- 
        consult('setup.pl').


/* Under UNIX, the "halt." command quits Prolog but does not
   remove the output window. On a PC, however, the window
   disappears before the final output can be seen. Hence this
   routine requests the user to perform the final "halt." */

finish :-
        nl,
        write('Thanks for playing!'),
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
        write('look.              -- to look around you again.'), nl,
        write('instructions.      -- to see this message again.'), nl,
        write('halt.              -- to end the game and quit.'), nl,
        nl.


/* This rule prints out instructions and tells where you are. */
start :-
        reset_world,
        import_data,
        setup,
        instructions,
        look.
