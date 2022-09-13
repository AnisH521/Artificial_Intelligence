male(y).
male(a).
male(c).
male(f).
male(h).
male(i).

female(z).
female(b).
female(d).
female(e).
female(g).
female(j).
female(k).

parent(y, z, a).
parent(y, z, c).
parent(y, z, e).

parent(a, b, g).
parent(a, b, h).

parent(e, f, j).
parent(e, f, i).
parent(e, f, k).

husband(X, Y) :- 
    male(X), 
    female(Y), 
    parent(X, Y, _).

wife(X, Y) :- 
    female(X), 
    male(Y), 
    parent(Y, X, _).

son(X, Y) :- 
    male(X), 
    parent(_, Y, X).
son(X, Y) :- 
    male(X), 
    parent(Y, _, X).

daughter(X, Y) :- 
    female(X), 
    parent(_, Y, X).

daughter(X, Y) :- 
    female(X), 
    parent(Y, _, X).

brother(X, Y) :- 
    parent(Z, K, X), 
    parent(Z, K, Y), 
    male(X), 
    X \== Y.

sister(X, Y) :- 
    parent(Z, K, X), 
    parent(Z, K, Y), 
    female(X), 
    X \== Y.

grandfather(X, Y) :- 
    male(X), 
    parent(X, _, Z), 
    parent(Z, _, Y).

grandfather(X, Y) :- 
    male(X), 
    parent(X, _, Z), 
    parent(_, Z, Y).

grandmother(X, Y) :- 
    female(X), 
    parent(_, X, Z), 
    parent(Z, _, Y).

grandmother(X, Y) :- 
    female(X), 
    parent(_, X, Z), 
    parent(_, Z, Y).

cousin(X, Y) :- 
    grandfather(J, Y), 
    grandfather(J, X), 
    not(brother(X, Y)), 
    not(sister(X, Y)), 
    X \== Y.

cousin(X, Y) :- 
    grandmother(J, Y), 
    grandmother(J, X), 
    not(brother(X, Y)), 
    not(sister(X, Y)), 
    X \== Y.

% cousin of h

% ?- cousin(X, h).
% X = j ;
% X = i ;
% X = k ;
% X = j ;
% X = i ;
% X = k ;
% false.

% brother(s) of c

% ?- brother(X, c).
% X = a ;
% false.

% find sister(s) of i; 

% ?- sister(X, i).
% X = j ;
% X = k.

% find grandfather of j

% ?- grandfather(X, j).
% X = y ;
% false.

% find the brother of e who is not the father of g.

% ?- brother(X, e), not(parent(X, _, g)).
% X = c ;
% false.