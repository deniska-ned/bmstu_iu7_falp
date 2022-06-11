% 00. Mother on nth generation

% 01. Mother
% 02. Father

% 03. Brother
% 04. Sister

% 05. GrandMother
% 06. GrandFather

% 07. wife
% 08. husband

% 09. h father in law -- husband father -- свёкр
% 10. h mother in law -- husband mather -- свекровь

% 11. w father in law -- wife father -- тесть
% 12. w mother in law -- wife mather -- тёща

% 13. h brother in law -- husband brother -- деверь
% 14. h sister in law -- husband sister -- золовка

% 15. w brother in law -- wife brother -- шурин
% 16. w sister in law -- wife sister -- свояченица

% 17. aunt -- sister of mother or father -- тётя
% 18. uncle -- brother of mother of father -- дядя

% 19. son
% 20. daughter

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% person(name, sex)

person("James", "male").
person("Mary", "female").

person("Robert", "male").
person("William", "male").
person("Barbara", "female").

person("Patricia", "female").
person("David", "male").
person("Elizabeth", "female").

person("John", "male").
person("Jennifer", "female").

person("Michael", "male").
person("Linda", "female").



% parent(childName, parentName).

parent("James", "Robert").
parent("James", "Patricia").

parent("Mary", "Robert").
parent("Mary", "Patricia").

parent("Robert", "John").
parent("Robert", "Jennifer").
parent("William", "John").
parent("William", "Jennifer").
parent("Barbara", "John").
parent("Barbara", "Jennifer").

parent("Patricia", "Michael").
parent("Patricia", "Linda").
parent("David", "Michael").
parent("David", "Linda").
parent("Elizabeth", "Michael").
parent("Elizabeth", "Linda").

% parentNth(childName, n, Ans).

parentNth(ChildName, 0, ChildName).
parentNth(ChildName, N, Ans) :-
	N >= 1,
	parent(ChildName, ChildNameNew),
	NNew is N - 1,
	parentNth(ChildNameNew, NNew, Ans).
motherNth(ChildName, 0, Ans) :- 
	parentNth(ChildName, 0, Ans), 
	person(Ans, "female").

% {mother, father}(ChildName, Ans).
mother(ChildName, MotherName) :- parent(ChildName, MotherName), person(MotherName, "female").
father(ChildName, FatherName) :- parent(ChildName, FatherName), person(FatherName, "male").

% {sibling,brother,sister}(childName, Ans).
sibling(Name, SiblingName) :-
	mother(Name, MotherName),
	mother(SiblingName, MotherName),
	father(Name, FatherName),
	father(SiblingName, FatherName),
	Name \= SiblingName.
brother(Name, BrotherName) :- sibling(Name, BrotherName), person(BrotherName, "male").
sister(Name, SisterName) :- sibling(Name, SisterName), person(SisterName, "female").

% {grandMother,grandFather}(ChildName, Ans).
grandMother(ChildName, GrandMotherName) :- parentNth(ChildName, 2, GrandMotherName), person(GrandMotherName, "female").
grandFather(ChildName, GrandFatherName) :- parentNth(ChildName, 2, GrandFatherName), person(GrandFatherName, "male").

% {wife,husband}(Name, Ans).
wife(Husband, Wife) :- person(Husband, "male"), parent(Child, Husband), parent(Child, Wife), person(Wife, "female").
husband(Wife, Husband) :- person(Wife, "female"), parent(Child, Husband), parent(Child, Wife), person(Husband, "male").

% {h,w}{Father,Mother}InLaw(Name, Ans).

hFatherInLaw(Wife, Ans) :- husband(Wife, Husband), father(Husband, Ans).
hMotherInLaw(Wife, Ans) :- husband(Wife, Husband), mother(Husband, Ans).

wFatherInLaw(Husband, Ans) :- wife(Husband, Wife), father(Wife, Ans).
wMotherInLaw(Husband, Ans) :- wife(Husband, Wife), mother(Wife, Ans).

% {h,w}{Brother,Sister}InLaw(Name, Ans).

hBrotherInLaw(Wife, Ans) :- husband(Wife, Husband), brother(Husband, Ans).
hSisterInLaw(Wife, Ans) :- husband(Wife, Husband), sister(Husband, Ans).

wBrotherInLaw(Husband, Ans) :- wife(Husband, Wife), brother(Wife, Ans).
wSisterInLaw(Husband, Ans) :- wife(Husband, Wife), sister(Wife, Ans).

% {aunt,uncle}(Name, Ans).
aunt(Name, Ans) :- father(Name, Father), sister(Father, Ans).
aunt(Name, Ans) :- mother(Name, Mother), sister(Mother, Ans).

uncle(Name, Ans) :- father(Name, Father), brother(Father, Ans).
uncle(Name, Ans) :- mother(Name, Mother), brother(Mother, Ans).

% {son,daughter}(Name, Ans).
son(Parent, Ans) :- parent(Ans, Parent), person(Ans, "male").
daughter(Parent, Ans) :- parent(Ans, Parent), person(Ans, "female").
