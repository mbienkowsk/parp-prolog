
/* Input loop when pc is turned on */
handle_input :-
    computer_state(on),
    write('/home/sysy$ '),
    read_line_to_string(user_input, Input),
    process_input(Input),
    handle_input.

handle_input.

/* Various commands and the result of entering them */
process_input("ls") :- nl.

process_input("ls -la") :-
    write('-r-------- 1 root root 123 Nov 11 12:34 .pass'), nl.

process_input("ls -a") :- write('.pass'), nl.

process_input("cat .pass") :- write('Permission denied'), nl.

/* If it starts with "cd ", display that it cannot cd to this location*/
process_input(Input) :-
    sub_string(Input, 0, 3, _, "cd "),
    !,
    sub_string(Input, 3, _, 0, Rest),
    write('Cannot cd to '), write(Rest), nl.

/* If it starts with sudo, ask for password */ 
process_input(Input) :-
    sub_string(Input, 0, 5, _, "sudo "),
    !,
    sub_string(Input, 5, _, 0, Rest),
    password_loop(Rest).

% self explanatory ones
process_input("clear") :- tty_clear.

process_input("exit") :-
    write('shutting down'), nl,
    assertz(computer_state(off)),
    retract(computer_state(on)).

process_input("shutdown") :- process_input("exit").

process_input("").
process_input(X) :- write("Unknown command: "), write(X), nl.

password_loop(Input) :-
    % prompt
    write('[sudo] password for sysy: '),
    % get input
    read_line_to_string(user_input, Pass),
    /* If the correct password was entered, either display password or perform command if
    user wasn't asking for it. Shutdown and exit make it possible to exit the loop since we don't
    have access to ctrl+C.
    */
    (Pass == "KirgisWalter" -> !, (Input=="cat .pass" -> display_pass;
                              process_input(Input), handle_input);
     Pass == "shutdown" -> !, process_input("shutdown");
     Pass == "exit" -> !, process_input("exit");
     write('Invalid password.'), nl, password_loop(Input)).

% placeholder for now
display_pass :- write('password: miauuuuu'), nl.

power_on(computer) :-
    i_am_at(computer_room),
    !,
    assertz(computer_state(on)),
    retract(computer_state(off)),
    write('Computer powered on'), nl,
    handle_input.
    

reset :-
    assertz(computer_state(off)),
    (computer_state(on) -> retract(computer_state(on));true),
    power_on(computer).
