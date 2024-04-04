% Define three coins with different probabilities
0.4::heads(1).
0.7::heads(2).
0.5::heads(3).

% Define two ways of winning
win :- heads(1).
win :- heads(2),heads(3).

% Testing to add an evidence
% evidence(heads(3)).

% Query the probaility of each coin, and of win
query(heads(_)).
query(win).