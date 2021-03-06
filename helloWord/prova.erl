-behaviour(gen_fsm).

%% API
-export([start/1, stop/1, start_link/1]).
-export([init/1, handle_event/3, handle_sync_event/4, handle_info/3,
         terminate/3, code_change/4,
         dummy_state/2, dummy_state/3]).

-record(state, {dummy}).

start(Name) ->
    gen_fsm:start(?MODULE, [Name], []).

stop(FsmRef) ->
    gen_fsm:stop(FsmRef).

start_link(Name) ->
    gen_fsm:start_link({local, Name}, ?MODULE, [Name], []).

init(_Args) ->
    {ok, dummy_state, #state{dummy=1}}.

dummy_state(_Event, StateData) ->
    {next_state, dummy_state, StateData}.

dummy_state(_Event, From, StateData) ->
    gen_fsm:reply(From, ok),
    {next_state, dummy_state, StateData}.

handle_event(_Event, _StateName, StateData) ->
    {next_state, dummy_state, StateData}.

handle_sync_event(_Event, From, _StateName, StateData) ->
    gen_fsm:reply(From, ok),
    {next_state, dummy_state, StateData}.

handle_info(_Info, _StateName, StateData) ->
    {next_state, dummy_state, StateData}.

terminate(_Reason, _StateName, _StateData) ->
    ok.

code_change(_OldVersion, _StateName, StateData, _Extra) ->
    {ok, dummy_state, StateData}.
