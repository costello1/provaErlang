-module(map_client).
-export([get_value/2, set_value/3, get_size/1, get_keys/1, delete/2, exists/2]).

get_value(Server, Key) ->
    Server ! {self(), {get, Key}},
    receive
        {Server, {ok, Value}} ->