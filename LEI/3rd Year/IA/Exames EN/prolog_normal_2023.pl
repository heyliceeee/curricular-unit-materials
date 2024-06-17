aluno(1, joao).
aluno(2, maria).
aluno(3, carlos).

disciplina(1, ia).
disciplina(2, fp).

nota(1,1,10).
nota(2,1,12).
nota(2,2,14).
nota(3,1,14).

nota(1,1,5).
nota(2,1,2).
nota(2,2,7).
nota(3,1,4).


passou(Aluno, Disc, X):-aluno(IDA, Aluno), disciplina(IDD, Disc), nota(IDA, IDD, X), X >= 10, !.
passou(Aluno, Disc, -1):-aluno(IDA, Aluno), disciplina(IDD, Disc), nota(IDA, IDD, _).

media(Nome, M):-aluno(IDA, Nome),findall(N, (nota(IDA,_,N), N >= 10), L), length(L, LL), LL > 0, sum_list(L, SL), M is SL /LL.

pred(N, L):-findall((ND, N), (aluno(IDA,N), disciplina(IDD, ND), nota(IDA, IDD, No), No < 10), L).