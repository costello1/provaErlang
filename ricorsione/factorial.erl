-module(factorial).
-export([factorial/1]).

% 3! = 3 * 2 * 1 = 6
% 4! = 4 * 3 * 2 * 1 =

% 0 = 1
% 1 = 1
% 2 = 2 * 1 = 2
% 3 = 3 * 2 * 1 = 6

factorial(0) -> 1;
factorial(1) -> 1;
factorial(N) -> N * factorial(N - 1).