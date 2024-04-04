% probability of X (image) depicting the digit Y is given by nn
nn(mnist_net, [X], Y, [0,1,2,3,4,5,6,7,8,9]) :: digit(X, Y).

% % number(list, acc, res)
% % convert a list of mnist images into a natural number in base 10

% % Base case 
% number([], Result, Result).

% % If list is not empty, recursively call upon yourself until the list is empty
% number([H|T], Acc, Result) :- digit(H, Nr), Acc2 is Nr+10*Acc, number(T, Acc2, Result).

% % If only two inputs are given, assume acc to be zero
% number(X, Y) :- number(X, 0, Y).

% % Convert lists X and Y to natural numbers and define Z as sum of them
% multi_addition(X, Y, Z) :- number(X, X2), number(Y, Y2), Z is X2 + Y2.

% If X and Y are single-digit numbers, just define addition as sum of the digits
subtraction(X, Y, Z) :- digit(X, X2), digit(Y, Y2), Z is X2 - Y2.