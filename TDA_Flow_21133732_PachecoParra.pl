% TDA_Flow_21133732_PachecoParra.

:- consult('TDA_Option_21133732_PachecoParra.pl').

% ----------------------------------------------------

% nombre predicado: pertenece
% Descripción: predicado que verifica si un elemento pertenece a una lista
% Dom: elemento X lista
% MetaPrimaria: pertenece/2
pertenece(Elem,[Elem|_]).
pertenece(Elem,[_|Resto]):-
    pertenece(Elem,Resto).

% nombre predicado: noPertenece
% Descripción: predicado que verifica si un elemento no pertenece a una lista
% Dom: elemento X lista
% MetaPrimaria: noPertenece/2
noPertenece(Elem,Lista):-
    \+pertenece(Elem,Lista).

% RF3:
% nombre predicado: flow
% Descripción: predicado constructor de un flujo de un chatbot
% Dom: Id X namemessage X optionIn X flow
% MetaPrimaria: flow/4
% MetaSecundaria: removeDuplicates/4
flow(Id, NameMessage, OptionsIn, [Id, NameMessage, OptionsNoDuplicados]):-
    removeDuplicates(OptionsIn, [], OptionsNoDuplicados, []).

newFlow(Id, NameMessage, OptionsIn, [Id, NameMessage, OptionsIn]).

% nombre predicado: removeDuplicates
% Descripción: predicado que elimina las opciones duplicadas de un flujo
% Dom: options X listaAcc X listaOut X IdVisitadas
% MetaPrimaria: removeDuplicates/4
% MetaSecundaria: getOptionCode/2, noPertenece/2, removeDuplicates/4
removeDuplicates([], ListaAcc, ListaAcc, _).
removeDuplicates([AddElem|AddRest], ListaAcc, ListaOut, IdVisitadas) :-
    getOptionCode(AddElem, Code),
    noPertenece(Code, IdVisitadas),
    removeDuplicates(AddRest, [AddElem|ListaAcc], ListaOut, [Code|IdVisitadas]).
removeDuplicates([_|AddRest], ListaAcc, ListaOut, IdVisitadas) :-
    removeDuplicates(AddRest, ListaAcc, ListaOut, IdVisitadas).

% nombre predicado: getFlowId
% Descripción: predicado que devuelve el Id de un flujo
% Dom: flow X Id
% MetaPrimaria: getFlowId/2
% MetaSecundaria: newFlow/4
getFlowId(Flow, Id):-
    newFlow(Id, _, _, Flow).

% nombre predicado: getFlowNameMessage
% Descripción: predicado que devuelve el nombre de un flujo
% Dom: flow X name
% MetaPrimaria: getFlowNameMessage/2
% MetaSecundaria: newFlow/4
getFlowNameMessage(Flow, Name):-
    newFlow(_, Name, _, Flow).

% nombre predicado: getFlowOptions
% Descripción: predicado que devuelve las opciones de un flujo
% Dom: flow X options
% MetaPrimaria: getFlowOptions/2
% MetaSecundaria: newFlow/4
getFlowOptions(Flow,Options):-
    newFlow(_, _, Options, Flow).

% pruebas
% probar flow(1, "Flujo 1: mensaje de prueba", [ ], F1).
% probar flow(2, "Flujo 1: mensaje de prueba", [O1, O2], F2).
% probar flow(1, "Flujo 13: mensaje de prueba", [], F13).
% probar flow(2, "Flujo 14: mensaje de prueba", [O1, O2, O2, O1, O1], F14).

% RF4:
% nombre predicado: flowAddOption
% Descripción: predicado que agrega una opción a un flujo
% Dom: flow X option X newFlow
% MetaPrimaria: flowAddOption/3
% MetaSecundaria: getFlowId/2, getFlowNameMessage/2, getFlowOptions/2, removeDuplicates/4, flow/4
flowAddOption(Flow, Option, NewFlow):-
    getFlowId(Flow, Id),
    getFlowNameMessage(Flow, Name),
    getFlowOptions(Flow, Options),
    removeDuplicates(Option, Options, NewOptions, []),
    flow(Id, Name, NewOptions, NewFlow).

% pruebas
% option(1, "1 - viajar", 2, 4, ["viajar", "turistear", "conocer"], O1), option(2, "2 - estudiar", 4, 3, ["aprender", "perfeccionarme"], O2), flow(2, "Flujo 14: mensaje de prueba", [O1, O2, O2, O1, O1], F14), flowAddOption(F14, O2, F15).