% # ==================================================================================
% # Representação de Conhecimento – Red Bull Air Race
% 1. Lamb, Besenyei, Chambliss, MacLean, Mangold, Jones e Bonhomme são pilotos.
% 2. Lamb é da equipe Breitling, Besenyei e Chambliss da Red Bull, MacLean da Mediterranean Racing Team, Mangold da Cobra, Jones e Bonhomme da Matador.
% 3. O avião de Lamb é um MX2 e o de Besenyei, Chambliss, MacLean, Mangold, Jones e Bonhomme é um Edge540.
% 4. Istanbul, Budapest e Porto são circuitos.
% 5. Jones venceu no Porto, Mangold venceu em Budapest e em Istanbul.
% 6. Istanbul tem 9 gates, Budapest tem 6 gates e Porto tem 5 gates.
% 7. Uma equipe ganha uma corrida quando um dos seus pilotos vence essa corrida.
% 
% # ============================================
% # Escreva as seguintes perguntas em Prolog:
% a) Quem venceu a corrida no Porto?
% b) Qual equipe ganhou no Porto?
% c) Quais pilotos venceram mais de um circuito?
% d) Quais circuitos têm mais de 8 gates?
% e) Quais pilotos não pilotam um Edge540?


% Pilotos
piloto(lamb).
piloto(besenyei).
piloto(chambliss).
piloto(maclean).
piloto(mangold).
piloto(jones).
piloto(bonhomme).

% Equipes
equipe(lamb, breitling).
equipe(besenyei, red_bull).
equipe(chambliss, red_bull).
equipe(maclean, mediterranean_racing_team).
equipe(mangold, cobra).
equipe(jones, matador).
equipe(bonhomme, matador).

% Aviões
aviao(lamb, mx2).
aviao(besenyei, edge540).
aviao(chambliss, edge540).
aviao(maclean, edge540).
aviao(mangold, edge540).
aviao(jones, edge540).
aviao(bonhomme, edge540).

% Circuitos
circuito(istanbul).
circuito(budapest).
circuito(porto).

% Gates nos circuitos
gates(istanbul, 9).
gates(budapest, 6).
gates(porto, 5).

% Vencedores das corridas
venceu(jones, porto).
venceu(mangold, budapest).
venceu(mangold, istanbul).

% Quem ganhou
ganhou_equipe(Equipe, Circuito) :-
    venceu(Piloto, Circuito),
    equipe(Piloto, Equipe).

