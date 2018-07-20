%%%-------------------------------------------------------------------
%%% @author nitin.yadav
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 19. Jul 2018 14:31
%%%-------------------------------------------------------------------
-module(sup).
-author("nitin.yadav").

%% API
-export([start_server/0]).

-export([supervise/0]).

start_server() ->
  spawn(?MODULE, supervise, []).

supervise() ->
  process_flag(trap_exit, true),
  Pid = no_otp:start(),
  link(Pid),
  receive {'EXIT', Pid, Reason} ->
    case Reason of
      normal ->
        ok;
      _Other ->
        start_server()
    end
  end.