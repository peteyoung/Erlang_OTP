-module(using_macros).

-define(PI, 3.14).
-define(pair(X,Y), {X,Y}).

-export([
    circumference/1,
    pair_of_pairs/4,
    current_pos/0
]).

circumference(Radius) -> Radius * 2 * ?PI.

pair_of_pairs(A, B, C, D) -> ?pair( ?pair(A, B), ?pair(C, D) ).

current_pos() -> [{module, ?MODULE}, {file, ?FILE}, {line, ?LINE}].
