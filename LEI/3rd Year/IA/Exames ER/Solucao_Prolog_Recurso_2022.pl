
aluno(baião).
aluno(maria).
aluno(carlos).

nota(joao, 12).
nota(maria, 8).
nota(carlos, 15).

passa(X, Y):- aluno(X), 
    		nota(X,Y), 
    		Y >= 9.5.

passam(L):-findall(X,passa(X,_),L).


estado(fr4585, ryanair, barcelona, oporto, ontime).
estado(tp1142, tap, lisbon, ibiza, delayed).
estado(fr1084, ryanair, paris, lisbon, canceled).
estado(lh1160, lufthansa, frankfurt, valencia, canceled).

passageiro(fr4585, joao).
passageiro(fr4585, maria).
passageiro(tp1142, mathieu).
passageiro(fr1084, antonio).

%assumir que os nomes dos passageiros são únicos e que cada passageiro só está num voo
consulta_estado(N, E):-passageiro(C, N), estado(C,_,_,_,E).

%lista de voos que me permitam chegar a tempo a um determinado destino?
a_tempo(D, L):-setof(X,estado(X,_,_,D,ontime), L).

%lista de passageiros de um voo, se este estiver cancelado. Se não existir falha
lista_cancelados(C, L):-estado(C,_,_,_,_),findall(P,(estado(C,_,_,_,canceled), passageiro(C,P)),L).
