and(0,_,0).
and(_,0,0).
and(1,1,1).

or(1,_,1).
or(_,1,1).
or(0,0,0).

not(0,1).
not(1,0).

circuit(A,B,C,D,F) :- and(A,B,X),and(C,D,Y),or(X,Y,Z),not(Z,F).


male(john).
male(robert).
male(william).
male(bill).
male(michael).

female(merry).
female(cathy).
female(sandra).
female(victoria).

parent(john,merry).
parent(john,robert).
parent(merry,bill).
parent(merry,sandra).
parent(william,bill).
parent(william,sandra).
parent(sandra,michael).
parent(robert,victoria).
parent(cathy,victoria).

father(X,Y) :- parent(X,Y),male(X).
mother(X,Y) :- parent(X,Y),female(X).

sibling(X,Y) :- parent(Z,X),parent(Z,Y),X\==Y.

grandfather(X,Y) :- father(X,Z),parent(Z,Y).
grandmother(X,Y) :- mother(X,Z),parent(Z,Y).

spouse(X,Y) :- parent(X,Z),parent(Y,Z),X\==Y.

predecessor(X,Y) :- parent(X,Y).
predecessor(X,Y) :- parent(Z,Y),predecessor(X,Z).


calc :- X is 5, Y is 10, Z is X//Y, write(Z).

count(X,Z,Y) :- X<Y, write(X), nl, P is X+Z, count(P,Z,Y).
count(X,_,Y) :- X>Y.
count(Y,_,Y) :- write(Y).  

arr([H|T]) :- write(H), nl, arr(T).
arr([]) :- write('').

len([_|T],X) :- len(T,Y), X is Y+1.
len([_],X) :- X is 1.

union([H|X],Y,Z) :- is_member(H,Y), union(X,Y,Z).
union([H|X],Y,[H|Z]) :- \+ is_member(H,Y), union(X,Y,Z).
union([],Y,Y).

is_member(X,[X|_]).
is_member(X,[_|T]) :- is_member(X,T).

intersection([H|X],Y,[H|Z]) :- is_member(H,Y),  intersection(X,Y,Z).
intersection([H|X],Y,Z) :- \+ is_member(H,Y), intersection(X,Y,Z).
intersection([],_,[]).

concat([],L,L).
concat([H|T],L,[H|X]) :- concat(T,L,X).

rev([H|T],L) :- rev(T,P), concat(P,[H],L).
rev([],[]).

max([X,Y|T],P) :- maxm(X,Y,Z), max([Z|T],P).
max([X],X).

maxm(X,Y,X) :-  X>=Y.
maxm(X,Y,Y) :- X<Y.

gcd(X,Y,X) :- X=:=Y.
gcd(X,Y,Z) :- X>Y, P is X-Y, gcd(P,Y,Z).
gcd(X,Y,Z) :- X<Y, P is Y-X, gcd(X,P,Z).