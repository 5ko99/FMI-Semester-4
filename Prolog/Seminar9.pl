<<<<<<< HEAD
/* HW
remove(X, L, NewL).
removeAllX(X, L, NewL).
insert(X, L, NewL). 
*/

%remove(X, L, NewL).
remove(X, [X|T], T).
remove(X, [H|T], [H|Z]) :-
    remove(X, T, Z).

=======
/* 
На последното упражнение няма запис, тъй като забравих бутона go live.
Затова сега ще се опитам, докато ми е пресна паметта, да възстановя какво си говорихме.
Домашното беше:
    remove(X, L, NewL). - Маха точно едно срешане на X в списъка L и резултатния се записва в NewL. 
        Чрез преудовлетворяване трябва да може да генерирате в NewL списъка L без някое срещане на X в него.
    removeAllX(X, L, NewL). - Маха всички срещания на елемента X в списъка L.
    insert(X, L, NewL). - Добавя елемента X в списъка L и резултата се записва в NewL. 
        Чрез преудовлетворяване да може в NewL да генерирате в списъка L елемента X да бъде на всички възможни позиции.
*/
% Ваш колега предложи това решение за remove.
% remove(X, L, NewL).
remove(X, [X|T], T).
remove(X, [H|T], [H|Z]) :-
    remove(X, T, Z).
/* 
Коректно е тъй като ние искаме само едно срещане да изключим от списъка L. 
Работи така:
?- remove(2, [2,2,1,3,4,2], R).
R = [2, 1, 3, 4, 2] ;
R = [2, 1, 3, 4, 2] ;
R = [2, 2, 1, 3, 4] ;
false.
Може и така да го ползвате:
?- remove(X, [2,2,1,3,4,2], R).
X = 2,
R = [2, 1, 3, 4, 2] ;
X = 2,
R = [2, 1, 3, 4, 2] ;
X = 1,
R = [2, 2, 3, 4, 2] ;
X = 3,
R = [2, 2, 1, 4, 2] ;
X = 4,
R = [2, 2, 1, 3, 2] ;
X = 2,
R = [2, 2, 1, 3, 4] ;
false.
Важно е. Ще го ползваме в следваща задача.
*/

/*
Друг вариант, който написахме на място. Идеята е, че все едно търсим в думата List
срещане на буквата X. Ако намерим такова срещане, цепим думата List = A.X.B, махаме X 
и NewL = A.B, където за . означаваме конкатенация. По едно срещане махаме и чрез преудовлетворяване
генерираме всички варинати на списъка L без елемента X.
Ако искате да трасирате как става рацепването и тн. , то добавете "write(A), nl, write(B), nl" примерно
между двата append-а.
*/
>>>>>>> e6ed33137227a0532a21b83a6fa2b9d5be1a45a7
remove1(X, List, Result) :-
    append(A, [X|B], List),
    append(A, B, Result).

<<<<<<< HEAD
% removeAllX(X, L, NewL).
% removeAllX(X, [X], []).
% p():-removeAll(), q().
=======

% Тук колегата ви предложи в оригинал следното:
% removeAllX(X, L, NewL).
removeAllX(X, [X], []).
>>>>>>> e6ed33137227a0532a21b83a6fa2b9d5be1a45a7
removeAllX(_, [], []).
removeAllX(X, [X|T], Z) :-
    removeAllX(X, T, Z).
removeAllX(X, [H|T], [H|Z]) :-
    removeAllX(X, T, Z).
<<<<<<< HEAD

insert(X, L, NewL) :-
    remove(X, NewL, L).
insert1(X, List, Result) :-
    append(A, B, List),
    append(A, [X|B], Result).

