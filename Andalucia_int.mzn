% Ejercicio de coloreado de mapas con enteros
% Colouring ANDALUCIA using colours

int: nc = 3;

var 1..nc: hu;
var 1..nc: se;  var 1..nc: co;  var 1..nc: ja;
var 1..nc: al;  var 1..nc: ma;  var 1..nc: gr;  var 1..nc: ca;

constraint hu != se;
constraint hu != ca;
constraint se != co;
constraint se != ma;
constraint ca != ma;
constraint ma != gr;
constraint co != gr;
constraint co != ja;
constraint ja != gr;
constraint al != gr;
constraint se != ca;

%constraint hu != 3;