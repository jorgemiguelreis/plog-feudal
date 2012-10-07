%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%      Feudal em Prolog       %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%   Miao Sun  &  Jorge Reis   %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%       Turma 3 Grupo 1       %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%    PLOG  MIEIC 2012/2013    %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:-use_module(library(lists)).

% x - Mountains
% t - rough terrain
% 0 - vazia

%% Pe�as do jogo
% c - Castle    x1
% g - Green     x1
% 1 - King      x1
% 2 - Prince    x1
% 3 - Duke      x1
% 4 - Knights   x2
% 5 - Sergeants x2
% 6 - Squire    x1
% 7 - Archer    x1
% 8 - Pikemen   x4

mountedmen([2,3,4,4]).
footmen([1,5,5,6,7,8,8,8,8]).

%%%%%%%%  Estado inicial  %%%%%%%%
estadoInicial([[x,0,0,0,0,0,0,0,0,x,x,0,0,0,0,0,0,0,0,0,0,0,0,x],
               [0,0,0,0,0,0,0,0,0,0,0,0,0,x,x,0,0,0,0,0,0,0,0,0],
               [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
               [t,0,0,0,0,0,0,0,0,0,x,0,0,0,0,t,0,0,0,0,0,0,0,0],
               [0,0,0,0,0,0,x,0,0,0,x,0,0,0,t,0,0,0,0,0,x,0,0,x],
               [0,0,0,t,0,0,t,x,0,0,0,0,0,0,0,0,x,x,x,0,x,t,0,x],
               [0,0,0,x,0,0,0,0,x,0,0,0,0,0,0,0,0,0,0,x,0,0,0,0],
               [0,0,0,0,0,0,0,x,x,0,0,0,0,0,0,0,x,0,0,x,x,0,0,0],
               [0,0,0,0,0,0,x,x,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
               [0,0,0,0,0,0,x,0,0,0,0,0,0,x,x,0,0,0,0,0,0,0,0,0],
               [0,x,0,0,x,t,0,0,0,x,0,0,0,0,x,x,t,0,0,0,0,0,0,0],
               [0,0,0,0,0,0,0,0,0,x,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
               [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
               [0,0,0,0,0,0,0,0,0,0,x,0,0,0,t,x,0,0,t,x,x,0,0,0],
               [0,0,0,0,t,x,0,0,0,0,0,0,0,0,0,0,0,0,0,0,x,0,0,0],
               [0,0,0,0,x,x,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
               [t,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,x,x,t,0,0,0,0],
               [x,x,0,0,0,x,x,0,0,0,0,0,0,0,0,0,0,x,0,0,0,0,0,0],
               [0,0,0,0,0,t,x,0,0,0,0,0,0,0,0,x,x,x,x,0,0,0,0,0],
               [0,0,0,0,0,x,0,x,0,0,x,0,0,x,0,0,0,t,0,0,0,0,0,x],
               [0,0,0,0,x,x,0,0,0,x,x,0,0,t,0,0,x,0,0,0,0,0,0,0],
               [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
               [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
               [x,0,0,0,0,t,x,0,0,0,0,0,0,0,0,0,0,x,x,0,0,0,0,x]]).


show:-estadoInicial(X), print_tab(X).

print_tab(Tab):- writeln('     A   B   C   D   E   F   G   H   I   J   K   L   M   N   O   P   Q   R   S   T   U   V   W   X  '),
		 printLists(Tab,1),
		 writeln('     A   B   C   D   E   F   G   H   I   J   K   L   M   N   O   P   Q   R   S   T   U   V   W   X  '),nl.

lim:- writeln('   +---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+').


%%imprime a lista inteira
printLists([],_):-lim, !.
printLists([FList|OList],N):-
                        lim,
		        N < 10, write(' '), write(N), write(' |'),
			printList(FList),
			N2 is N+1, write(' '), writeln(N),
                        printLists(OList,N2),!;

			N> 9, write(N), write(' |'),
                        printList(FList),
			N2 is N+1, write(' '), writeln(N),
                        printLists(OList,N2).


%imprime todos os elementos de cada sublista
printList([]).
printList([FElem|OElem]):-
                        write(' '), write(FElem), write(' |'),
                        printList(OElem).


start:-
	welcome, show,
	menu_start.

welcome:-
	writeln('**********************************'),
	writeln('*                                *'),
	writeln('*      Bemvindo ao Feudal        *'),
	writeln('*                                *'),
	writeln('**********************************'),nl.

menu_start:-
	writeln('**********************************'),
        writeln('*                                *'),
        writeln('*     Escolhe o mode do jogo:    *'),
        writeln('*                                *'),
        writeln('*       1.Humano VS Humano       *'),
        writeln('*     2.Humano VS Computador     *'),
        writeln('*   3.Computador VS Computador   *'),
        writeln('*                                *'),
        writeln('**********************************'),nl,
	write('faca a sua escolha: '), faz_opcao(Op),
	%tipo_jogo(Op, J1, J2),
	write(Op), integer(Op),writeln(' um numero'),
	comeca_jogo(Op).

comeca_jogo(Op):-    %nao sei porque s� da true quando Op for 3, quando for 1 or 2 da false, mas em cima diz 1, 2, e 3 s�o n�meros.
	OP == 1, writeln('humano contra humano');
	OP == 2, writeln('humano contra computador'), menu_nivel;
	Op == 3, writeln('computador contra computador'), menu_nivel.


/*
tipo_jogo(1,humano,humano).
tipo_jogo(2,humano,computador).
tipo_jogo(3,computador,computador).
*/

opcao_invalida(Op):-
	Op \== 1,
	Op \== 2,
	Op \== 3.


faz_opcao(Op):-
	read(Op),
	not(opcao_invalida(Op)),!;
	writeln('opcao invalida'), write('faca a sua escolha: '), faz_opcao(Op).


menu_nivel:-
	writeln('**********************************'),
        writeln('*                                *'),
        writeln('*         Nivel do Jogo          *'),
        writeln('*                                *'),
        writeln('*            1.Easy              *'),
        writeln('*           2.Normal             *'),
        writeln('*            3.Hard              *'),
        writeln('*                                *'),
        writeln('**********************************'),nl,
	write('faca a sua escolha: '), faz_opcao(Op),
	write(Op), integer(Op),writeln(' um numero').