max(X,Y,X) :- X>=Y.
max(X,Y,Y) :- X<Y.

even(X) :- Y is X mod 2, Y=:=0, write('The number is even').
even(X) :- Y is X mod 2, Y=\=0, write('The number is odd').

factorial(X,N) :- X>0,Y is X-1, factorial(Y,M), N is X*M.
factorial(0,1).

len([_|T],N) :- len(T,M), N is M+1. 
len([],0).

sum([H|T],N) :- sum(T,M), N is M+H. 
sum([],0).

is_member(X,[X|_]).
is_member(X,[_|T]) :- is_member(X,T).


concat([H|T],L2,[H|L]) :- concat(T,L2,L).
concat([],L,L).

rev([H|T],L) :- rev(T,L1), concat(L1,[H],L).
rev([],[]).

gcd(X,X,X).
gcd(X,Y,Z) :- X>Y, P is X-Y, gcd(P,Y,Z).
gcd(X,Y,Z) :- X<Y, P is Y-X, gcd(X,P,Z).

lcm(X,Y,Z) :- gcd(X,Y,K), L is X*Y, Z is L/K.

maxl([H1,H2|T],X) :- max(H1,H2,H), maxl([H|T],X).
maxl([H],H).

union([H|T],L2,L) :- is_member(H,L2), union(T,L2,L).
union([H|T],L2,[H|L]) :- \+ is_member(H,L2), union(T,L2,L). 
union([],L2,L2).

fib(N,M) :- N>2, N1 is N-1, N2 is N-2, fib(N1,M1), fib(N2,M2), M is M1+M2.
fib(1,0).
fib(2,1).
