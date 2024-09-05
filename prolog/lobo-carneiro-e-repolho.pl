rota(Origem, Destino, Caminho) :- rota(Origem, Destino, [Origem], Caminho).

rota(Destino, Destino, Caminho, Caminho).
rota(Origem, Destino, CaminhoAux, Caminho) :-
    pode_ir(Origem, Quem),
    permitido(Quem),
    not(member(Quem, CaminhoAux)),
    rota(Quem, Destino, [Quem|CaminhoAux], Caminho).

oposto(e, d).
oposto(d, e).

% ?- Movendo apenas o Fazendeiro
pode_ir([F, C, L, R], [NF, C, L, R]) :- oposto(F, NF).

% ?- Movendo apenas o Fazendeiro e o Carneiro
pode_ir([FC, FC, L, R], [NFC, NFC, L, R]) :- oposto(FC, NFC).

% ?- Movendo apenas o Fazendeiro e o Lobo
pode_ir([FL, C, FL, R], [NFL, C, NFL, R]) :- oposto(FL, NFL).

% ?- Movendo apenas o Fazendeiro e o Repolho
pode_ir([FR, C, L, FR], [NFR, C, L, NFR]) :- oposto(FR, NFR).

permitido([FC, FC, _, _]).
permitido([X, C, X, X]) :- oposto(C, X).

% ?- rota([e, e, e, e], [d, d, d, d], Caminho).
mostrar_caminho() :- rota([e, e, e, e], [d, d, d, d], Caminho), write(Caminho).

