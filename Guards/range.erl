-module(range).
-export([range/1]).

range(X) when is_integer(X), X > 10, X < 100 ->
    io:format("~w is in range~n", [X]);
range(X) ->
    io:format("~W is not in range~n", [X]).