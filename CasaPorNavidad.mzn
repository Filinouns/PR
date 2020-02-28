% Adornando la casa por navidad

% Numero de adornos que se quieren comprar
int: N;
constraint assert (N > 0, "El numero de adornos debe ser mayor que 0");
constraint assert (N < 31, "El numero de adornos debe ser menor que 31");

% Presupuesto
int: P;

% Objetos
enum Objetos;

% Coste y superficie por objeto
array [Objetos, 1..2] of int: objects;

% Array a completar con el coste y la superficie que ocupa un objeto seleccionado
%array [, 1..2] of var 0..10000: superficie;
%array[1..card(Objetos), 1..2] of var opt Objetos: sel;
var set of Objetos: sel;

% ---------------------Funciones-------------------------
% Coste
function var int: costetotal(var set of Objetos: s) = sum(o in s)(objects[o, 1]);
function int: costetotal(set of Objetos: s) = sum(o in s)(objects[o, 1]);
% Superficie
function var int: superficietotal(var set of Objetos: s) = sum(o in s)(objects[o, 2]);
function int: superficietotal(set of Objetos: s) = sum(o in s)(objects[o, 2]);

%--------------------Constraints---------------------------
% Constraint para no pasarnos del presupuesto
constraint costetotal(sel) <= P;

solve maximize superficietotal(sel);

output ["superficie: \(superficietotal(sel)); \n"]