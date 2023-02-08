/*Begin Question 4.1*/    
prime(X) 
	:- X < 2,!,false.
prime(X) 
	:- \+ (divisible(X, 2)).

divisible(X,Y) 
	:- 0 is X mod Y.
divisible(X,Y) 
	:- X > Y + 1,
       divisible(X, Y + 1).

/*End Question 4.1*/

/*Begin Question 4.2*/
possible(X,Y,Z)
	:- genbearings(123,179, X),
       genbearings(182,269,Y),
       genbearings(271,359,Z).

genbearings(I,J,I) 
	:- I =< J.
genbearings(I,J,K) 
	:- I < J,
       I1 is I+1,
       genbearings(I1,J,K).

/*End Question 4.2*/

/*Begin Question 4.3*/
acceptable( X, Y, Z ) 
  :-	numToList(X,Y,Z,L),
    	set(L),
    	\+ prime(X),
    	\+ prime(Y),
    	\+ prime(Z).

set([]).
set([H|T])
	:-  H \== '0',
    	\+ member(H,T),
    	set(T).

numToList(X,Y,Z,L)
    :-  number_chars(X,XL),
    	number_chars(Y,YL),
    	number_chars(Z,ZL),
    	append(XL,YL,WL),
    	append(WL,ZL,L).

trait(X,Y,Z)
  :-   possible(X,Y,Z),
       acceptable(X,Y,Z).

/*End Question 4.3*/

main
	:- trait(X,Y,Z),write(X),write(Y),write(Z).

-- any main predicates for testing goes here

    