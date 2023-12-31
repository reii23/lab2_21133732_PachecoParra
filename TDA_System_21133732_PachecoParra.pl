% TDA_System_21133732_PachecoParra.pl

:- consult('TDA_Chatbot_21133732_PachecoParra.pl').
:- consult('TDA_ChatHistory_21133732_PachecoParra.pl').
:- consult('TDA_User_21133732_PachecoParra.pl').

% RF7:
% nombre predicado: system
% Descripcion: predicado constructor de un sistema de chatbots
% Dom: nameSystem X initialChatbotCodeLink X chatbotsIn X system
% MetaPrimaria: system/4
system(SystemName, InitialChatbotCodeLink, ChatbotsIn, [SystemName, InitialChatbotCodeLink, ChatbotsOut, [], [], []]):-
    noChatbotsDuplicados(ChatbotsIn),  % Verificar si no hay chatbots duplicados
    ChatbotsOut = ChatbotsIn.

% nombre predicado: auxSystem
% Descripcion: predicado constructor auxiliar de un sistema de chatbots
% Dom: nameSystem X initialChatbotCodeLink X chatbotsIn X users X userLogin X chatHistory X system
% MetaPrimaria: auxSystem/7
auxSystem(SystemName, InitialChatbotCodeLink, Chatbots, Users, UserLogin, ChatHistory, [SystemName, InitialChatbotCodeLink, Chatbots, Users, UserLogin, ChatHistory]).

% nombre predicado: getSystemName
% Descripcion: predicado que devuelve el nombre de un sistema
% Dom: system X Systemname
% MetaPrimaria: getSystemName/2
getSystemName([SystemName|_], SystemName).

% nombre predicado: getSystemInitialChatbotCodeLink
% Descripcion: predicado que devuelve el link del chatbot inicial de un sistema
% Dom: system X InitialChatbotCodeLink
% MetaPrimaria: getSystemInitialChatbotCodeLink/2
getSystemInitialChatbotCodeLink([_, InitialChatbotCodeLink|_], InitialChatbotCodeLink).

% nombre predicado: getSystemChatbots
% Descripcion: predicado que devuelve los chatbots de un sistema
% Dom: system X Chatbots
% MetaPrimaria: getSystemChatbots/2
getSystemChatbots([_,_,Chatbots|_], Chatbots).

% nombre predicado: getSystemChatHistory
% Descripcion: predicado que devuelve el historial de un sistema
% Dom: system X ChatHistory
% MetaPrimaria: getSystemChatHistory/2
getSystemChatHistory([_, _, _, _, ChatHistory, _], ChatHistory).

% nombre predicado: getUsuarioRegistrado
% Descripcion: predicado que devuelve los usuarios registrados en el sistema
% Dom: system X Users
% MetaPrimaria: getUsuarioRegistrado/2
getUsuarioRegistrado([_, _, _, Users, _, _], Users).

% nombre predicado: getUsuarioLogeado
% Descripcion: predicado que devuelve el usuario logueado en el sistema
% Dom: system X userLogin
% MetaPrimaria: getUsuarioLogeado/2
getUsuarioLogeado([_, _, _, _, UserLogin, _], UserLogin).

% nombre predicado: setUsuarioLogeado
% Descripcion: predicado que modifica el usuario logueado en el sistema
% Dom: system X userLogin X newSystem
% MetaPrimaria: setUsuarioLogeado/3
setUsuarioLogeado([SystemName, InitialChatbotCodeLink, Chatbots, Users, _, ChatHistory], UserLogin, [SystemName, InitialChatbotCodeLink, Chatbots, Users, UserLogin, ChatHistory]).

% nombre predicado: removeDuplicatesChatbot
% Descripcion: predicado que elimina los chatbots duplicados de una lista de chatbots
% Dom: chatbot X chatbots X newChatbots
% MetaPrimaria: removeDuplicatesChatbot/3
% MetaSecundaria: getChatbotID/2, noPertenece/2
removeDuplicatesChatbot(Chatbot, Chatbots, NewChatbots, IdVisitadas):-
    getChatbotID(Chatbot, ChatbotID),
    noPertenece(ChatbotID, IdVisitadas),
    NewChatbots = [Chatbot | Chatbots].
removeDuplicatesChatbot(_, Chatbots, Chatbots, _).

% nombre predicado: noChatbotsDuplicados
% Descripcion: predicado que verifica si hay chatbots duplicados en una lista de chatbots
% Dom: chatbots
% MetaPrimaria: noChatbotsDuplicados/1
% MetaSecundaria: chatbotsDuplicados/1
noChatbotsDuplicados(Chatbots) :-
    \+ chatbotsDuplicados(Chatbots).

