/* Name : Anish Naskar
M.Sc. Data Science
SEM : 2
Roll No : 96/DTS 210001 */




/* 1. Consider the family tree given in the figure 1. Every female member of the family is
denoted with a bar on top of their names. A, C and E are children of Y and Z. + symbol
defines that two people are married. Create a knowledge base in PROLOG in such a way
that the whole family tree can be implemented. You have to write facts for all
male(x): x is a male;
female(x): x is a female;
parents(u,v,w): u and v are parents of w;

Write the rules for finding
(a) husband(x,y): x is husband of y;
(b) wife(x,y): x is wife of y;
(c) son(x,y): x is son of y;
(d) daughter(x,y): x is daughter of y;
(e) brother(x,y): x is brother of y;
(f) sister(x,y): x is sister of y;
(g) grandfather(x,y): x is grandfather of y;
(h) grandmother(x,y): x is grandmother of y;
(i) cousin(x,y): x is cousin of y;

Now run the following queries: find the cousins of h; find the brother(s) of c; find
sister(s) of i; find grandfather of j; and find the brother of e who is not the father of g. */

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


/* 2. Write a PROLOG program to calculate the sum of two numbers. */

sum(X, Y, Z) :- Z is X + Y.


/* 3. Write a PROLOG program to find the maximum of two numbers. */

max(X, Y, Z) :- X > Y, Z is X.
max(X, Y, Z) :- Y >= X, Z is Y.


/* 4. Write a PROLOG program to find the area and perimeter of a square with the side length
being provided by the user. */

area_sq(LENGTH, AREA) :- AREA is LENGTH ** 2.
perimeter_sq(LENGTH, PERIMETER) :- PERIMETER is LENGTH * 4.


/* 5. Write a PROLOG program to find the area and perimeter of a circle with the radius
being provided by the user. */

area_c(RADIUS, AREA) :- AREA is pi * RADIUS ** 2.
perimeter_c(RADIUS, PERIMETER) :- PERIMETER is 2 * pi * RADIUS.


/* 6. Write a PROLOG program to print a Fibonacci series with stating numbers are provided
by user. */

fib(N,M) :- 
    N > 2, 
    N1 is N-1, 
    N2 is N-2, 
    fib(N1,M1), 
    fib(N2,M2), 
    M is M1+M2.
    
fib(1,1).
fib(2,1).


/* 7. Write a PROLOG program to calculate the sum of natural numbers up to a limit (using
recursion). */

sum_nat(Limit, S) :-
    Limit > 0,
    Y is Limit - 1,
    sum_nat(Y, K),
    S is Limit + K.
sum_nat(0, 0).

/* 8. Write a PROLOG program to calculate the sum of a range. */

sum_rng(A, B, S) :-
    A < B,
    Next is A + 1,
    sum_rng(Next, B, K),
    S is K + A.
sum_rng(Eq, Eq, Eq).


/* 9. Write a PROLOG program to calculate the factorial of a given number. */

factorial(X,N) :- 
    X > 0,
    Y is X-1, 
    factorial(Y,M), 
    N is X*M.
factorial(0,1).


/* 10. Write a PROLOG program to find the last element of a list(list must have at least 4
items). */

list_last([_|Tail]) :- 
    list_last(Tail).
list_last([Head]) :-
    write(Head).


/* 11. Write a PROLOG program to find the length of a list (list must have at least 4 elements). */

list_length([_|Tail],N) :-
    list_length(Tail,N1),
    N is N1 + 1.
list_length([],0).


/* 12. Write a PROLOG program to find the average of a list of numbers. */

list_avg([H|T],Sum,N,Avg) :-
    list_sum([H|T],Sum),
    list_length([H|T],N),
    Avg is Sum/N.


/* 13. Write a PROLOG program to implement maxlist(List,Max) so that Max is the greatest
among all the elements present in the list (list must have at least 4 items). */


list_max([X,Y,A,B],P) :- maxm(X,Y,Z), maxm(A,B,K), maxm(Z,K,L), list_max([L],P).
list_max([X],X).

maxm(X,Y,X) :-  X>=Y.
maxm(X,Y,Y) :- X<Y.


/* 14. Write a PROLOG program to calculate the sum of numbers present in the List. ( At first
create a list of numbers. The length of the list must not be less than 4.) */

