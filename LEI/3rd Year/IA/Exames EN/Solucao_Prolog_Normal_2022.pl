
passa(X, Y):- aluno(X), nota(X,Y), Y > 9.5.

aluno(baião).
aluno(maria).
aluno(carlos).

nota(joao, 12).
nota(maria, 8).
nota(carlos, 15).


simbolo(maria, 'O').
simbolo(joao, 'X').

jogada(maria,1,2).
jogada(joao,1,1).
jogada(maria,2,1).
jogada(joao,2,2).

proximo(maria).

%determina se uma determinada jogada é válida
valida(N,S,L,C):-L>0,L<4,C>0,C<4,proximo(N),simbolo(N,S),not(jogada(_,L,C)).


%determina se o jogo já terminou
% o jogo terminou se o tabuleiro está cheio, ou se há uma linha, coluna ou diagonal preenchida para o mesmo jogador
cheio:-findall(jogada(_,_,_),jogada(_,_,_),L),length(L,X), X == 9.
linha(X):-jogada(J,X,1),jogada(J,X,2),jogada(J,X,3).
coluna(X):-jogada(J,1,X),jogada(J,2,X),jogada(J,3,X).
diagonais:-(jogada(J,1,1),jogada(J,2,2),jogada(J,3,3)) ; (jogada(J,1,3),jogada(J,2,2),jogada(J,3,1)). 
terminou:- (cheio ; linha(1) ; linha(2) ; linha(3) ; coluna(1); coluna(2) ; coluna(3) ; diagonais), !.

%determina se alguém já venceu o jogo
vencedor_vertical(N):-jogada(N,1,C), jogada(N,2,C), jogada(N,3,C).
vencedor_horizontal(N):-jogada(N,L,1), jogada(N,L,2), jogada(N,L,3).
vencedor_diagonal(N):-jogada(N,2,2),((jogada(N,1,1),jogada(N,3,3));(jogada(N,3,1),jogada(N,1,3))).
vencedor(N):-vencedor_vertical(N);vencedor_horizontal(N);vencedor_diagonal(N).
