% TDA_System_21133732_PachecoParra.pl

:- consult('TDA_Chatbot_21133732_PachecoParra.pl').
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