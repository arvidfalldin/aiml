% Ann is stressed with prob 0.8
0.8::stress(ann).
% 0.4::stress(bob).

% Ann has a .6 prob to influence bob
0.6::influences(ann,bob).
# Bob has a .2 prob to influence carl
0.2::influences(bob,carl).

% Being stressed leads to smoking
smokes(X) :- stress(X).
% If your buddy smokes and you're influenced by them, then you'll smoke as well
smokes(X) :- influences(Y,X), smokes(Y).

% Prob. that carl smokes?
query(smokes(carl)).