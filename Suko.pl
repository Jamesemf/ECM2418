/*Begin Question 3.1*/
indices([],[],[]).
indices([],_,[]).
indices([H|T], V, [X|Z])
	:- nth0(H,V,X),
    	indices(T, V, Z).

/*End Question 3.1*/

/*Begin Question 3.2*/
possible(GRID)
	:- perm([1,2,3,4,5,6,7,8,9],GRID).


perm([],[]).
perm([H|T],V) 
	:- perm(T,P),	/*Can call perm on T and P*/
    append(X,Y,P),		/*if list X and Y can be appended into list P*/
    append(X,[H|Y],V). /*and list X and [H|Y] can be appended into list V*/

/*End Question 3.2*/

/*Begin Question 3.3*/
acceptable(T0,T1,T2,T3, US, U, VS, V, WS, W, GRID)
	:- isequal(T0,[0,1,3,4],GRID),
    	isequal(T1,[1,2,4,5],GRID),
    	isequal(T2, [3,4,6,7],GRID),
    	isequal(T3, [4,5,7,8],GRID),
    	isequal(U,US,GRID),
    	isequal(V,VS,GRID),
    	isequal(W,WS,GRID).

suko( T0, T1, T2, T3, US, U, VS, V, WS, W, GRID)
	:- 	possible(GRID),
    	acceptable( T0, T1, T2, T3, US, U, VS, V, WS, W, GRID).

sumlist([],0).
sumlist([H|T],N)
	:- sumlist(T,W),
    	N is H + W.

isequal(V,L, GRID)
	:- indices(L,GRID, Xs),
    	sumlist(Xs, X),
    	X == V.
/*End Question 3.3*/
    
main
	:- suko(15,14,26,23,[0,1,2,3],16,[4,6,7],17,[5,8],12, GRID), write(GRID).
