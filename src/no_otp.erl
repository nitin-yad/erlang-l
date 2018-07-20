%%%-------------------------------------------------------------------
%%% @author nitin.yadav
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 19. Jul 2018 12:37
%%%-------------------------------------------------------------------
-module(no_otp).
-author("nitin.yadav").

%% API
-export([start/0, stop/0, get_count/0, say_hello/0]).

-export([init/0]).

-define(SERVER, ?MODULE).

-record(state, {count}).

start() ->
  spawn(?MODULE, init, []).

stop() ->
  ?SERVER ! stop,
  ok.

say_hello() ->
  ?SERVER ! say_hello,
  ok.

get_count() ->
  ?SERVER ! {self(), get_count},
  receive
    {count, Value} -> Value
  end.

init() ->
  register(?SERVER, self()),
  loop(#state{count = 0}).


loop(#state{count=Count}) ->
  receive Msg ->
    case Msg of
      stop ->
        exit(normal);
      say_hello ->
        io:format("Hell0~n");
      {From, get_count} ->
        From ! {count, Count}
    end
  end,
  loop(#state{count=Count+1}).
