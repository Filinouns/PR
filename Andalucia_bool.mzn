% Ejercicio de coloreado de mapas con booleanos (SAT)
% Colouring ANDALUCIA using colours

var bool: hu0;  var bool: hu1;  var bool: hu2;
var bool: se0;  var bool: se1;  var bool: se2;
var bool: co0;  var bool: co1;  var bool: co2;
var bool: ja0;  var bool: ja1;  var bool: ja2;
var bool: al0;  var bool: al1;  var bool: al2;
var bool: ma0;  var bool: ma1;  var bool: ma2;
var bool: gr0;  var bool: gr1;  var bool: gr2;
var bool: ca0;  var bool: ca1;  var bool: ca2;

%Cada uno tiene un color
constraint hu0 \/ hu1 \/ hu2;
constraint se0 \/ se1 \/ se2;
constraint co0 \/ co1 \/ co2;
constraint ja0 \/ ja1 \/ ja2;
constraint al0 \/ al1 \/ al2;
constraint ma0 \/ ma1 \/ ma2;
constraint gr0 \/ gr1 \/ gr2;
constraint ca0 \/ ca1 \/ ca2;

% No puede tener mas de 1
constraint not hu0 \/ not hu1;
constraint not hu0 \/ not hu2;
constraint not hu2 \/ not hu1;

constraint not se0 \/ not se1;
constraint not se0 \/ not se2;
constraint not se2 \/ not se1;

constraint not co0 \/ not co1;
constraint not co0 \/ not co2;
constraint not co2 \/ not co1;

constraint not ja0 \/ not ja1;
constraint not ja0 \/ not ja2;
constraint not ja2 \/ not ja1;

constraint not al0 \/ not al1;
constraint not al0 \/ not al2;
constraint not al2 \/ not al1;

constraint not ma0 \/ not ma1;
constraint not ma0 \/ not ma2;
constraint not ma2 \/ not ma1;

constraint not gr0 \/ not gr1;
constraint not gr0 \/ not gr2;
constraint not gr2 \/ not gr1;

constraint not ca0 \/ not ca1;
constraint not ca0 \/ not ca2;
constraint not ca2 \/ not ca1;

%//-----------
%huelva
constraint not hu0 \/ not se0;
constraint not hu1 \/ not se1;
constraint not hu2 \/ not se2;

constraint not hu0 \/ not ca0;
constraint not hu1 \/ not ca1;
constraint not hu2 \/ not ca2;

%sevilla
constraint not se0 \/ not co0;
constraint not se1 \/ not co1;
constraint not se2 \/ not co2;

constraint not se0 \/ not ma0;
constraint not se1 \/ not ma1;
constraint not se2 \/ not ma2;

constraint not se0 \/ not ca0;
constraint not se1 \/ not ca1;
constraint not se2 \/ not ca2;

%cadiz
constraint not ca0 \/ not ma0;
constraint not ca1 \/ not ma1;
constraint not ca2 \/ not ma2;

%cordoba
constraint not co0 \/ not ma0;
constraint not co1 \/ not ma1;
constraint not co2 \/ not ma2;

constraint not co0 \/ not gr0;
constraint not co1 \/ not gr1;
constraint not co2 \/ not gr2;

constraint not co0 \/ not ja0;
constraint not co1 \/ not ja1;
constraint not co2 \/ not ja2;

%jaen
constraint not ja0 \/ not gr0;
constraint not ja1 \/ not gr1;
constraint not ja2 \/ not gr2;

%almeria
constraint not al0 \/ not gr0;
constraint not al1 \/ not gr1;
constraint not al2 \/ not gr2;

%output
output ["hu: " ++show(if hu0 then rojo elseif hu1 then azul else amarillo endif) ++"\t",
        "se: " ++show(if se0 then rojo elseif se1 then azul else amarillo endif) ++"\t",
        "co: " ++show(if co0 then rojo elseif co1 then azul else amarillo endif) ++"\t",
        ];
