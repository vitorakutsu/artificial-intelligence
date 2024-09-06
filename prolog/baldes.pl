% X -> 4 litros
% Y -> 3 litros

parar((2, _)).

baldes((X, Y), (0, Y), "Esvazia balde de 4 litros") :- X > 0.
baldes((X, Y), (X, 0), "Esvazia balde de 3 litros") :- Y > 0.
baldes((X, Y), (4, Y), "Enche balde de 4 litros") :- X < 4.
baldes((X, Y), (X, 3), "Enche balde de 3 litros") :- Y < 3.
baldes((X, Y), (X2, Y2), "Despeja água do balde de 3 litros para o de 4 litros") :-
    X + Y >= 4,
    X2 is 4,
    Y2 is Y - (4 - X).
baldes((X, Y), (X2, Y2), "Despeja água do balde de 4 litros para o de 3 litros") :-
    X + Y >= 3,
    X2 is X - (3 - Y),
    Y2 is 3.
baldes((X, Y), (X2, Y2), "Transfere água do balde de 3 litros para o de 4 litros") :-
    X + Y =< 4,
    X2 is X + Y,
    Y2 is 0.
baldes((X, Y), (X2, Y2), "Transfere água do balde de 4 litros para o de 3 litros") :-
    X + Y =< 3,
    X2 is 0,
    Y2 is X + Y.

resolver(EstadoInicial, Solucao) :- busca([EstadoInicial], Solucao).
busca([Estado | Caminho], [Estado]) :- parar(Estado).
busca([Estado | Caminho], [Estado | Solucao]) :-
    baldes(Estado, ProximoEstado, _),
    \+ member(ProximoEstado, [Estado | Caminho]),
    busca([ProximoEstado, Estado | Caminho], Solucao).

% ?- resolver((0, 0), Solucao).
iniciar :- 
    resolver((0,0), Solucao),
    writeln(Solucao).