% nombre predicado: chatbotsDuplicados
% Descripcion: predicado que verifica si hay chatbots duplicados en una lista de chatbots
% Dom: chatbots
% MetaPrimaria: chatbotsDuplicados/1
% MetaSecundaria: getChatbotID/2, tieneDuplicados/1
chatbotsDuplicados(Chatbots) :-
    findall(ID, (pertenece(Chatbot, Chatbots), getChatbotID(Chatbot, ID)), IDs),
    tieneDuplicados(IDs).

% nombre predicado: tieneDuplicados
% Descripcion: predicado que verifica si hay elementos duplicados en una lista
% Dom: lista
% MetaPrimaria: tieneDuplicados/1
% MetaSecundaria: pertenece/2
tieneDuplicados([H | T]) :- pertenece(H, T).
tieneDuplicados([_ | T]) :- tieneDuplicados(T).

% RF8:
% nombre predicado: systemAddChatbot
% Descripcion: predicado que agrega un chatbot a un sistema
% Dom: system X chatbot X system
% Meta Primaria: systemAddChatbot/3
% Meta Secundaria: getSystemName/2, getSystemInitialChatbotCodeLink/2, getSystemChatbots/2, removeDuplicatesChatbot/4, system/4
systemAddChatbot(System, Chatbot, NewSystem):-
    getSystemName(System, SystemName),
    getSystemInitialChatbotCodeLink(System, InitialChatbotCodeLink),
    getSystemChatbots(System, Chatbots),
    removeDuplicatesChatbot(Chatbot, Chatbots, NewChatbots, []),
    system(SystemName, InitialChatbotCodeLink, NewChatbots, NewSystem).

% nombre predicado: noPertenece2
% Descripcion: predicado que verifica si un elemento no pertenece a una lista
% Dom: elemento X lista
% MetaPrimaria: noPertenece2/2
% MetaSecundaria: add/3
noPertenece2(_, []) :- !.
noPertenece2(Elem, [Cabeza|Cola]) :-
    Elem \= Cabeza,
    noPertenece2(Elem, Cola).
add(Elemento,Lista,[Elemento|Lista]).

% nombre predicado: addUser
% Descripcion: predicado que agrega un usuario a la lista de usuarios si no est� ya presente
% Dom: userName X users X newUsers
% MetaPrimaria: addUser/3
% MetaSecundaria: noPertenece/2, append/3, user/2
addUser([],Name,[Name]).
addUser(UserRegistered, Users, NewUsers):-
    noPertenece2(Users, UserRegistered),
    add(Users, UserRegistered, NewUsers).
addUser(UserRegistered, _, UserRegistered).

% RF9:
% nombre predicado: systemAddUser
% Descripcion: predicado que agrega un usuario a un sistema
% Dom: system X userName X newSystem
% MetaPrimaria: systemAddUser/3
% MetaSecundaria: addUser/3
systemAddUser(System, UserName, NewSystem):-
    getSystemName(System, SystemName),
    getSystemInitialChatbotCodeLink(System, InitialChatbotCodeLink),
    getSystemChatbots(System, Chatbots),
    getUsuarioRegistrado(System, UserRegistered),
    getUsuarioLogeado(System, UserLogin),
    getSystemChatHistory(System, ChatHistory),
    addUser(UserRegistered, UserName, NewUsers),
    auxSystem(SystemName, InitialChatbotCodeLink, Chatbots, NewUsers, UserLogin, ChatHistory, NewSystem).

% nombre predicado: userRegistered
% Descripcion: Verifica si un usuario está registrado en el sistema
% Dom: userName X users
% MetaPrimaria: userRegistered/2
% MetaSecundaria: pertenece/2
userRegistered(UserName, Users) :-
    pertenece(UserName, Users).

% nombre predicado: userLogged
% Descripcion: Verifica si hay una sesion activa en el sistema
% Dom: userLogin
% MetaPrimaria: userLogged/1
userLogged(UserLogin) :-
    UserLogin \= [].

% RFN10: systemLogin
% nombre predicado: systemLogin
% Descripcion: Permite a un usuario iniciar sesion en el sistema
% Dom: system X userName X newSystem
% MetaPrimaria: systemLogin/3
systemLogin([SystemName, InitialChatbotCodeLink, Chatbots, Users, UserLogin, ChatHistory], UserName, [SystemName, InitialChatbotCodeLink, Chatbots, Users, [UserName], ChatHistory]) :-
    userRegistered(UserName, Users),
    \+ userLogged(UserLogin).

