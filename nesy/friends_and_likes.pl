% If we're friends then we are guarenteed to like eachother
1.0: likes(X, Y):- friendof(X, Y).

% You have a .8 chance of liking the friend of a friend
0.8: likes(X, Y):- firendof(X, Z), likes(Z, Y).

% Set up relations
0.5: friendof(john,  mary).
0.5: friendof(mary,  pedro).
0.5: friendof(mary,  tom).
0.5: friendof(pedro,  tom).
?- likes(john, tom).