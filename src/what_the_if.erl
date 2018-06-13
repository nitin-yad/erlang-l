%%%-------------------------------------------------------------------
%%% @author nitin.yadav
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. Jun 2018 10:50
%%%-------------------------------------------------------------------
-module(what_the_if).
-author("nitin.yadav").

%% API
-export([heh_fine/0]).

%% ; is like orelse
%% , is like andelse

heh_fine() ->
  if 1 =:= 1 ->
    works
  end,
  if 1 =:= 2; 1 =:= 1 ->
    works
  end,
  if 1 =:= 2, 1 =:= 1 ->
    fails
  end.

%% in above function the line 25 will never match because
%% its only gaurd evaluates to false

