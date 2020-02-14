% Sumar SEND + MORE = MONEY

include "alldifferent.mzn";

var 1..9: S;
var 0..9: E;
var 0..9: N;
var 0..9: D;
var 1..9: M;
var 0..9: O;
var 0..9: R;
var 0..9: Y;

constraint 10000 * M + 1000 * O + 100 * N + 10 * E + Y = 
            1000 * (S + M) + 100 * (E + O) + 10 * (N + R) + D + E;
            
%constraint M = 1;
            
%constraint S != 9;
%constraint N != 6;

constraint alldifferent([S, E, N, D, M, O, R, Y]);