%insert(X, L, NewL).
=======
/*
Решението е почти окей. Не бяхме казали как можем да кажем, че два терма са различни.
С X \= H казваме, че терма, който се съдържа в променливата X е различен от терма в променливата H.
С X = H пък казваме, че двата терма имат еднаква стойност, т.е. тук семантиката на равенството
в равенство между синтактични обекти, между думи, т.е. равенство между структури.
Също първата клауза е излишна, т.к. тя се покрива от клаузи 3 и 4.
Работи така засега:
?- removeAllX(2, [2,2,2,1,1,d,e,2],R).
R = [1, 1, d, e] ;
R = [1, 1, d, e] ;
R = [1, 1, d, e, 2] ;
R = [2, 1, 1, d, e] ;
R = [2, 1, 1, d, e] ;
R = [2, 1, 1, d, e, 2] ;
R = [2, 1, 1, d, e] ;
R = [2, 1, 1, d, e] ;
R = [2, 1, 1, d, e, 2] ;
R = [2, 2, 1, 1, d, e] ;
R = [2, 2, 1, 1, d, e] ;
R = [2, 2, 1, 1, d, e, 2] ;
R = [2, 1, 1, d, e] ;
R = [2, 1, 1, d, e] ;
R = [2, 1, 1, d, e, 2] ;
R = [2, 2, 1, 1, d, e] ;
R = [2, 2, 1, 1, d, e] ;
R = [2, 2, 1, 1, d, e, 2] ;
R = [2, 2, 1, 1, d, e] ;
R = [2, 2, 1, 1, d, e] ;
R = [2, 2, 1, 1, d, e, 2] ;
R = [2, 2, 2, 1, 1, d, e] ;
R = [2, 2, 2, 1, 1, d, e] ;
R = [2, 2, 2, 1, 1, d, e, 2] ;
false.

Заради клауза 1 на моменти по два пъти изписва един и същ списък, но понякога е, защото
маха друга 2-ка т.е като имаме съседни двойки примерно 2,2, то:
?- removeAllX(2, [2,2],R).
R = [] ;
R = [2] ;
R = [2] ;
R = [2, 2] ;
false.
Нека да оправим бъга с клауза 1:
*/
removeAllX1(_, [], []).
removeAllX1(X, [X|T], Z) :-
    removeAllX1(X, T, Z).
removeAllX1(X, [H|T], [H|Z]) :-
    removeAllX1(X, T, Z).
/*
Важно е да разберем, че трябва да си правим предикатите коректни т.е., ако трябва само единствен 
резултат да връщат, да е един. Преиката така връща като първи резултат коректен списък и може 
да си кажем да игнорираме бъга, ние си знаем, че след това при преудовлетворяване ще бълва глупости,
но ние само ще си го ползваме да ни дава само първият резултат.
Нещата се променят като комбинираме предикати, за да правим по-големи.
Нека примерно имаме предиката: */
hasTwos(List):- 
    removeAllX1(2, List, NewL), 
    member(2, NewL), 
    write("NewL= "),
    write(NewL), 
    nl. % слагаме write, за да следим за стойноста на NewL
/*
Сега идеята е, че този предикат е истина т.с.т.к. след работата на removeAllX има 2ки в резултата, а
то не трябва да има тъх като семантиката на removeAllX1 е да махне всички слещания на 2ката от списъка L.
Ние си знаем да не го пускаме повече от веднъж, но Пролог не го знае. В основата на Пролог
стои алгоритъма DFS. В корена на дървото, което изгражда пролог имате заявката примерно ?-hasTwos([2,2,1,3,2]).
Знаете, че пролог ще се опита да направи предиката верен. Като първия път removeAllX1 подаде на member списъка 
[1,3], то member ще бъде false, защото 2 не е елемент на този списък. Пролог (DFS) ще backtrack-не отново до removeAllX1
и ще го преудовлетвори (DFS търси дали има още неразгледани пътища). Сега вече горим, защото малкото невнимание ни се връща
тъпкано. Това, че в 3тата клауза на removeAllX1 липсва X\=H ни прецаква. 
Работи така:
?- hasTwos([2,2,1,3,2]).
NewL= [1,3,2] 
true ;
NewL= [2,1,3]
true ;
NewL= [2,1,3,2]
true ;
NewL= [2,1,3,2]
true ;
NewL= [2,1,3]
true ;
NewL= [2,1,3,2]
true ;
NewL= [2,1,3,2]
true ;
NewL= [2,2,1,3]
true ;
NewL= [2,2,1,3]
true ;
NewL= [2,2,1,3,2]
true ;
NewL= [2,2,1,3,2]
true ;
NewL= [2,2,1,3,2]
true ;
false.
Сега след rework #2 имаме:
*/
removeAllX2(_, [], []).
removeAllX2(X, [X|T], Z) :-
    removeAllX2(X, T, Z).
