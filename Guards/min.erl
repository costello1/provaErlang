-module(min).
-export([min/2]).

min(X, Y) when X < Y ->
    X;
min(X, Y) ->
    Y.
