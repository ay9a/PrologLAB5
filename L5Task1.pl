%Part1 Facts
% Gender Facts
male(abraham).
male(clancy).
male(herb).
male(homer).
male(bart).

female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).

% Parent Facts
parent(abraham, herb).
parent(abraham, homer).
parent(mona, herb).
parent(mona, homer).

parent(clancy, marge).
parent(clancy, patty).
parent(clancy, selma).
parent(jackie, marge).
parent(jackie, patty).
parent(jackie, selma).

parent(homer, bart).
parent(homer, lisa).
parent(homer, maggie).
parent(marge, bart).
parent(marge, lisa).
parent(marge, maggie).

parent(selma, ling).

%ــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ
%Rules

% Father and Mother
father(X, Y) :- parent(X, Y), male(X).
mother(X, Y) :- parent(X, Y), female(X).

% Son and Daughter
son(X, Y) :- parent(Y, X), male(X).
daughter(X, Y) :- parent(Y, X), female(X).

% Brother and Sister (X \= Y تضمن ألا يكون الشخص أخاً لنفسه)
brother(X, Y) :- parent(Z, X), parent(Z, Y), male(X), X \= Y.
sister(X, Y) :- parent(Z, X), parent(Z, Y), female(X), X \= Y.

% Grandfather
grandfather(X, Y) :- parent(X, Z), parent(Z, Y), male(X).

% Aunt and Uncle
uncle(X, Y) :- parent(Z, Y), brother(X, Z).
aunt(X, Y) :- parent(Z, Y), sister(X, Z).

% Cousin
cousin(X, Y) :- parent(Z, X), (brother(Z, W) ; sister(Z, W)), parent(W, Y).

% Ancestor (Recursion)
ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).

%ــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ
%Queries

/*
1. Test father/2:
?- father(homer, bart).
true.
?- father(abraham, homer).
true.

2. Test mother/2:
?- mother(marge, lisa).
true.
?- mother(selma, ling).
true.

3. Test son/2:
?- son(bart, homer).
true.
?- son(herb, abraham).
true.

4. Test daughter/2:
?- daughter(lisa, marge).
true.
?- daughter(ling, selma).
true.

5. Test brother/2:
?- brother(bart, lisa).
true.
?- brother(herb, homer).
true.

6. Test sister/2:
?- sister(lisa, bart).
true.
?- sister(patty, marge).
true.

7. Test grandfather/2:
?- grandfather(abraham, bart).
true.
?- grandfather(clancy, lisa).
true.

8. Test aunt/2:
?- aunt(patty, bart).
true.
?- aunt(selma, lisa).
true.

9. Test uncle/2:
?- uncle(herb, bart).
true.
?- uncle(herb, lisa).
true.

10. Test cousin/2:
?- cousin(ling, bart).
true.
?- cousin(bart, ling).
true.

11. Test ancestor/2:
?- ancestor(abraham, bart).
true.
?- ancestor(jackie, ling).
true.
*/


