
% produto(codigo, descrição, preço, stock)
produto(1, 'rato logitech', 67, 3).
produto(2, 'teclado razer' , 120, 5).
produto(3, 'processador intel core i7', 450, 2).

subtotal(Cod, Quant, T):-produto(Cod, _, P, Q), Q >= Quant, T is P * Quant, T =< 100, !.
subtotal(Cod, Quant, TT):-produto(Cod, _, P, Q), Q >= Quant, T is P * Quant, Desc is T * 0.05, TT is T - Desc.

pesquisa_stock(Cod, Desc, _):-not(var(Cod)), not(var(Desc)), !, fail.
pesquisa_stock(Cod, _, S):-produto(Cod, _, _, S), !.
pesquisa_stock(_, Desc, S):-produto(_, Desc, _, S).

total_stock(T):- findall(S, produto(_, _, _, S), L), sum_list(L, T).