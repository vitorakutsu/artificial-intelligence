% LIGAÇÕES DE PRESIDENTE PRUDENTE PARA OUTRAS CIDADES
ligacao(presidente_prudente, marilia, 179).
ligacao(presidente_prudente, assis, 127).

% LIGAÇÕES DE MARILIA PARA OUTRAS CIDADES
ligacao(marilia, assis, 75). 
ligacao(marilia, bauru, 103).  

% LIGAÇÕES DE ASSIS PARA OUTRAS CIDADES
ligacao(assis, ourinhos, 75).

% LIGAÇÕES DE BAURU PARA OUTRAS CIDADES
ligacao(bauru, sao_carlos, 155).

% LIGAÇÕES DE OURINHOS PARA OUTRAS CIDADES
ligacao(ourinhos, bauru, 119).
ligacao(ourinhos, sao_paulo, 337).
ligacao(ourinhos, sorocaba, 291).

% LIGAÇÕES DE SAO CARLOS PARA OUTRAS CIDADES
ligacao(sao_carlos, campinas, 141).

% LIGAÇÕES DE CAMPINAS PARA OUTRAS CIDADES
ligacao(campinas, sao_paulo, 98).

% LIGAÇÕES DE SOROCABA PARA OUTRAS CIDADES
ligacao(sorocaba, sao_paulo, 100).

% LIGAÇÕES DE SAO PAULO PARA OUTRAS CIDADES
ligacao(sao_paulo, santos, 71).

caminhos(Origem, Destino, Caminho, DistanciaTotal) :- 
    busca_caminho(Origem, Destino, [Origem], CaminhoInvertido, DistanciaTotal),
    reverse(CaminhoInvertido, Caminho).

busca_caminho(Destino, Destino, Caminho, Caminho, 0).
busca_caminho(Origem, Destino, Visitados, Caminho, DistanciaTotal) :-
    ligacao(Origem, ProximaCidade, Distancia),
    \+ member(ProximaCidade, Visitados),
    busca_caminho(ProximaCidade, Destino, [ProximaCidade | Visitados], Caminho, DistanciaRestante),
    DistanciaTotal is Distancia + DistanciaRestante.

menor_distancia(Origem, Destino, MelhorCaminho, MenorDistancia) :-
    setof(Distancia-Caminho, caminhos(Origem, Destino, Caminho, Distancia), 
    [MenorDistancia-MelhorCaminho|_]).

coletar_caminhos(Origem, Destino, Caminhos) :-
    findall((Caminho, Distancia), caminhos(Origem, Destino, Caminho, Distancia), Caminhos).
