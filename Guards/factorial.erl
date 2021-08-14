-module(factorial).
-export([factorial/1]).

% head(Arg1, Arg2, ...) [ when Guard1; Guard2; ... GuardN ] -> Body.
% head(Arg1, Arg2, ...) [ when Guard1; Guard"; ... GuardN ] -> Body.

factorial(N) when N < 2 ->
    1;
factorial(N) ->
    N * factorial(N - 1).