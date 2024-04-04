% These examples are from the slides of various tutorials on ProbLog, e.g., at IJCAI 2015
% https://dtai.cs.kuleuven.be/problog/tutorial/tutslides/02_more.html
% This example uses evidence to express constraints:

% Specify the weights of each respective object
weight(skis,6).
weight(boots,4).
weight(helmet,3).
weight(gloves,2).

% Aassign prob. P to items based on weight. P of packing is inversely 
% proportional to weight.
P::pack(Item) :- weight(Item,Weight), P is 1.0/Weight.

% Define excess/1 predicate. It starts the process by calling the excess/2
% predicate with a list of items and the given limit.
% [skis,boots,helmet,gloves] defines the possible values for the items
excess(Limit) :- excess([skis,boots,helmet,gloves],Limit).

% If the list of items is empty and the limit is negative, it signifies that the packing is within the limit.
excess([],Limit) :- Limit < 0.

% Recursively check each item in the list. If an item is packed,
% its weight is subtracted from the limit. 
% Continue recursively with the remaining items.
excess([I|R],Limit) :- pack(I), weight(I,W), L is Limit-W, excess(R,L).

% If an item is not packed, the process continues recursively without subtracting its weight from the limit.
excess([I|R],Limit) :- \+pack(I), excess(R,Limit).

constraint :- pack(helmet).
constraint :- pack(boots).

evidence(constraint).
evidence(excess(10),false).
query(pack(_)).