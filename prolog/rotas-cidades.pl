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

pode_ir(Origem, Destino, Distancia) :- ligacao(Origem, Destino, Distancia) ; ligacao(Destino, Origem, Distancia).

busca(Origem, Destino) :- ligacao(Origem, Destino).
busca(Origem, Destino) :- ligacao(Origem, Distancia), busca(Distancia, Destino).

busca2(Origem, Destino, [Origem, Destino]):- ligacao(Origem, Destino).
busca2(Origem, Destino, Caminho) :- ligacao(Origem, Distancia), busca2(Distancia, Destino, CaminhoAux), Caminho = [Origem | CaminhoAux].

dfs(Origem, Destino, Caminho, DistanciaTotal) :- rota(Origem, Destino, [Origem], Caminho, 0, DistanciaTotal).

rota(Origem, Origem, Caminho, Caminho, DistanciaTotal, DistanciaTotal).
rota(Origem, Destino, Visitados, Caminho, DistanciaAux, DistanciaTotal):-
    pode_ir(Origem, V, Distancia),
    NovaDistancia is DistanciaAux + Distancia,
    not(member(V, Visitados)),
    rota(V, Destino, [V | Visitados], Caminho, NovaDistancia, DistanciaTotal).

% MENOR DISTÂNCIA ENTRE DUAS CIDADES
menor_distancia(Origem, Destino, Caminho, DistanciaTotal) :- findall(Distancia, dfs(Origem, Destino, Caminho, Distancia), Distancias), min_list(Distancias, DistanciaTotal).

% findall([Caminho,DistanciaTotal],dfs(presidente_prudente,sao_paulo,Caminho,DistanciaTotal),Caminhos)