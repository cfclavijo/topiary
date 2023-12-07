-module(erlang).
-export([a_fun/0]).

-define(validateMacr(K,V),{K,V,?LINE}).
-define(CONSTANT,"justavalue").

a_fun() ->
  ?validateMacr(1,2),
  A = 5,
  B = 4,
  C = 5,
  D = 6,
  E = [],
  F = [1, 2, 3],
  G = [1, 2,
    3],
  H = [1, 2, 3],
  case 1 >= 2 of
    true -> true;
    false -> false
  end,
  io:format("~s", ["oh"]).
