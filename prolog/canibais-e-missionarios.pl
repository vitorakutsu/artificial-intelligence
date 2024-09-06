% Estado inicial: 3 missionários e 3 canibais no lado esquerdo com o barco.
estado_inicial((3, 3, 1, 0, 0)).

% Estado final: 0 missionários e 0 canibais no lado esquerdo, 3 missionários e 3 canibais no lado direito sem o barco.
estado_final((0, 0, 0, 3, 3)).

% Verifica se o estado é inválido
invalido((M1, C1, _, M2, C2)) :-
    % Verifica se os valores estão fora dos limites (negativos ou mais que 3)
    M1 < 0; C1 < 0; M2 < 0; C2 < 0;
    M1 > 3; C1 > 3; M2 > 3; C2 > 3;
    % Verifica se há mais canibais do que missionários em ambos os lados, exceto quando não há missionários
    (M1 > 0, C1 > M1);
    (M2 > 0, C2 > M2).

% Movimentos possíveis do barco
% Movendo 1 missionário e 1 canibal do lado esquerdo para o direito
pode_ir((M1, C1, 1, M2, C2), (M3, C3, 0, M4, C4), "1 missionário e 1 canibal do lado esquerdo para o direito") :-
    M1 > 0, C1 > 0,
    M3 is M1 - 1, C3 is C1 - 1,
    M4 is M2 + 1, C4 is C2 + 1,
    \+ invalido((M3, C3, 0, M4, C4)).

% Movendo 2 missionários do lado esquerdo para o direito
pode_ir((M1, C1, 1, M2, C2), (M3, C1, 0, M4, C2), "2 missionários do lado esquerdo para o direito") :-
    M1 > 1,
    M3 is M1 - 2, M4 is M2 + 2,
    \+ invalido((M3, C1, 0, M4, C2)).

% Movendo 2 canibais do lado esquerdo para o direito
pode_ir((M1, C1, 1, M2, C2), (M1, C3, 0, M2, C4), "2 canibais do lado esquerdo para o direito") :-
    C1 > 1,
    C3 is C1 - 2, C4 is C2 + 2,
    \+ invalido((M1, C3, 0, M2, C4)).

% Movendo 1 missionário do lado esquerdo para o direito
pode_ir((M1, C1, 1, M2, C2), (M3, C1, 0, M4, C2), "1 missionário do lado esquerdo para o direito") :-
    M1 > 0,
    M3 is M1 - 1, M4 is M2 + 1,
    \+ invalido((M3, C1, 0, M4, C2)).

% Movendo 1 canibal do lado esquerdo para o direito
pode_ir((M1, C1, 1, M2, C2), (M1, C3, 0, M2, C4), "1 canibal do lado esquerdo para o direito") :-
    C1 > 0,
    C3 is C1 - 1, C4 is C2 + 1,
    \+ invalido((M1, C3, 0, M2, C4)).

% Movendo 1 missionário e 1 canibal do lado direito para o esquerdo
pode_ir((M1, C1, 0, M2, C2), (M3, C3, 1, M4, C4), "1 missionário e 1 canibal do lado direito para o esquerdo") :-
    M2 > 0, C2 > 0,
    M3 is M1 + 1, C3 is C1 + 1,
    M4 is M2 - 1, C4 is C2 - 1,
    \+ invalido((M3, C3, 1, M4, C4)).

% Movendo 2 missionários do lado direito para o esquerdo
pode_ir((M1, C1, 0, M2, C2), (M3, C1, 1, M4, C2), "2 missionários do lado direito para o esquerdo") :-
    M2 > 1,
    M3 is M1 + 2, M4 is M2 - 2,
    \+ invalido((M3, C1, 1, M4, C2)).

% Movendo 2 canibais do lado direito para o esquerdo
pode_ir((M1, C1, 0, M2, C2), (M1, C3, 1, M2, C4), "2 canibais do lado direito para o esquerdo") :-
    C2 > 1,
    C3 is C1 + 2, C4 is C2 - 2,
    \+ invalido((M1, C3, 1, M2, C4)).

% Movendo 1 missionário do lado direito para o esquerdo
pode_ir((M1, C1, 0, M2, C2), (M3, C1, 1, M4, C2), "1 missionário do lado direito para o esquerdo") :-
    M2 > 0,
    M3 is M1 + 1, M4 is M2 - 1,
    \+ invalido((M3, C1, 1, M4, C2)).

% Movendo 1 canibal do lado direito para o esquerdo
pode_ir((M1, C1, 0, M2, C2), (M1, C3, 1, M2, C4), "1 canibal do lado direito para o esquerdo") :-
    C2 > 0,
    C3 is C1 + 1, C4 is C2 - 1,
    \+ invalido((M1, C3, 1, M2, C4)).

% Busca em profundidade
% Caso base: o estado atual é o estado final
busca_profundidade(Estado, Caminho, [Estado | Caminho]) :-
    estado_final(Estado).

% Passo recursivo: encontra o próximo estado válido
busca_profundidade(Estado, Caminho, Solucao) :-
    pode_ir(Estado, ProximoEstado, _),
    \+ member(ProximoEstado, Caminho), % Garante que o estado não foi visitado antes
    busca_profundidade(ProximoEstado, [Estado | Caminho], Solucao).

% Função para iniciar a busca em profundidade
iniciar :-
    estado_inicial(EstadoInicial),
    busca_profundidade(EstadoInicial, [], Solucao),
    writeln(Solucao).
