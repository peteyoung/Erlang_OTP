-module(recurse).

-export([
    sum/1,
    do_sum_1/1,
    do_sum_2/1,
    rev/1,
    rev2/1,
    tailrev/1
]).

sum(0) -> 0;
sum(N) -> sum(N-1) + N.

do_sum_1(N) -> do_sum_1(N, 0).
do_sum_1(N, Total) when N =/= 0 -> do_sum_1(N-1, Total+N);
do_sum_1(0, Total) -> Total.

% no guard needed in this version
do_sum_2(N) -> do_sum_2(N, 0).
do_sum_2(0, Total) -> Total;
do_sum_2(N, Total) -> do_sum_2(N-1, Total+N).

% non tco reverse
% recurse:rev([1,2,3,4]).
rev([A | [B | TheRest] ]) -> rev(TheRest) ++ [B, A];
rev([]) -> [];
rev([X]) -> [X].

% non tco reverse with base cases minimized
% recurse:rev2([1,2,3,4]).
rev2([X | TheRest]) -> rev2(TheRest) ++ [X];
rev2([]) -> [].

% tco reverse
% recurse:tailrev([1,2,3,4]).
tailrev(List) -> tailrev(List, []).
tailrev([X | TheRest], Acc) -> tailrev(TheRest, [X | Acc]);
tailrev([], Acc) -> Acc.
