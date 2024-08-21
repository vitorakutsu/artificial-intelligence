% ==================================
%              Fatos               #
% ==================================
bonita(ursula).

bonito(norberto).
bonito(pierre).

rico(norberto).

rica(berta).

forte(berta).
forte(pierre).
forte(bruno).

amavel(bruno).

% ==================================
%              Regras              #
% ==================================
homem(norberto).
homem(pierre).
homem(bruno).

mulher(ursula).
mulher(berta).

% ==================================
%  Regras para gostar e felicidade #
% ==================================

% =============================================
%  Todos os homens gostam de mulheres bonitas #
% =============================================
gosta(Homem, Mulher) :-
    homem(Homem),
    bonita(Mulher).

% ===============================================
%  Berta gosta de qualquer homem que gosta dela #
% ===============================================
gosta(berta, Homem) :-
    gosta(Homem, berta).

% =====================================================
%  Úrsula gosta de qualquer homem que gosta dela,     #
%  contando que ele seja rico, amável, bonito e forte #
% =====================================================
gosta(ursula, Homem) :-
    gosta(Homem, ursula),
    rico(Homem),
    amavel(Homem),
    bonito(Homem),
    forte(Homem).

% ====================================
%  Todos os homens ricos são felizes #
% ====================================
feliz(Homem) :-
    homem(Homem),
    rico(Homem).

% ===================================================
%  Qualquer homem que gosta de uma mulher que gosta #
%  dele é feliz                                     #
% ===================================================
feliz(Homem) :-
    homem(Homem),
    gosta(Homem, Mulher),
    gosta(Mulher, Homem).

% ===================================================
%  Qualquer mulher que gosta de uma homem que gosta #
%  dela é feliz                                     #
% ===================================================
feliz(Mulher) :-
    mulher(Mulher),
    gosta(Mulher, Homem),
    gosta(Homem, Mulher).
