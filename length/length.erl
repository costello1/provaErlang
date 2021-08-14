% Meters To Yars
% Meters to Inches
% Meters To Feet

-module(length). % length.beam
-export([convert_meters/1]).

-define(YARD, 1.0936).
-define(INCH, 39.370).
-define(FOOT, 3.28).

% head(arg1, arg2, ...) -> body.

% head() ->
    % clause1;
    % clause2;
    % clause3.

% length:convert_meters({yard, 3}).
% First clause
convert_meters({yard, Meters}) ->
    Meters * ?YARD;
%lenth:convert_meters({inch, 2}).
% Second clause
convert_meters({inch, Meters}) ->
    Meters * ?INCH;
%length:convert_meters({foot, 10}).
% third clasue
convert_meters({foot, Meters}) ->
    Meters * ?FOOT.