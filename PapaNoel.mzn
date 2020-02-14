% Problema del PapaNoel que reparte juguetes
par int: n_ninos;
par int: n_toys;
par int: min_sat;

% Tipos de juguetes
array [int] of int: toy_type;

% Cantidad de cada juguete
array [int] of int: toy_amount;

% Lo que le gusta a los niños de merde
array [int, int] of int: kids_satis;

%Array k tenemos k completar bro :)
array [0..(n_ninos*2)-1] of var 1..n_toys: kids_toy;

% Constraint juguetes diferentes de cada niño
constraint forall (i in 0..n_ninos-1) (kids_toy[i*2] != kids_toy[(i*2)+1]);

% Constraint tiene que tener mayor satisfaccion que la que pide el niño
constraint forall (i in 0..n_ninos-1) ( (kids_satis[i + 1, kids_toy[i*2]] + 
                                         kids_satis[i + 1, kids_toy[(i*2)+1]]) >= 
                                         min_sat );
                                        
% Constraint cantidad de cada juguete
constraint forall ()


solve satisfy;
