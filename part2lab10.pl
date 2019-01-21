% size(List,Size)
% Size will contain the number of elements in List
size([],0).														%Size of an empty list is 0
size([_|T],M) :- size(T,N), M is N+1.	%Size of a list wit some elements is size of the same list without its head plus 1.

% sizeP(List,Size)
% Size will contain the number of elements in List, written using notation zero, s(zero), s(s(zero)).
%Same explanation of the solution above, but using notation zero.
sizeP([],zero).
sizeP([_|T], M) :- sizeP(T,N), M = s(N).

% sum(List,Sum)
sum([H],H).													%Case list with one element.
sum([H|T],M) :- sum(T,N), M is N+H.	%Case list with multiple elements.

% average(List,Average)
% it uses average(List,Count,Sum,Average)
average(List,A) :- average(List,0,0,A).	%I will need to keep 2 vars to obtain the average.
average([],C,S,A) :- A is S/C.					%Base case: 0 elements
average([X|Xs],C,S,A),									%Not trivial case:
				C2 is C + 1,										%Divider will be incremented
				S2 is S + X,										%The sum of all elements here
				average(Xs,C2,S2,A).

% max(List,Max)
% Max is the biggest element in List
% Suppose the list has at least one element
max([H|T], M) :- max(T, M, H).										%I will need to keep track of a tmp element
max([], H, H).																		%Base case: the tmp element will be the max
max([X|Xs], M, Tmp) :- Tmp =< X , max(Xs, M, X).	%Case a bigger element is found: replace Tmp
max([X|Xs], M, Tmp) :- Tmp > X , max(Xs, M, Tmp).	%Case no bigger element is found: keep Tmp
		