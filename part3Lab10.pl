% same(List1,List2)
% are the two lists the same?
same([],[]).												%Two empty lists
same([X|Xs],[X|Ys]):- same(Xs,Ys).	%Two lists with same head: keep checking the tail

% all_bigger(List1,List2)
% all elements in List1 are bigger than those in List2, 1 by 1
% example: all_bigger([10,20,30,40],[9,19,29,39]).
all_bigger([],[]).																			%Two empty lists
all_bigger([H|T],[H1|T1]) :- H > H1, all_bigger(T, T1).	%Head is bigger than the other: keep checking tail

% sublist(List1,List2)
% List1 should be a subset of List2
% example: sublist([1,2],[5,3,2,1]).
search(X,[X|_]).								%Element is the head
search(X,[_|Xs]):-search(X,Xs).	%Element is not the head

sublist([],[]).																				%Both empty list
sublist([H],[H]).																			%Case list with one element
sublist([],[_]).																			%Only first list is emprty
sublist([X|Xs],L2) :- search(X, L2), sublist(Xs, L2).	%First search the head, if yes, do the same with the tail