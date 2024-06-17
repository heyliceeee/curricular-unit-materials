ingrediente(queijo, 2).
ingrediente(ananas, 1).
ingrediente(presunto,2).
ingrediente(tomate,2).
ingrediente(fiambre,0).

receita(tropical, ananas, 2).
receita(tropical, tomate, 1).
receita(tropical, queijo, 10).
receita(margarita, tomate, 2).
receita(margarita, queeijo, 2).

%quantas unidades adicionais é necessário comprar de um dado ingrediente, para se poder fazer
%uma determinada piza
comprar(I,P,R):-receita(P,I,Q),ingrediente(I,QS),R is Q - QS, R > 0, !.
comprar(_,_,0).

%devolve 0 quando o ingrediente não é usado em nenhuma pizza, 1 se é usado em pelo menos
%uma, e falha caso o ingrediente não exista
sem_receita(I,1):-ingrediente(I,_),receita(_,I,_),!.
sem_receita(I,0):-ingrediente(I,_).


%obter a lista de todos os ingredientes de uma determinada pizza, para os quais não há stock suficiente
em_falta(P,L):-findall(I,(receita(P,I,Q),ingrediente(I,QS),QS < Q), L).
