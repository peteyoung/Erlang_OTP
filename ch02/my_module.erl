%% This is a simple Erlang module

-module(my_module).

-export([pie/0,
         print/1,
         either_or_both/2,
         area/1,
         area2/1,
         either_or_both2/2,
         sign/1,
         sign2/1,
         yesno/3]).

pie() ->
    3.14.

print(Term) ->
    io:format("The value of Term is: ~p.~n", [Term]).
    %io:format("The value of Term is: ~w.~n", [Term]).

either_or_both(true, B) when is_boolean(B) ->
    true;
either_or_both(A, true) when is_boolean(A) ->
    true;
either_or_both(false, false) ->
    false.

area({circle, Radius}) ->
    Radius * Radius * math:pi();
area({square, Side}) ->
    Side * Side;
area({rectangle, Height, Width}) ->
    Height * Width.

area2(Shape) -> 
    case Shape of
        {circle, Radius} ->
            Radius * Radius * math:pi();
        {square, Side} ->
            Side * Side;
        {rectangle, Height, Width} ->
            Height * Width
    end.

either_or_both2(A, B) ->
    case {A, B} of
        {true, B} when is_boolean(B) ->
            true;
        {A, true} when is_boolean(A) ->
            true;
        {false, false} ->
            false
    end.

sign(N) when is_number(N) ->
    if
        N > 0 -> positive;
        N < 0 -> negative;
        true  -> zero
    end.

sign2(N) when is_number(N) ->
    case dummy of
        _ when N > 0 -> positive;
        _ when N < 0 -> negative;
        _ when true  -> zero
    end.

yesno(F, A, B) ->
    case F(A, B) of
        true  -> io:format("yes~n");
        false -> io:format("no~n")
    end.

% my_module:yesno(fun my_module:either_or_both/2, true, true).
% my_module:yesno(fun my_module:either_or_both/2, false, true).
% my_module:yesno(fun my_module:either_or_both/2, false, false).
% my_module:yesno(fun my_module:either_or_both/2, true, false).
