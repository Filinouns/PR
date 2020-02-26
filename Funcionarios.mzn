% Funcionarios

% Cantidad de funcionarios y trabajos
int: N;
constraint assert (N > 0, "N debe ser mayor 0");

% Tiempo que tarda cada funcionario en cada tarea
array[1..N, 1..N] of int: costeF;
constraint assert (forall(i in 1..N)( forall (j in 1..N) (costeF[i, j] <= 10000 /\ costeF[i, j] >= 1)) , "El coste de una tarea para cada funcionario debe estar comprendido entre 1 y 10.000");

% Array a completar con el tiempo minimo de cada uno por tarea
array[1..N] of var 1..10000: mCost;

var int: lCost;

% Constraint usar uno de los costes de los funcionarios
constraint forall(i in 1..N)( sum(j in 1..N) (bool2int( mCost[i] = costeF[i, j] ) ) = 1);

% Constraint no puede poner el mismo trabajo a 2 funcionarios
constraint forall(t in 1..N) (sum(f in 1..N) ( bool2int( costeF[f, t] = mCost[f] ) ) = 1 );

% Constraint valor del lowCost
constraint lCost = sum(i in 1..N) (mCost[i]);

solve minimize sum(i in 1..N) (mCost[i]);

output ["\(lCost)"];