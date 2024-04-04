% The coin is unfair with p(heads) = 0.4
0.4 :: heads.
% Color distribution in each urn
0.3 :: col(1,red); 0.7 :: col(1,blue).
0.2 :: col(2,red); 0.3 :: col(2,green); 0.5 :: col(2,blue).

% There are two ways of winning this game, either by
% flipping heads and picking up at least one red ball
win :- heads, col(_,red).
win :- col(_,red).

% Picking up two balls of the same color
% win :- col(1,C), col(2,C).

query(heads). % Probability of heads?
query(win). % Probability of win?
query(col(1,_)). % Probability of each color from urn 1
query(col(2,_)). % Probability of each color from urn 2
% evidence(col(2, green)). % Suppose we know we picked up a green ball from urn 2