% RFN 11: systemLogout
% nombre predicado: systemLogout
% Descripcion: Permite a un usuario cerrar sesion en el sistema
% Dom: system X newSystem
% MetaPrimaria: systemLogout/2
% MetaSecundaria: getUsuarioLogeado/2, setUsuarioLogeado/3
systemLogout(System, NewSystem):-
    getUsuarioLogeado(System, UsuarioLogeado),
    \+ UsuarioLogeado = [],
    setUsuarioLogeado(System, [], NewSystem).

% RFN 12: systemTalkRec
% Nombre predicado: systemTalkRec
% Descripcion: Predicado que permite interactuar con un chatbot.
% Prerrequisitos: Solo se puede conversar si se ha iniciado una sesion con un usuario previamente registrado.
% Dom: system X message (string) X system
% MetaPrimaria: systemTalkRec/3
systemTalkRec(System, Message, NewSystem) :-
    getUsuarioLogeado(System, UserLogin),
    userLogged(UserLogin),  % Verifica que hay una sesion iniciada con el usuario.
    getSystemInitialChatbotCodeLink(System, InitialChatbotCodeLink),
    getSystemChatbots(System, Chatbots),
    findChatbot(Chatbots, InitialChatbotCodeLink, CurrentChatbot),
    processMessage(CurrentChatbot, Message, Response),
    updateSystemWithResponse(System, Response, NewSystem).

% nombre predicado: findChatbot
% Descripcion: predicado que busca un chatbot en una lista de chatbots
% Dom: chatbots X chatbotID X chatbot
% MetaPrimaria: findChatbot/3
% MetaSecundaria: getChatbotID/2
findChatbot([Chatbot|_], ID, Chatbot) :-
    getChatbotID(Chatbot, ID).
findChatbot([_|Tail], ID, Result) :-
    findChatbot(Tail, ID, Result).

% nombre predicado: processMessage
% Descripcion: predicado que procesa un mensaje y devuelve la respuesta del chatbot.
% Dom: chatbot X message X response
% MetaPrimaria: processMessage/3
% MetaSecundaria: getChatbotFlows/2, getCurrentFlow/2, getFlowOptions/2, matchMessageToOption/3
processMessage(Chatbot, Message, Response) :-
    getChatbotFlows(Chatbot, Flows),
    getCurrentFlow(Flows, CurrentFlow),
    getFlowOptions(CurrentFlow, Options),
    matchMessageToOption(Message, Options, MatchedOption),
    MatchedOption = option(_, Response, _, _, _).

% nombre predicado: getCurrentFlow
% Descripcion: predicado que obtiene el flujo actual de un chatbot.
% Dom: flows X currentFlow
% MetaPrimaria: getCurrentFlow/2
getCurrentFlow(Flows, CurrentFlow) :-
    Flows = [CurrentFlow|_].

% nombre predicado: matchMessageToOption
% Descripcion: predicado que verifica si un mensaje coincide con una opcion.
% Dom: message X options X matchedOption
% MetaPrimaria: matchMessageToOption/3
% MetaSecundaria: pertenece/2
matchMessageToOption(Message, Options, MatchedOption) :-
    pertenece(Option, Options),
    Option = option(_, _, _, _, Keywords),
    pertenece(Message, Keywords),
    MatchedOption = Option.

% nombre predicado: updateSystemWithResponse
% Descripcion: predicado que actualiza el sistema con la respuesta del chatbot.
% Dom: system X response X newSystem
% MetaPrimaria: updateSystemWithResponse/3
% MetaSecundaria: getSystemChatHistory/2, append/3, setSystemChatHistory/3
updateSystemWithResponse(System, Response, NewSystem) :-
    getSystemChatHistory(System, ChatHistory),
    append(ChatHistory, [Response], UpdatedChatHistory),
    setSystemChatHistory(System, UpdatedChatHistory, NewSystem).

% nombre predicado: setSystemChatHistory
% Descripcion: predicado que modifica el historial de un sistema
% Dom: system X chatHistory X newSystem
% MetaPrimaria: setSystemChatHistory/3
setSystemChatHistory([SystemName, InitialChatbotCodeLink, Chatbots, Users, UserLogin, _], UpdatedChatHistory, [SystemName, InitialChatbotCodeLink, Chatbots, Users, UserLogin, UpdatedChatHistory]).

