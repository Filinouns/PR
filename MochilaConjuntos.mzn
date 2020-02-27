% Mochila por subconjuntos sin orden

% Enum de objetos
enum Objetos;

% Peso maximo
int: P;
constraint assert(P > 0, "El peso maximo de la mochila debe ser mayor que 0");

%Peso por objetos
array[Objetos] of int: pesos;

% Conjunto de objetos que se cogen
var set of Objetos: sel;

% Funciones
function var int: pesototal(var set of Objetos: s) = sum(o in s)(pesos[o]);
function int: pesototal(set of Objetos: s) = sum(o in s)(pesos[o]);

% ----------------------Constrains-------------------
% Seleccion no supera pesos
constraint pesototal(sel) <= P;

%Obtener optimo en peso
solve maximize pesototal(sel);

output ["seleccion: \(sel); peso: \(pesototal(sel)) \n"];