% 2.1 fromList(+List,-Graph)
fromList([_],[]).
fromList([H1,H2|T],[e(H1,H2)|L]):- fromList([H2|T],L).

% 2.2 fromCircList(+List,-Graph)lastElem([H], H).

fromCircList([H|T], G) :- fromCircList([H|T], H, G).																% I need to save the first element.
fromCircList([X], First, [e(X, First)]).																						% Case with 1 element only.
fromCircList([H1, H2|T], First, [e(H1, H2)|L]) :- fromCircList([H2|T], First, L).		% Case with multiple elements.

% 2.3 dropNode(+Graph, +Node, -OutGraph)
% drop all edges starting and leaving from a Node
% use dropAll defined in 1.1

% My dropAll defined in Lab11es1.pl
% I don't want to change arguments order so
% I will need to change order of dropNode arguments into dropAll.
dropAll(_, [], []).
dropAll(X,[X|T],List):-!,dropAll(X,T,List).
dropAll(X,[H|Xs],[H|L]):-!,dropAll(X,Xs,L).

dropNode(Graph, Node, Graph):-	dropAll(e(_,Node),Graph,Graph),
																dropAll(e(Node,_),Graph,Graph),!.

dropNode(G, N, O):- dropAll(e(_ ,N), G, G2),
  									dropAll(e(N, _), G2, G3),
  									dropNode(G3, N, O).

% 2.4 reaching(+Graph, +Node, -List)
% all the nodes that can be reached in 1 step from Node
% possibly use findall, looking for e(Node,_) combined
% with member(?Elem,?List)

% First solution: manually look in every single case
reaching([], N1, []).																					% Case with no element in graph
reaching([e(N1,N2) | T], N1, [N2|M]):- reaching(T, N1, M), !.	% Case with element as first one in the first node of the graph
reaching([e(N2,N1) | T], N1, [N2|M]):- reaching(T, N1, M), !. % Case with element as second one in the first node of the graph
reaching([e(N3,N4) | T], N1, M) :- reaching(T,N1,M).					% Case with no element in the first node of the graph

% Second solution: Using findall and member
reachingWithFM(G, N, Out) :- 	findall(X, member(e(N, X), G), Out1),
															findall(Y, member(e(Y, N), G), Out2),
															append(Out1, Out2, Out).


% 2.5 anypath(+Graph, +Node1, +Node2, -ListPath)
% a path from Node1 to Node2
% if there are many path, they are showed 1-by-1

anypath([e(Start,End)|T], Start, End, e(Start,End)).																						% Case with the two numbers as the first node of the graph.
anypath([e(End,Start)|T], Start, End, e(Start,End)).																						% Case with the two numbers reversed as the first node of the graph.
anypath([e(Some,Start)|T], Start, End, [e(Start,Some)|Output]):- anypath(T, Some, End, Output).	% Case with one of the two numbers in the first node of the graph as First.
anypath([e(Start,Some)|T], Start, End, [e(Start,Some)|Output]):- anypath(T, Some, End, Output).	% Case with one of the two numbers in the first node of the graph as Second.
anypath([e(Some,SomeOther)|T], Start, End, Output):- anypath(T, Start, End, Output), !.					% Case with any of the two numbers in the first node of the graph.

% 2.6 allreaching(+Graph, +Node, -List)
% all the nodes that can be reached from Node
% Suppose the graph is NOT circular!
% Use findall and anyPath!

allreaching(G, N, Out) :- findall(X, anypath(G, N, X, _), Out).