:-  use_module(library(clpfd)).

emily(Events) :- 
    Events = [A,B,C,D,E,F,G,H,I,J,K,L,M,N],
    Events ins 1842..1924,		%setting minimum to 1850 creates conflict
%    A #= 1923,
    A - B #>= 10,
    C #= 1894,
    D - C #>= 10, D - C #=< 20, 
    D - E #>= 8,  D - E #=< 10, 
    F #> C,
    D - F #>= 9,  D - F #=< 10, 	%original: strict inequalities (b/c real #s)
    D - G #= 30, 
    B #>= D, B #>= E, 
    G - H #= 2, 
    I #>= H,				%original: strict inequality
    I - K #> 30, 
    J #> I,				%inequality is definitely strict
    G #>= J, G #=< J + 1,		%original: G - J #< 0.5, G #> J
    L #>= J, L #=< J + 1,		%original: L - J #< 0.5
    A - K #= 74,
    M #>= L,				%original: strict inequality
    E - N #>= 6, E - N #=< 7,
%   E #= B, 				/*This constraint inserts a conflict*/ 
    N - K #=< 45, 
    N - K #>= 38, 
    C #>= N, C #=< E,
    M #< N, 
    A #> E, A #> K.

%emily([A,B,C,D,E,F,G,H,I,J,K,L,M,N]).
%Events=[A,B,C,D,E,F,G,H,I,J,K,L,M,N], emily(Events), label(Events).	%enumerates possible years