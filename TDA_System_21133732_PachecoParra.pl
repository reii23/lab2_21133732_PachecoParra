% TDA_System_21133732_PachecoParra.pl

:- consult('TDA_Chatbot_21133732_PachecoParra.pl').

% RF7:
% nombre predicado: system
% Descripción: predicado constructor de un sistema de chatbots
% Dom: nameSystem X initialChatbotCodeLink X chatbotsIn X system
% MetaPrimaria: system/4
% MetaSecundaria: removeDuplicates/4
system(SystemName, InitialChatbotCodeLink, Chatbots, [SystemName, InitialChatbotCodeLink, Chatbots, [], [], []]).

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