% TDA_System_21133732_PachecoParra.pl

:- consult('TDA_Chatbot_21133732_PachecoParra.pl').
:- consult('TDA_ChatHistory_21133732_PachecoParra.pl').
:- consult('TDA_User_21133732_PachecoParra.pl').

% RF7:
% nombre predicado: system
% Descripción: predicado constructor de un sistema de chatbots
% Dom: nameSystem X initialChatbotCodeLink X chatbotsIn X system
% MetaPrimaria: system/4
% MetaSecundaria: removeDuplicates/4
system(SystemName, InitialChatbotCodeLink, ChatbotsIn, [SystemName, InitialChatbotCodeLink, ChatbotsOut, [], [], []]):-
    removeDuplicates(ChatbotsIn, [], ChatbotsOut, []).

% nombre predicado: auxSystem
% Descripción: predicado constructor auxiliar de un sistema de chatbots
% Dom: nameSystem X initialChatbotCodeLink X chatbotsIn X users X userLogin X chatHistory X system
% MetaPrimaria: auxSystem/7
auxSystem(SystemName, InitialChatbotCodeLink, Chatbots, Users, UserLogin, ChatHistory, [SystemName, InitialChatbotCodeLink, Chatbots, Users, UserLogin, ChatHistory]).

% nombre predicado: getSystemName
% Descripción: predicado que devuelve el nombre de un sistema
% Dom: system X Systemname
% MetaPrimaria: getSystemName/2
getSystemName([SystemName|_], SystemName).

% nombre predicado: getSystemInitialChatbotCodeLink
% Descripción: predicado que devuelve el link del chatbot inicial de un sistema
% Dom: system X InitialChatbotCodeLink
% MetaPrimaria: getSystemInitialChatbotCodeLink/2
getSystemInitialChatbotCodeLink([_, InitialChatbotCodeLink|_], InitialChatbotCodeLink).

% nombre predicado: getSystemChatbots
% Descripción: predicado que devuelve los chatbots de un sistema
% Dom: system X Chatbots
% MetaPrimaria: getSystemChatbots/2
getSystemChatbots([_,_,Chatbots|_], Chatbots).

% nombre predicado: getSystemChatHistory
% Descripción: predicado que devuelve el historial de un sistema
% Dom: system X ChatHistory
% MetaPrimaria: getSystemChatHistory/2
getSystemChatHistory([_, _, _, _, ChatHistory, _], ChatHistory).

% nombre predicado: getUsuarioRegistrado
% Descripción: predicado que devuelve los usuarios registrados en el sistema
% Dom: system X Users
% MetaPrimaria: getUsuarioRegistrado/2
getUsuarioRegistrado([_, _, _, Users, _, _], Users).

% nombre funcion: getUsuarioLogeado
% Descripción: predicado que devuelve el usuario logueado en el sistema
% Dom: system X userLogin
% MetaPrimaria: getUsuarioLogeado/2
getUsuarioLogeado([_, _, _, _, UserLogin, _], UserLogin).

% nombre predicado: setUsuarioLogeado
% Descripción: predicado que modifica el usuario logueado en el sistema
% Dom: system X userLogin X newSystem
% MetaPrimaria: setUsuarioLogeado/3
setUsuarioLogeado([SystemName, InitialChatbotCodeLink, Chatbots, Users, _, ChatHistory], UserLogin, [SystemName, InitialChatbotCodeLink, Chatbots, Users, UserLogin, ChatHistory]).

% nombre predicado: removeDuplicatesChatbot
% Descripción: predicado que elimina los chatbots duplicados de una lista de chatbots
% Dom: chatbot X chatbots X newChatbots
% MetaPrimaria: removeDuplicatesChatbot/3
% MetaSecundaria: getChatbotID/2, noPertenece/2
removeDuplicatesChatbot(Chatbot, Chatbots, NewChatbots, IdVisitadas):-
    getChatbotID(Chatbot, ChatbotID),
    noPertenece(ChatbotID, IdVisitadas),
    NewChatbots = [Chatbot | Chatbots].
removeDuplicatesChatbot(_, Chatbots, Chatbots, _).