removeAllX2(X, [H|T], [H|Z]) :-
    X \= H,
    removeAllX2(X, T, Z).
/*
Тада:
?- removeAllX2(2, [2,2,1,3,2],R).
R = [1, 3] ;
false.
Може и по друг начин да си подсигурим,че removeAllX1 ще връща само първия резултат, да използваме оператора
cut !(http://cs.union.edu/~striegnk/learn-prolog-now/html/node88.html). Той ще отреже дървото на DFS дотолкова,
 че само един резултат да бъде върнат т.е. нека да пренапишем hasTwos:
*/
hasTwos1(List):- 
    removeAllX1(2, List, NewL), 
    !,
    member(2, NewL), 
    write("NewL= "),
    write(NewL), 
    nl. % слагаме write, за да следим за стойноста на NewL
/*
Работи така:
?- hasTwos1([2,2,1,3,2]).
false.
Коректно е, т.к. след removeAllX1 сле казали, че не остават 2ки в списъка NewL.
Няма да го ползваме т.к. не е позволен на контролно, защото извършва купа нелогически действия и също
ни кара да сме невнимателни при конструиране на предикатите ни, а ние искаме да се научим да изразяваме на 
Пролог коректно нали?
*/


% Продължаваме със задачата insert. Колегата ви беше предложил две частични коректни решения:
>>>>>>> e6ed33137227a0532a21b83a6fa2b9d5be1a45a7
insertFront(X, L, [X|L]).

insertBack(X, [], [X]).
insertBack(X, [H|T], [H|Z]) :-
    insertBack(X, T, Z).

<<<<<<< HEAD
=======

% Ние ги доразвихме до две пълни решения:
% insert(X, L, NewL).
insert(X, L, NewL) :-
    remove(X, NewL, L).
insert1(X, List, Result) :-
    append(A, B, List),
    append(A, [X|B], Result).
% Забележете, че:
insert2(X, L, NewL) :-
    remove1(X, NewL, L).
% зацикля след като изплюе всички резултати. 
/*
Това е така, защото примерно при insert(2, [1,3], R), то R = [2,1,3], [1,2,3], [1,3,2] и след това
се опитваме да направим (от remove1) правим remove1(2, register1, [1, 3]) и 
append([register21, register22,.., register2n], [2|register3], [register21, register22,.., register2n].[2|register3])
за точката значи слепването на списъка [register21, register22,.., register2n] към [2|register3] има безброй много решения като по големина 
[register21, register22,.., register2n] вече надвишава 2 елемента строго т.е. append( [register21, register22,.., register2n], register3, [1,3]) 
никога няма да бъде в сила, т.к. списъка [1,3] има само два елемента, а искаме поне n да има.
*/

/*
Продължихме със задачата member(X, L) - true толкова пъти колкото срещания на елемента X имаме в списъка L.
false, ако няма срещане. Няколко имплементации направихме разгледайте ги.
Работи така:
?- member1(2, [2,2,1,3,2]).
true ;
true ;
true ;
false.

?- member1(X, [2,2,1,3,2]).
X = 2 ;
X = 2 ;
X = 1 ;
X = 3 ;
X = 2 ;
false.
*/
>>>>>>> e6ed33137227a0532a21b83a6fa2b9d5be1a45a7
% member1(X, List).
member1(X, [X|_]).
member1(X, [_|T]) :-
    member1(X, T).

