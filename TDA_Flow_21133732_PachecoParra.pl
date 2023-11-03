% TDA_Flow_21133732_PachecoParra.

:- include("TDA_Option_21133732_PachecoParra.pl").

% ----------------------------------------------------
% RF3:
% nombre funcion: flow
% Descripción: predicado constructor de un flujo de un chatbot
% Dom: id X namemessage X optionIn X flow
% MetaPrimaria: flow/4
% MetaSecundaria: removeDuplicates/4
flow(Id, NameMessage, OptionsIn, [Id, NameMessage, OptionsNoDuplicados]):-
    removeDuplicates(OptionsIn, [], OptionsNoDuplicados, []).

% nombre funcion: pertenece
% Descripción: predicado que verifica si un elemento pertenece a una lista
% Dom: elemento X lista
% MetaPrimaria: pertenece/2
pertenece(Elem,[Elem|_]).
pertenece(Elem,[_|Resto]):-
    pertenece(Elem,Resto).

% nombre funcion: noPertenece
% Descripción: predicado que verifica si un elemento no pertenece a una lista
% Dom: elemento X lista
% MetaPrimaria: noPertenece/2
noPertenece(Elem,Lista):-
    \+pertenece(Elem,Lista).

% nombre funcion: removeDuplicates
removeDuplicates([], ListaAcc, ListaAcc, _).
removeDuplicates([AddElem|AddRest], ListaAcc, ListaOut, IdVisitadas) :-
    getOptionCode(AddElem, Code),
    noPertenece(Code, IdVisitadas),
    removeDuplicates(AddRest, [AddElem|ListaAcc], ListaOut, [Code|IdVisitadas]).
removeDuplicates([_|AddRest], ListaAcc, ListaOut, IdVisitadas) :-
    removeDuplicates(AddRest, ListaAcc, ListaOut, IdVisitadas).

% nombre funcion: newFlow
% Descripción: predicado que crea un nuevo flujo sin duplicados
% Dom: id X namemessage X options X flow
% MetaPrimaria: newFlow/4
newFlow(Id, NameMessage, Options, [Id, NameMessage, Options]).

% nombre funcion: getIdFlow
% Descripción: predicado que devuelve el id de un flujo
% Dom: flow X id
% MetaPrimaria: getIdFlow/2
% MetaSecundaria: newFlow/4
getIdFLow(Flow, ID):-
    newFlow(ID, _, _, Flow).

% nombre funcion: getNameFlow
% Descripción: predicado que devuelve el nombre de un flujo
% Dom: flow X name
% MetaPrimaria: getNameFlow/2
% MetaSecundaria: newFlow/4
getNameFlow(Flow, Name):-
    newFlow(_, Name, _, Flow).

% nombre funcion: getOptionsFlow
% Descripción: predicado que devuelve las opciones de un flujo
% Dom: flow X options
% MetaPrimaria: getOptionsFlow/2
% MetaSecundaria: newFlow/4
getOptionsFlow(Flow,Options):-
    newFlow(_, _, Options, Flow).

% pruebas
% probar flow(1, "Flujo 1: mensaje de prueba", [ ], F1).
% probar flow(2, "Flujo 1: mensaje de prueba", [O1, O2], F2).
% probar flow(1, "Flujo 13: mensaje de prueba", [], F13).
% probar flow(2, "Flujo 14: mensaje de prueba", [O1, O2, O2, O1, O1], F14).