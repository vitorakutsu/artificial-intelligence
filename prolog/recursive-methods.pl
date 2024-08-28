size([], 0).
size([_|Tail], S) :- size(Tail, AuxS), S is AuxS + 1.

bigger([X], X).
bigger([X|Tail], B) :- bigger(Tail, AuxB), ((AuxB > X, B = AuxB); (AuxB =< X, B = X)).

smaller([X], X).
smaller([X|Tail], B) :- smaller(Tail, AuxB), ((AuxB < X, B = AuxB); (AuxB >= X, B = X)).

median([X], X).
median([X, Y], Median) :- Median is (X + Y) / 2.
median([_|Tail], Median) :-
    append(Init, [_], Tail),
    median(Init, Median). 

index([X|_], 0, X).
index([_|Tail], Index, Elem) :- 
	Index > 0,
    NewIndex is Index - 1,
    index(Tail, NewIndex, Elem).

remove([], _, []).
remove([X|Tail], X, Result) :- 
    remove(Tail, X, Result).
remove([Head|Tail], X, [Head|Result]) :- 
    Head \= X,
    remove(Tail, X, Result).

concatenate([], List, List).
concatenate(List, [], List).
concatenate([Head|Tail], SecondList, [Head|Result]) :-
    concatenate(Tail, SecondList, Result).

invert([], []).
invert([Head|Tail], InvertedList) :-
    invert(Tail, InvertedTail),
    append(InvertedTail, [Head], InvertedList).