member2(X, L) :-
    append(_, [X|_], L).

member3(X, L) :-
    remove(X, L, _).

member4(X, L) :-
    insert(X, _, L).

<<<<<<< HEAD
% permutation(L, P).
% [X|P] List

=======
/*
Задача за генериране (разпознаване) на пермутации.
Два подхода илюстрирахме.
Първият е следният (спрямо пермутацията).
Дъното е ясно.
Ако имаме списък List, можем с remove да генерираме в X произволен елемент
от него и в Q да оставим остатъка от списъка L без X.
След това разбъркваме Q->P и добавяме като глава на P X и това ни е резултатния
списък. Може с индукция по тази индуктивна дефиниция да се докаже, че тази имплементация
на permutation ги генерира в лексикоглафска наредба (пращайте на предложения) на мен и Боби предложения).

*/
>>>>>>> e6ed33137227a0532a21b83a6fa2b9d5be1a45a7
permutation([], []).
permutation(List, [X|P]) :-
    remove(X, List, Q),
    % write(X),
    % nl,
    % write(Q),
    % nl,
    permutation(Q, P).

<<<<<<< HEAD
=======
/*
Този вариант път е спрямо входящия списък разсъждения.
Имаме списъка List=[H|T] и пермутираме опашката T като за финал добавяме X на произволна позиция в Q и това е 
резултата. Реално така можем да го четем като индукция:
"База: Пермутация на елементите на []  е [].
Индукционна хипотеза: Допускаме, че списъци с дължина n можем да премутираме.
Стъпка: За (n+1)? Разбиваме List=[H|T], ИХ за T -> Q, добавяме някъде в Q елемeнта X. Чрез преудовлетворяване
ще изциклим всички позиции."
*/
>>>>>>> e6ed33137227a0532a21b83a6fa2b9d5be1a45a7
permutation1([], []).
permutation1([H|T], R) :-
    permutation1(T, Q),
    insert(H, Q, R).

<<<<<<< HEAD
=======
/*
Друга задачка наречена още permutationSort.
Дефинирахме първо релацията less(X,Y), която дефинира линейна наредба
между елентите на списък. Сега сме я сложили да бъде =< за числа (в Пролог се пишат
така =< и >=, защото са искали да имплементират имликация с => и <=).
След това дефинирахме isSorted, която проверява дали списъка подаден ѝ е сортиран.
Накрая simpleSort просто търси сортирана пермутация като ги генерира последователно.
*/
>>>>>>> e6ed33137227a0532a21b83a6fa2b9d5be1a45a7
% less(X, Y).
less(X, Y):- X =< Y.
% isSorted(List). 
isSorted([]).
isSorted([_]).
isSorted([X, Y|T]) :-
    less(X, Y),
    isSorted([Y|T]).
% X1 < X2 < X3 <.....<XM

% simpleSort(List, SortedList).
simpleSort(List, SortedList) :-
    permutation(List, SortedList),
    isSorted(SortedList).

<<<<<<< HEAD
=======
/*
Последно се занимавахме с префикс, инфикс и суфикс.
Всички чрез append ги изразихме.
*/

>>>>>>> e6ed33137227a0532a21b83a6fa2b9d5be1a45a7
% prefix(List, Prefix).
prefix(List, Prefix) :-
    append(Prefix, _, List).

% suffix(List, Suffix).
suffix(List, Suffix) :-
    append(_, Suffix, List).

% [1,2,5,a] -> [2,5]
% infix(List, Infix).
infix(List, Infix) :-
    prefix(List, Prefix),
    suffix(Prefix, Infix).

infix1(List, Infix) :-
    suffix(List, Suffix),
    prefix(Suffix, Infix).

% Prefix Infix Suffix
% List 
<<<<<<< HEAD
infix2(List, Infix) :-
    append(A, _, List),
    append(_, Infix, A).

