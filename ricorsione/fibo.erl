-module(fibo).
-export([fibonacci/1]).

% fibonacci(0) = 0
% fibonacci(1) = 1
% fibonacci(2) = fibonacci(1) + fibonacci(0) = 1
% fibonacci(3) = fibonacci(2) + fibonacci(1) = 2
% 3
% 4
% 5

fibonacci(0) -> 0;
fibonacci(1) -> 1;
fibonacci(N) ->
    fibonacci(N-1) + fibonacci(N -2).
