% probability of X (image) depicting the digit Y is given by nn
nn(mnist_net, [X], Y, [0,1,2,3,4,5,6,7,8,9]) :: digit(X, Y).

% Some help from this webpage: http://www.cs.trincoll.edu/~ram/cpsc352/notes/prolog/search.html

% Prolog List Notation
% In Prolog list elements are enclosed by brackets and separated by commas.
%   [1,2,3,4]
%   [[mary,joe],[bob,carol,ted,alice]]
%   []
% Another way to represent a list is to use the head/tail notation [H|T]. 
% Here the head of the list, H, is separated from the tail of the list, T, by a vertical bar.
% The tail of a list is the original list with its first element removed.
% The tail of a list is always a list, even if it's the empty list.
% In Prolog, the H|T notation is used together with unification to combine and break up lists. For example, suppose we have the following list:
%   [bob,carol,ted,alice]
% Here's the various matches we would obtain using H|T:
%   [X|Y]        matches with X=bob Y=[carol,ted,alice]
%   [X,Y|Z]      matches with X=bob, Y=carol, Z=[ted,alice]
%   [X,Y,Z|W]    matches with X=bob, Y=carol, Z=ted W=[alice]
%   [X,Y,Z,W|V]  matches with X=bob, Y=carol, Z=ted,  W=alice and V=[]
%   [X,Y,Z,Y]    won't match because Y=carol and carol != alice
%   [X,Y,Z,W,V|U] won't match because the list does not contain 5 elements


% number(list, acc, res)
% convert a list of mnist images into a natural number in base 10

% Base case 
number([], Result, Result).

% If list is not empty, recursively call upon yourself until the list is empty
number([H|T], Acc, Result) :- digit(H, Nr), Acc2 is Nr+10*Acc, number(T, Acc2, Result).

% If only two inputs are given, assume acc to be zero
number(X, Y) :- number(X, 0, Y).

% Convert lists X and Y to natural numbers and define Z as sum of them
multi_addition(X, Y, Z) :- number(X, X2), number(Y, Y2), Z is X2 + Y2.

% If X and Y are single-digit numbers, just define addition as sum of the digits
addition(X, Y, Z) :- digit(X, X2), digit(Y, Y2), Z is X2 + Y2.