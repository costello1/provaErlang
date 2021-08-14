-module(avg).
-export([avg/1]).

% John = 4
% Adam = 6
% George = 1

% L = [{"John", 4}, {"Adam", 6}, {"George", 1}].

avg(L) ->
    sum(L) / length(L).

sum([]) ->
    0;

% = [{"John", 4}, {"Adam", 6}, {"George", 1}]
% = 4 + sum([{"Adam", 6}, {"George", 1}])
% = 4 + 6 + sum({"George", 1}).
% = 4 + 6 + 1 + sum([]).
% = 4 + 6 + 1 + 0.
% = 11 / 3 = 

sum([{_, Score}|T]) ->
    Score + sum(T).