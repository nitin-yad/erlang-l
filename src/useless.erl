%%%-------------------------------------------------------------------
%%% @author nitin.yadav
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. Jun 2018 10:22
%%%-------------------------------------------------------------------
-module(useless).
-author("nitin.yadav").

%% API
-export([add/2, hello/0, greet_and_add_two/1]).

add(A, B) ->
  A + B.

hello() ->
  io:format("Hello, world!~n").


greet_and_add_two(X) ->
  hello(),
  add(X,2).
