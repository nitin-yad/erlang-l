%%%-------------------------------------------------------------------
%%% @author nitin.yadav
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 20. Jul 2018 10:57
%%%-------------------------------------------------------------------
-module(hello_server).
-author("nitin.yadav").

%% API
-export([]).

%% module implements gen_server behaviour, you need to provide all callback functions
%% the behaviour announces
-behavior(gen_server).

-define(SERVER, ?MODULE).

-record(state, {count}).

%% API functions
-export([
  start_link/0,
  stop/0,
  get_count/0,
  say_hello/0]).

%% gen_server functions

-export([
  init/1,
  handle_call/3,
  handle_cast/2,
  handle_info/2,
  terminate/2,
  code_change/3
]).

%% API functions definitions

%% Parameters for start_link, 1st is the name to register the process locally
%% 2nd is the module to find the init/1 callback
%% what parameters to pass to init/1
%% additional option to start_link
start_link() ->
  gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).

%% We don't use ! anymore. We use cast to send message async(we dont expect a response).
stop() ->
  gen_server:cast(?SERVER, stop).

say_hello() ->
  gen_server:cast(?SERVER, say_hello).

%% Here we expect a response, so we use call to synchronously to invoke our server.
get_count() ->
  gen_server:call(?SERVER, get_count).

%% gen_server functions definitions

init([]) ->
  {ok, #state{count = 0}}.

%% we reply with count and update the state
handle_call(get_count, _From, #state{count=Count}) ->
  {reply, Count, #state{count=Count+1}}.

%% first handle_cast clause, note the semicolon here..
handle_cast(say_hello, State) ->
  io:format("Hello~n"),
  {noreply, #state{count = State#state.count+1}};

handle_cast(stop, State) ->
  {stop, normal, State}.

%% deals with out of band messages, i.e. messages that were not sent via cast or call.
handle_info(Info, State) ->
  error_logger:info_msg("~p~n", [Info]),
  {noreply, State}.

%% terminate is invoked by gen_server container or shutdown.
terminate(_Reason, _State) ->
  error_logger:info_msg("terminating~n"),
  ok.

code_change(_OldVsn, State, _Extra) ->
  {ok, State}.