% HW reverse(List, ReversedList).
/*
    We have a binary relation p. Write these formulas on Prolog.
        a) \forall X \forall Y p(X,Y)
        b) \exists X \forall Y p(X,Y)
        c) \forall X \exists Y p(X,Y)
        d) \exists X \exists Y p(X,Y)
*/
% subset(List, Subset).
=======
/*
Идеята тук беше на Боби да покаже как можем да се затреляме в крака, ако не внимаваме.
?- infix2([1,2,a],L).
L = [] ;
L = [1] ;
L = [1, 2] ;
L = [1, 2, a] ;
L = [] ;
L = [2] ;
L = [2, a] ;
L = [] ;
L = [a] ;
L = [] ;
^CAction (h for help) ? abort
% Execution Aborted
Защо стана така?
Ами append(_, Infix, A ), има безброй решения като при insert2 се получава и накрая
списъка A е с толкова много елементи, че не може да се мапне с List, който има само 3.
Реално append(A, _, List). е с краен брой решения, така че нека да ги разменим двата append-а.
*/
infix2(List, Infix) :-
    append(_, Infix, A),
    append(A, _, List).
    
% Преправяме я и става така:
infix3(List, Infix) :-
    append(A, _, List),
    append(_, Infix, A).
% Я да преименуваме:
infix4(List, Infix) :-
    append(Prefix, _, List),
    append(_, Infix, Prefix).
% Дефиницията стана същата като infix.

/* 
HW задачки:
reverse(List, ReversedList).
subset(List, Subset). 
Имаме друместен предикат p. Напишете тези формули на Пролог:
a) \forall X \forall Y p(X,Y)
b) \exists X \forall Y p(X,Y)
c) \forall X \exists Y p(X,Y)
d) \exists X \exists Y p(X,Y)
*/


reverse([],[]).
reverse([H|T],R):-
    reverse(T,W),
    append(W,[H],R).

%/exist X /exist Y p(X,Y) - Има ел. на X който е и ел. на Y
d(X,Y):-
    member(X1,X),
    member(Y1, Y),
    member(X1, Y1).
    
%/forall X /exist Y p(X,Y) - Всеки ел. на X е в ел. на Y
c([],_).
c([H|T],Y):-
    member(Y1,Y),
    member(H,Y1),
    c(T,Y).

%/exist X /forall Y p(X,Y)- Има ел. на X, който е във всеки ел. на  Y
b(X,Y):-
    member(X1, X),
    allY(Y,X1).

allY([],_).
allY([H|T],X1):-
    member(X1, H),
    allY(T,X1).
    
%/forall X /forall Y p(X,Y)- Всеки ел. на X, e във всеки ел. на Y
a([],_).
a([H|T],Y):-allY(Y,H), a(T,Y).

%not() - \forall x p(x) |=| \neg \exist X \neg p(X)
c1(X,Y):-
    not((member(X1, X),
    not((member(Y1,Y),
    member(X1, Y1))))).

%Not
not2(A):-call(A),!,0>1.
not2(_).

%b) \E x \A y p(x,y) = \E x \ neg(\E y \neg p(x,y))


subsetRecMultiSet(X,Y):-
    not((member(Z,X),not(member(Z,Y)))).

subsetGenerator([],[]).
subsetGenerator(R,[_|T]):-
    subsetGenerator(R,T).
subsetGenerator([H|R],[H|T]):-
    subsetGenerator(R,T).

subsetGenerator2([],[]).
subsetGenerator2([H|T],S):-
    append(_,[H|S1],S),
    subsetGenerator2(T,S1).

%Генерира вс. списъци S, чиито ел. са ел. на L
subsetGeneratorMultiSet([],_).
subsetGeneratorMultiSet([H|S],L):-
    subsetGeneratorMultiSet(S,L),
    member(H, L).
    
>>>>>>> e6ed33137227a0532a21b83a6fa2b9d5be1a45a7
