%Torres de colores -> 0 azul / 1 rojo / 2 verde
par int: altura;
enum Colors = {azul, rojo, verde};
array [Colors] of int: disp;
%[3, 5, 3]

% Colores que no pueden tener dos consecutivos
set of Colors: no2consec;

int: c = card(Colors);

% Primera pieza
Colors: prim;

%torre de colores
array [0..altura - 1] of var Colors: torre;

% No dos colores consecutivos
constraint forall (j in no2consec, i in 0..altura-2)(torre[i] = j -> torre[i + 1] != j);

% Piezas azules >= piezas verdes (en todo momento)
constraint forall (i in 0..altura-1) (( sum (j in 0..i) ( bool2int (torre[j] = azul) )) >= 
        ( sum (j in 0..i) ( bool2int(torre[j] = verde) )));

% No mas del numero de bloques que hay en cada tipo
constraint forall(c in Colors) (sum(i in 0..altura-1) (bool2int(torre[i] = c)) <= disp[c]);

%constront forall(j in 0..2)((sum (i in 0..9)(bool2int(torre[i] = j))) <= ?);

% No nas de 3 seguidos iguales

% Piezas rojas >= Piezas azules + Piezas verdes
constraint ( sum (i in 0..altura-1 where (torre[i] = rojo)) ( 1 )) >=
           ( sum (i in 0..altura-1 ) ( bool2int(torre[i] = azul \/ torre[i] = verde) ));
      
% Primera pieza
constraint torre[0] = prim;

%Obtener solucion
%solve minimize (sum (i in 0..altura-1 where (torre[i] = verde)) (1));
solve satisfy;

output ["\(altura-1-i) : \(torre[altura-1-i]);\n" | i in 0..altura - 1];

