%Sudoku de NxN
% N = n + 1

int: n = 3;

int: nn = n*n;

set of int: N = 0..8;

array[N, N] of var 1..nn: sudoku;

%condition on rows
constraint forall (i in N, j in N, k in j+1..nn)
           (sudoku[i, j] != sudoku[i, k]);
           
%condition on cols
constraint forall (i in N, j in N, k in i+1..nn)
           (sudoku[i, j] != sudoku[k, j]);
            
% Condition on squares
constraint forall(c, a in N, i, i1 in c*n, j, j1 in a*n where(i != i1 \/ j != j1))
            (sudoku[i, j] != sudoku[i1, j1]);

% Condiciones iniciales
constraint sudoku[0, 1] = 3;
constraint sudoku[0, 2] = 4;
constraint sudoku[1, 3] = 2;
constraint sudoku[2, 0] = 1;
constraint sudoku[2, 3] = 3;
constraint sudoku[3, 1] = 2;
constraint sudoku[3, 2] = 1;
              
%Solve                      
solve satisfy;

output ["\(sudoku[i, j])" ++
      if j == 3 then "\n" else " " endif |
      i in 0..3, j in 0..3
];