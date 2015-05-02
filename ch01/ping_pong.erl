-module(ping_pong).

-export([run/0]).

run() ->
    Pid = spawn(fun ping/0),
    Pid ! self(),
    receive
        pong -> ok
    end.

ping() ->
    receive
        From -> From ! pong % From contains sender ID
    end.
