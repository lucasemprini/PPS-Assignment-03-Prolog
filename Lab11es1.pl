% 1.0 dropAny(?Elem,?List,?OutList)
dropAny(X,[X|T],T).												%Case the elem is the head of the list.
dropAny(X,[H|Xs],[H|L]):-dropAny(X,Xs,L).	%Case the elem is not the head of the list.

% 1.1.1 dropFirst
dropFirst(X,[X|T],T):-!.											%Case the elem is the hed of the list: Here the difference is we use Cut.
dropFirst(X,[H|Xs],[H|L]):-dropFirst(X,Xs,L).	%Case the elem is not the head of the list.

% My search taken from part1Lab10:
search(H,[H|_]).
search(X,[_|T]):-search(X,T).

% 1.1.2 dropLast
dropLast(X,[H|T],[H|L]):-search(X,T),!,dropLast(X,T,L).	%Case the elem is not the head of the list.
dropLast(X,[X|T],T).																		%Case the elem is the head of the list.

% 1.1.3 dropAll(X,[H|T],[H|L]):-search(X,T),!,dropAll(X,T,L).
dropAll(_, [], []).													%Case the list is empty
dropAll(X,[X|T],List):-!,dropAll(X,T,List).	%Case the elem to drop is the first one.
dropAll(X,[H|Xs],[H|L]):-!,dropAll(X,Xs,L). %Case the elem to drop is not the first one.