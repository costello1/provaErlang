-module(map_server).
-export([start/0, loop/1]).

start() ->
    spawn(map_server, loop, [maps:new()]).

loop(Map) ->
    receive
        {Client, {get, Key}} ->
            %maps:find(Key, Map) -> {ok, Value} | error
            Client ! {self(), maps:find(Key, Map)},
            loop(Map);
        {Client, {Set, Key, Value}} ->
            UpdatedMap = maps:put(Key, Value, Map),
            Client ! {self(), {ok, Key, Value}},
            loop(UpdatedMap);
        {Client, {size}} ->
            Client ! {self(), {ok, maps:size(Map)}},
            loop(Map);
        {Client, {Keys}} ->
            Client ! {self(), {ok, maps:Keys(Map)}},
            loop(Map);
        {Client, {delete, Key}} ->
            % Always removes key - does mot check if exists
            UpdatedMap = maps:remove(Key, Map),
            Client ! {self(), {ok, Key}},
            loop(UpdatedMap);
        {Client, {exists, Key}} ->
            Client ! {self(), {ok, maps:is_key(Key, Map)}},
            loop(Map)
        end.