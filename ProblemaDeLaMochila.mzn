% Problema de la mochila, ordenando en un array y diferenciando entre cogidos y no cogidos
% Hay un error

% Peso maximo
int: P;
constraint assert(P > 0, "El peso maximo de la mochila debe ser mayor que 0");

% Objetos a cargar
enum Objetos;

% Peso por objeto
array[Objetos] of int: pesos;
constraint assert (forall(i in Objetos) (pesos[i] > 0), "El peso de los objetos debe ser mayor que 0")

% Seleccion de objetos
% El parametro "opt" hace que los valores de los objetos sea o null o encapsulacion del valor.
array[1..card(Objetos)] of var opt Objetos: sel;

% Funcion para sumar el valor de los pesos de una solucion
function var int: suma(array[int] of opt Objetos: s) = sum (o in s where occurs(o)) (pesos[deopt(o)]);
% "occurs" implica que tiene algo dentro
% "deopt" es desencapsular el valor
function int: suma(array[int] of opt Objetos: s) = sum(o in s where occurs(o))(pesos[deopt(o)]);

% -------------------------------------------------------------
% Constrains

% Si alguno es vacio, todos los que van detras son vacios
constraint forall(i in card(Objetos)-1)(absent(sel[i]) -> absent(sel[i+1]));

% Seleccion de ordenada por pesos de mayor a menor
constraint forall(i in 1..card(Objects)-1 where occurs(sel[i]) /\ occurs(sel[i+1])) 
(pesos[deopt(sel[i])] >= pesos[deopt(sel[i+1])]);

% Sin repeticion
constraint forall(i in 1..card(Objects)-1 where occurs(sel[i]) /\ occurs(sel[i+1]))
(pesos[deopt(sel[i])] = pesos[deopt(sel[i+1])] -> deopt(sel[i]) < deopt(sel[i+1]));
% Si se ordenan por pesos de mayor a menor y se colocan dos iguales seguidos,
% este constraint les obliga a colocarse al reves lo cual es imposible.

% Constraint no pasarse del peso maximo de la mochila
constraint suma(sel) <= P;

% Obtener optimo en peso
solve maximize suma(sel);

output ["seleccion: \(sel); peso: \(suma(sel)) \n"];



