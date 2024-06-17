
%mina(loc, x, y, eXploded, Active, Desminada)
mina(kherson, 10, 20, x).
mina(kherson, 10, 25, d).
mina(kherson, 11, 23, a).
mina(mariupol, 5, 18, a).
mina(mariupol, 4, 2, x).
mina(mariupol, 15, 26, d).

% desminagem(loc, x, y, id_veiculo)
desminagem(kherson, 10, 25, 1).
desminagem(mariupol, 15, 26, 2).

% devolve true se o veículo já fez desminagem em mais que uma regiao
multi_reg(Id_v):-desminagem(L1, _, _, Id_v), desminagem(L2, _, _, Id_v), L1 \= L2, !.

% validar que a mina nas coordenadas está no estado desminada, e na lista de desminagens efetuadas, e só há uma 
% mina nessas coordenadas e localização.
valida_desminagem(L, X, Y):-mina(L, X, Y, d), desminagem(L, X, Y, _), findall(_, mina(L, X, Y, _), LL), length(LL,1).

% percentagem e numero de minas ativas
perc_ativas(L, Tot2, P):-findall(_, mina(L, _, _, _), L1), length(L1, Tot1), findall(_, mina(L, _, _, a), L2), length(L2, Tot2), P is Tot2 / Tot1.