% RF8:
% nombre predicado: systemAddChatbot
% Descripción: predicado que agrega un chatbot a un sistema
% Dom: system X chatbot X system
% Meta Primaria: systemAddChatbot/3
% Meta Secundaria: getSystemName/2, getSystemInitialChatbotCodeLink/2, getSystemChatbots/2, removeDuplicatesChatbot/4, system/4
systemAddChatbot(System, Chatbot, NewSystem):-
    getSystemName(System, SystemName),
    getSystemInitialChatbotCodeLink(System, InitialChatbotCodeLink),
    getSystemChatbots(System, Chatbots),
    removeDuplicatesChatbot(Chatbot, Chatbots, NewChatbots, []),
    system(SystemName, InitialChatbotCodeLink, NewChatbots, NewSystem).

% nombre funcion: noPertenece2
% Descripción: predicado que verifica si un elemento no pertenece a una lista
% Dom: elemento X lista
% MetaPrimaria: noPertenece2/2
% MetaSecundaria: add/3
noPertenece2(_, []) :- !.
noPertenece2(Elem, [Cabeza|Cola]) :-
    Elem \= Cabeza,
    noPertenece2(Elem, Cola). 
add(Elemento,Lista,[Elemento|Lista]).

% nombre predicado: addUser
% Descripción: predicado que agrega un usuario a la lista de usuarios si no está ya presente
% Dom: userName X users X newUsers
% MetaPrimaria: addUser/3
% MetaSecundaria: noPertenece/2, append/3, user/2
addUser([],Name,[Name]).
addUser(UserRegistered, Users, NewUsers):-
    noPertenece2(Users, UserRegistered),  % Verifica que UserName no esté en la lista de Users
    add(Users, UserRegistered, NewUsers).
addUser(UserRegistered, _, UserRegistered).  % Si UserName ya está en Users, deja la lista como está

% RF9:
% nombre predicado: systemAddUser
% Descripción: predicado que agrega un usuario a un sistema
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

% nombre función: userRegistered
% Descripción: Verifica si un usuario está registrado en el sistema
% Dom: userName X users
% MetaPrimaria: userRegistered/2
% MetaSecundaria: pertenece/2
userRegistered(UserName, Users) :-
    pertenece(UserName, Users).

% nombre función: userLogged
% Descripción: Verifica si hay una sesión activa en el sistema
% Dom: userLogin
% MetaPrimaria: userLogged/1
userLogged(UserLogin) :-
    UserLogin \= [].

% RFN10: systemLogin
% nombre predicado: systemLogin
% Descripción: Permite a un usuario iniciar sesión en el sistema
% Dom: system X userName X newSystem
% MetaPrimaria: systemLogin/3
systemLogin([SystemName, InitialChatbotCodeLink, Chatbots, Users, UserLogin, ChatHistory], UserName, [SystemName, InitialChatbotCodeLink, Chatbots, Users, [UserName], ChatHistory]) :-
    userRegistered(UserName, Users),
    \+ userLogged(UserLogin).

% pruebas
% systemLogin(S3, "user0", S4).

% pruebas hasta aquí option(1, "1 - viajar", 2, 4, ["viajar", "turistear", "conocer"], O1), option(2, "2 - estudiar", 4, 3, ["aprender", "perfeccionarme"], O2), flow(1, "Flujo 1: mensaje de prueba", [], F1), flow(2, "Flujo 2: mensaje de prueba", [O1, O2, 02, 02, 02, 02, 02], F2), chatbot(10, "Chatbot 10", "Bienvenido al chatbot 10", 10, [F1, F2, F1], C10), system("NewSystem", 0, [ ], S0), systemAddChatbot(S0, C10, S1), systemAddUser(S1, "user0", S2), systemAddUser(S2, "user1", S3), systemLogin(S3, "user0", S4).

% RFN 11: systemLogout
% nombre predicado: systemLogout
% Descripción: Permite a un usuario cerrar sesión en el sistema
% Dom: system X newSystem
% MetaPrimaria: systemLogout/2
% MetaSecundaria: getUsuarioLogeado/2, setUsuarioLogeado/3
systemLogout(System, NewSystem):-
    getUsuarioLogeado(System, UsuarioLogeado),
    \+ UsuarioLogeado = [],
    setUsuarioLogeado(System, [], NewSystem).

% RFN 12: systemTalkRec
% nombre predicado: systemTalkRec
% Descripción: Permite a un usuario interactuar con el sistema
% Dom: system X message X newSystem
% MetaPrimaria: systemTalkRec/3

% systemTalkRec(S4, "hola", S5),
% systemTalkRec(S5, "viajar", S6).

