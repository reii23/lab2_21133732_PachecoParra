% TDA_Flow_21133732_PachecoParra.

:- consult('TDA_Option_21133732_PachecoParra.pl').

% ----------------------------------------------------

% nombre predicado: pertenece
% Descripcion: predicado que verifica si un elemento pertenece a una lista
% Dom: elemento X lista
% MetaPrimaria: pertenece/2
pertenece(Elem,[Elem|_]).
pertenece(Elem,[_|Resto]):-
    pertenece(Elem,Resto).

% nombre predicado: noPertenece
% Descripcion: predicado que verifica si un elemento no pertenece a una lista
% Dom: elemento X lista
% MetaPrimaria: noPertenece/2
% MetaSecundaria: pertenece/2
noPertenece(Elem,Lista):-
    \+pertenece(Elem,Lista).

% RF3:
% nombre predicado: flow
% Descripcion: predicado constructor de un flujo de un chatbot
% Dom: Id X namemessage X optionIn X flow
% MetaPrimaria: flow/4
% MetaSecundaria: noOpcionesDuplicadas/1, newFlow/4
flow(Id, NameMessage, OptionsIn, Flow):-
    noOpcionesDuplicadas(OptionsIn),  % Verificar si no hay opciones duplicadas
    Flow = [Id, NameMessage, OptionsIn].

newFlow(Id, NameMessage, OptionsIn, [Id, NameMessage, OptionsIn]).

% nombre predicado: noOpcionesDuplicadas
% Descripcion: predicado que verifica si no hay opciones duplicadas en una lista de opciones
% Dom: options
% MetaPrimaria: noOpcionesDuplicadas/1
% MetaSecundaria: noPertenece/2, noOpcionesDuplicadas/1
noOpcionesDuplicadas([]).
noOpcionesDuplicadas([Option|Rest]):-
    noPertenece(Option, Rest),
    noOpcionesDuplicadas(Rest).

% nombre predicado: removeDuplicates
% Descripcion: predicado que elimina las opciones duplicadas de un flujo
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
% Descripcion: predicado que devuelve el Id de un flujo
% Dom: flow X Id
% MetaPrimaria: getFlowId/2
% MetaSecundaria: newFlow/4
getFlowId(Flow, Id):-
    newFlow(Id, _, _, Flow).

% nombre predicado: getFlowNameMessage
% Descripcion: predicado que devuelve el nombre de un flujo
% Dom: flow X name
% MetaPrimaria: getFlowNameMessage/2
% MetaSecundaria: newFlow/4
getFlowNameMessage(Flow, Name):-
    newFlow(_, Name, _, Flow).

% nombre predicado: getFlowOptions
% Descripcion: predicado que devuelve las opciones de un flujo
% Dom: flow X options
% MetaPrimaria: getFlowOptions/2
% MetaSecundaria: newFlow/4
getFlowOptions(Flow,Options):-
    newFlow(_, _, Options, Flow).

% RF4:
% nombre predicado: flowAddOption
% Descripcion: predicado que agrega una opcion a un flujo
% Dom: flow X option X newFlow
% MetaPrimaria: flowAddOption/3
% MetaSecundaria: getFlowId/2, getFlowNameMessage/2, getFlowOptions/2, removeDuplicates/4, flow/4
flowAddOption(Flow, Option, NewFlow):-
    getFlowOptions(Flow, Options),
    noPertenece(Option, Options),
    getFlowId(Flow, Id),
    getFlowNameMessage(Flow, Name),
    flow(Id, Name, [Option|Options], NewFlow).
