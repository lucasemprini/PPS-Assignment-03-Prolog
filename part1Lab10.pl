% search(Elem, List)
search(X,[X|_]).								%Case we immediatly find the elem as the head.
search(X,[_|Xs]):-search(X,Xs).	%Case the elem is not in the head.

% search2(Elem,List)
% looks for two consecutive occurrences of Elem
search2(X,[X,X|_]).								%Case the 2 consecutive are the first two.
search2(X,[_|Xs]):-search2(X,Xs).	%Case the 2 consecutive are not the first two.

% search_two(Elem,List)
% looks for two occurrences of Elem with an element in between!
search_two(X,[X,_,X|_]).								%Case one of the 2 occurrences is the first elem.
search_two(X,[_|Xs]):-search_two(X,Xs).	%Case none of the 2 occurrences is the first elem.

% search_anytwo(Elem,List)
% looks for any Elem that occurs two times
search_anytwo(X,[X|T]):-search(X,T).					%Case one of the 2 occurrences is the first elem.
search_anytwo(X,[_|Xs]):-search_anytwo(X,Xs). %Case none of the 2 occurrences is the first elem.