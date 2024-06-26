% 0.8::stress(ann).
% % 0.4::stress(bob).
% 0.6::influences(ann,bob).
% 0.2::influences(bob,carl).

% smokes(X) :- stress(X).
% smokes(X) :- influences(Y,X), smokes(Y).

% query(smokes(carl)).

0.4 :: heads.
0.3 :: col(1,red); 0.7 :: col(1,blue).
0.2 :: col(2,red); 0.3 :: col(2,green); 0.5 :: col(2,blue).

% win :- heads, col(_,red).
win :- col(1,C), col(2,C).

query(heads).
query(win).
query(col(1,_)).
query(col(2,_)).
% evidence(col(2,green)).