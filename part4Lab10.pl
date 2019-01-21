% seq(N,List)
% example: seq(5,[0,0,0,0,0]).
seq(0,[]).																	%Empty seq
seq(N,[0|T]):- N > 0, N2 is N-1, seq(N2,T).	%I keep adding 0s to the list, until N2 is equal to 0

% seqR(N,List)
% example: seqR(4,[4,3,2,1,0]).
seqR(0, [0]).															%Seq with one 0
seqR(N, [N|T]):- N2 is N-1, seqR(N2, T).	%I keep adding the number always increasing it until is equal to 0

% seqR2(N,List)
% example: seqR2(4,[0,1,2,3,4]).

% Implementation of addLast:
add_last([], X, [X]).														%Add element to an empty list								
add_last([H|T], X, [H|L]):- add_last(T, X, L).	%Add element to a non-empty list

seqR2(0, [0]):-!.																%SeqR2 with 0: I Cut here
seqR2(N, L):- N > 0, N2 is N-1, 								%SeqR2 with N: I check N, then i decrement it
	seqR2(N2, L2),																%Keep until you reach the base case
	add_last(L2, N, L).														%Tail recursion: add last all numbers until 0

% inv(List,List)
% example: inv([1,2,3],[3,2,1]).
inv([], []).																				%Inv of the empty list is the list itself
inv([X|Xs], R):- inv(Xs,T), add_last( T , X , R ).	%Inv of a non empty list: keep until you reach the base case,
																										% then add last as tail recursion

% double(List,List)
% suggestion: remember predicate append/3
% example: double([1,2,3],[1,2,3,1,2,3]).
double([], []).									%Double of empty list is the list itself
double(L, D):- append(L, L, D).	%Double the list using append/3

% times(List,N,List)
% example: times([1,2,3],3,[1,2,3,1,2,3,1,2,3]).
times([], N, []).																								%Times of an empty list is the list itself
times(L, 1, L).																									%Base case: times 1 of a list is the list itself
times(L, N, X):- N2 is N-1, times(L, N2, L2), append(L, L2, X).	%Decrement N until you reach the base case, then tail recursion and use append like the ex above

% proj(List,List)
% example: proj([[1,2],[3,4],[5,6]],[1,3,5]).
proj([], []).															%Proj of an empty list is the list itself
proj([[H|_]|T1], [H|T2]) :- proj(T1, T2).	%Proj with a list of lists: take every head

