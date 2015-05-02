-module(recurse).

-export([
    sum/1,
    do_sum_1/1,
    do_sum_2/1
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
