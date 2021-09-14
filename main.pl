main :-
    statistics(cputime, T1),
    model([A1, A2, A3, A4, A5]),
    print_list([A1, A2, A3, A4, A5]),
    statistics(cputime, T2),

    search_time is T2 - T1,
    format('\n T1: ~f \t T2: ~f  msec', [T1, T2]),
    format('\n Tempo total: ~10f  msec', search_time),
    fail.

main :-
    nl,
    write('xxxx AQUI SOH PODE VIR UMA RESPOSTA ....'),
    nl,
    write('........ UFA apos o fail .......').

model([
    (Bag_1, Name_1, Age_1, Period_1, Collect_1, Sport_1),
    (Bag_2, Name_2, Age_2, Period_2, Collect_2, Sport_2),
    (Bag_3, Name_3, Age_3, Period_3, Collect_3, Sport_3),
    (Bag_4, Name_4, Age_4, Period_4, Collect_4, Sport_4),
    (Bag_5, Name_5, Age_5, Period_5, Collect_5, Sport_5)
    ]) :-

    % Mochila

    bag(Bag_1),
    bag(Bag_2),
    bag(Bag_3),
    bag(Bag_4),
    bag(Bag_5),

    alldifferent([Bag_1, Bag_2, Bag_3, Bag_4, Bag_5]),

    % Na terceira posição está o rapaz da mochila Azul.
    (Bag_3==blue),

    % Em uma das pontas está o colecionador da mochila Branca.
    (
        (Bag_1==white);
        (Bag_5==white)
    ),

    % O dono da mochila Verde está em algum lugar à direita do dono da mochila Branca.
    (
        (Bag_1==white, (Bag_2==green; Bag_3==green; Bag_4==green; Bag_5==green));
        (Bag_2==white, (Bag_3==green; Bag_4==green; Bag_5==green));
        (Bag_3==white, (Bag_4==green; Bag_5==green));
        (Bag_4==white, Bag_5==green)
    ),

    % Nome

    name(Name_1),
    name(Name_2),
    name(Name_3),
    name(Name_4),
    name(Name_5),

    alldifferent([Name_1, Name_2, Name_3, Name_4, Name_5]),

    % Marcel está na primeira posição.
    (Name_1==marcel),

    % Evandro está na terceira posição.
    (Name_3==evandro),

    % Yuri está um das pontas.
    (
        (Name_1=yuri);
        (Name_5=yuri)
    ),

    % O dono da mochila Amarela está em algum lugar à esquerda de Fabricio.
    (
        (Name_5==fabricio, (Bag_4==yellow; Bag_3==yellow; Bag_2==yellow; Bag_1==yellow));
        (Name_4==fabricio, (Bag_3==yellow; Bag_2==yellow; Bag_1==yellow));
        (Name_3==fabricio, (Bag_2==yellow; Bag_1==yellow));
        (Name_2==fabricio, Bag_1==yellow)
    ),

    % Idade

    age(Age_1),
    age(Age_2),
    age(Age_3),
    age(Age_4),
    age(Age_5),

    alldifferent([Age_1, Age_2, Age_3, Age_4, Age_5]),

    % Início

    period(Period_1),
    period(Period_2),
    period(Period_3),
    period(Period_4),
    period(Period_5),

    alldifferent([Period_1, Period_2, Period_3, Period_4, Period_5]),

    % Na quarta posição está o colecionador que começou a colecionar com 12 anos.
    (Period_4==12),

    % O rapaz que começou a colecionar com 20 anos está na primeira posição.
    (Period_1==20),

    % O colecionador de 35 anos começou a colecionar com 22 anos.
    (
        (Age_1==35, Period_1==22);
        (Age_2==35, Period_2==22);
        (Age_3==35, Period_3==22);
        (Age_4==35, Period_4==22);
        (Age_5==35, Period_5==22)
    ),

    % O colecionador de 39 anos começou a colecionar com 15 anos.
    (
        (Age_1==39, Period_1==15);
        (Age_2==39, Period_2==15);
        (Age_3==39, Period_3==15);
        (Age_4==39, Period_4==15);
        (Age_5==39, Period_5==15)
    ),

    % O colecionador da mochila Verde começou com 15 anos.
    (
        (Bag_1==green, Period_1==15);
        (Bag_2==green, Period_2==15);
        (Bag_3==green, Period_3==15);
        (Bag_4==green, Period_4==15);
        (Bag_5==green, Period_5==15)
    ),

    % Coleciona

    collect(Collect_1),
    collect(Collect_2),
    collect(Collect_3),
    collect(Collect_4),
    collect(Collect_5),

    alldifferent([Collect_1, Collect_2, Collect_3, Collect_4, Collect_5]),

    % Quem coleciona Armas está ao lado do homem de 39 anos.
    (
        (Collect_1==guns, Age_2==39);
        (Collect_2==guns, (Age_1==39; Age_3==39));
        (Collect_3==guns, (Age_2==39; Age_4==39));
        (Collect_4==guns, (Age_3==39; Age_5==39));
        (Collect_5==guns, Age_4==39)
    ),

    % O homem de 33 anos está exatamente à direita de quem coleciona Latas.
    (
        (Collect_1==cans, Age_2==33);
        (Collect_2==cans, Age_3==33);
        (Collect_3==cans, Age_4==33);
        (Collect_4==cans, Age_5==33)
    ),

    % Quem coleciona Brinquedos está ao lado de quem está com a mochila Azul.
    (
        (Collect_1==toys, Bag_2==blue);
        (Collect_2==toys, (Bag_1==blue; Bag_3==blue));
        (Collect_3==toys, (Bag_2==blue; Bag_4==blue));
        (Collect_4==toys, (Bag_3==blue; Bag_5==blue));
        (Collect_5==toys, Bag_4==blue)
    ),

    % Em uma das pontas está quem coleciona Relógios.
    (
        (Collect_1==watches);
        (Collect_5==watches)
    ),

    % O colecionador da mochila Branca coleciona Esculturas.
    (
        (Bag_1==white, Collect_1==sculptures);
        (Bag_2==white, Collect_2==sculptures);
        (Bag_3==white, Collect_3==sculptures);
        (Bag_4==white, Collect_4==sculptures);
        (Bag_5==white, Collect_5==sculptures)
    ),

    % Esporte

    sport(Sport_1),
    sport(Sport_2),
    sport(Sport_3),
    sport(Sport_4),
    sport(Sport_5),

    alldifferent([Sport_1, Sport_2, Sport_3, Sport_4, Sport_5]),

    % Na quinta posição está quem gosta de Basquete.
    (Sport_5==basketball),

    % Na primeira posição está quem gosta de Futebol.
    (Sport_1==soccer),

    % O colecionador da mochila Vermelha gosta de Tênis.
    (
        (Bag_1==red, Sport_1==tennis);
        (Bag_2==red, Sport_2==tennis);
        (Bag_3==red, Sport_3==tennis);
        (Bag_4==red, Sport_4==tennis);
        (Bag_5==red, Sport_5==tennis)
    ),

    % Quem gosta de Vôlei começou a colecionar com 25 anos.
    (
        (Sport_1==volleyball, Period_1==25);
        (Sport_2==volleyball, Period_2==25);
        (Sport_3==volleyball, Period_3==25);
        (Sport_4==volleyball, Period_4==25);
        (Sport_5==volleyball, Period_5==25)
    ),

    % O colecionador que gosta de Natação está exatamente à esquerda do homem mais velho.
    (
        (Sport_1==swimming, Age_2==44);
        (Sport_2==swimming, Age_3==44);
        (Sport_3==swimming, Age_4==44);
        (Sport_4==swimming, Age_5==44)
    ).

% Base de Dados

% Mochila

bag(yellow).
bag(blue).
bag(white).
bag(green).
bag(red).

% Nome

name(evandro).
name(fabricio).
name(pedro).
name(marcel).
name(yuri).

% Idade

age(33).
age(35).
age(39).
age(41).
age(44).

% Início

period(12).
period(15).
period(20).
period(22).
period(25).

% Coleciona

collect(guns).
collect(toys).
collect(sculptures).
collect(cans).
collect(watches).

% Esportes

sport(basketball).
sport(soccer).
sport(swimming).
sport(volleyball).
sport(tennis).

% Fns

alldifferent([]).
alldifferent([H|T]) :- not(member(H,T)), alldifferent(T).

print_list([]):- write('').
print_list([H|T]):-
    write(H), write(' : '),
    print_list(T).
