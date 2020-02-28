% Escuchando Musica

% Numero de canciones
int: N;

% Tiempo viaje ida
int: T1;
% Tiempo viaje vuelta
int: T2;

enum Songs;

% Duracion y satisfaccion de la cancion
array[Songs, 1..2] of int: Canciones;

% Conjuntos de canciones elegidas en cada viaje
var set of Songs: sel1;
var set of Songs: sel2;

% --------------- Funciones ------------------
% Satisfaccion
function var int: satisfaction(var set of Songs: s) = sum(o in s)(Canciones[o, 2]);
function int: satisfaction(set of Songs: s) = sum(o in s)(Canciones[o, 2]);
% Tiempo
function var int: tiempo(var set of Songs: s) = sum(o in s)(Canciones[o, 1]);
% Suma de las satisfacciones
function var int: totalSat(var set of Songs: s1, var set of Songs: s2) = satisfaction(s1) + satisfaction(s2);
function int: totalSat(set of Songs: s1, set of Songs: s2) = satisfaction(s1) + satisfaction(s2);

% --------------- Constraints -----------------
% Que no haya la misma cancion a la ida que a la vuelta
constraint forall(o in sel1) (forall(s in sel2) (o != s));
%constraint alldifferent();

% Las canciones elegidas deben durar lo mismo que el viaje
constraint tiempo(sel1) = T1;
constraint tiempo(sel2) = T2;

solve maximize totalSat(sel1, sel2);

output ["Satisfaccion Total: \(totalSat(sel1, sel2)); \n"];