%%%-------------------------------------------------------------------
%%% @author nitin.yadav
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. Jun 2018 10:23
%%%-------------------------------------------------------------------
-module(functions).
-author("nitin.yadav").

%% API
-export([head/1, second/1, same/2]).

head([H|_]) -> H.

second([_,S|_]) -> S.

same(X, X) -> true;
same(_, _) -> false.

%% Guards are additional clauses that can go in a function's head
%% to make pattern matching more expressive.

