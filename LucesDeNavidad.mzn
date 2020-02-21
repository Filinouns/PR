% Problema de las Luces de Navidad

% Longitud de la tira de bombillas
int: L;
constraint assert ( L > 0, "La longitud de la tira debe ser mayor que 0");

% Numero de tipo de bombillas
int: N;
constraint assert ( N > 0, "El numero de tipos de bombillas debe ser mayor que 0");

% Cantidad de bombillas de cada tipo
array[1..N] of int: amount;
constraint assert ( forall(i in 1..N) (amount[i] > 0), "La cantidad de elementos por tipo de bombilla debe ser mayor que 0");

% Consumo maximo soportado por la tira
int: C;
constraint assert ( C > 0, "El consumo maximo de la tira debe ser mayor que 0");

% Consumo de cada bombilla
array[1..N] of int: consum;
constraint assert ( forall(i in 1..N) (consum[i] > 0), "El consumo de cada tipo de bombilla debe ser mayor que 0");

% Array para representar la tira de bombillas
array[1..L] of var 1..N: tira;

% Constraint no mas de 2 seguidas del mismo color
constraint forall(i in 1..L-2) ( (tira[i] != tira[i+1]) \/ (tira[i] != tira[i+2]) ); 

% Constraint la suma de las demas debe ser mayor o menor en 1 unidad, como mucho, que la cantidad de bombillas del tipo que se esta mirando
constraint forall(i in 1..L) (forall(k in 1..N) ( ((sum(j in 1..i) (bool2int (tira[j] = k)) ) * 2) <= i + 1 ) );

% Constraint no usar mas bombillas de las que tenemos de cada tipo
constraint forall(i in 1..N) ( sum(j in 1..L) (bool2int (tira[j] = i)) <= amount[i] );

% Constraint no pasarse del consumo maximo de la tira
constraint sum(i in 1..L ) ( consum[tira[i]] ) <= C;

% SATISFY
solve satisfy;