list_sum([H|T], Sum) :-
    list_sum(T,X), 
    Sum is H + X. 
list_sum([],0).


/* 15. Write a PROLOG program to find out the GCD and LCM of two numbers. Use these
predicates to find out the GCD and LCM of a list of numbers. */

gcd(X,X,X).
gcd(X,Y,Z) :- X>Y, P is X-Y, gcd(P,Y,Z).
gcd(X,Y,Z) :- X<Y, P is Y-X, gcd(X,P,Z).

lcm(X,Y,Z) :- gcd(X,Y,K), L is X*Y, Z is L/K.

list_gcd([H, H1|T], GCD) :- gcd(H, H1, Z), list_gcd([Z|T], GCD).
list_gcd([H1, H2], GCD) :- gcd(H1, H2, K), GCD is K.

list_lcm([H, H1|T], LCM) :- lcm(H, H1, Z), list_lcm([Z|T], LCM).
list_lcm([H1, H2], LCM) :- lcm(H1, H2, K), LCM is K.


/* 16. Write a PROLOG program to insert an element at the kth position of a list. */


insertAt(X, [X|X1], 1, X1).
insertAt(X, [Y|X1], K, [Y|Ys]) :-
    K > 1,
    K1 is K -1,
    insertAt(X, X1, K1, Ys).


/* 17. Write a PROLOG program to implement the Full Adder digital circuit. */

and(0,_,0).
and(_,0,0).
and(1,1,1).

or(1,_,1).
or(_,1,1).
or(0,0,0).

xor(0, 0, 0).
xor(1, 1, 0).
xor(0, 1, 1).
xor(1, 0, 1).

cout(A, B, Cin, Cout) :-
    and(A, B, Z0),
    xor(A, B, Z1),
    and(Cin, Z1, Z2),
    or(Z2, Z0, Cout).

sum(A, B, Cin, Sum) :-
    xor(A, B, Z1),
    xor(Cin, Z1, Sum).


/* 18. Write a PROLOG program to print the reverse of a given list. */

rev([H|T],L) :- rev(T,P), concat(P,[H],L).
rev([],[]).

/* 19. Write a PROLOG program to concatenate two given lists. */

concat([],L,L).
concat([H|T],L,[H|X]) :- concat(T,L,X).


/* 20. Write a PROLOG program to find the union, difference and intersection of two given
lists. */

union([H|X],Y,Z) :- is_member(H,Y), union(X,Y,Z).
union([H|X],Y,[H|Z]) :- \+ is_member(H,Y), union(X,Y,Z).
union([],Y,Y).

is_member(X,[X|_]).
is_member(X,[_|T]) :- is_member(X,T).

intersection([H|X],Y,[H|Z]) :- is_member(H,Y),  intersection(X,Y,Z).
intersection([H|X],Y,Z) :- \+ is_member(H,Y), intersection(X,Y,Z).
intersection([],_,[]).

diff(List,[],List).
diff(List,[X|Sub],Rem) :- select(X,List,Rem0), diff(Rem0,Sub,Rem).


/* 21. Write a PROLOG program to check whether a given list is palindrome or not. */

pal([]).
pal([_]).
pal(Pal) :-
    append([H|T], [H], Pal),
    pal(T).


/* 22. Write a PROLOG program to check whether a given number is prime or not. Use this
predicate to print all the prime numbers upto a given number. */

divisible(X, Y) :- 0 is X mod Y.
divisible(X,Y) :- X > Y + 1, divisible(X, Y + 1).
isprime(X) :- X > 0, integer(X), 0 is X mod X, not(divisible(X, 2)).
isprime(X) :- X is 2. 

primeList(0, []) :- !.
primeList(N, [N|L]) :-
    isprime(N),
    !,
    NewN is N - 1,
    primeList(NewN, L).
primeList(N, L) :-
    NewN is N - 1,
    primeList(NewN, L).


/* 24. Write a PROLOG program to delete the kth element of a list. */

delete_kth(As,N1,Bs) :-
   same_length(As,[_|Bs]),
   append(Prefix,[_|Suffix],As),
   length([_|Prefix],N1),
   append(Prefix,Suffix,Bs).


/* 25. Write a PROLOG program to check whether a path exists between two nodes of a graph.
You can implement any arbitrary graph. Print the series of the nodes in the path(s) if
some path exists. */