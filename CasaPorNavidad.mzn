% NO ESTA PARA NADA TERMINADO



% Adornando la casa por navidad

% Numero de adornos que se quieren comprar
int: N;
constraint assert (N > 0, "El numero de adornos debe ser mayor que 0");
constraint assert (N < 31, "El numero de adornos debe ser menor que 31");

% Presupuesto
int: P;

% Coste y superficie por objeto
array [1..N, 1..2] of int: objects;

% Array a completar con el coste y la superficie que ocupa un objeto seleccionado
array [1..N, 1..2] of var 0..10000: superficie;

var int: S;

%------------------------------------
% Constraint para usar los objetos que se nos dan
constraint sum(i in 1..N) (bool2int(objects[i, 1] = superficie[i, 1]) ) = 1;

constraint sum(i in 1..N) (bool2int(objects[i, 2] = superficie[i, 2]) ) = 1;

% Constraint superficie
constraint S = sum(i in 1..N)(superficie[i, 2]);

% Constraint para no pasarnos del presupuesto
constraint P <= sum(i in 1..N)(superficie[i, 1]);

solve maximize S;