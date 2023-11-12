% TDA_Chatbot_21133732_PachecoParra.pl

:- consult('TDA_Flow_21133732_PachecoParra.pl').
:- consult('TDA_Option_21133732_PachecoParra.pl').

% ---------------------------------------

% RF5:
% nombre predicado: chatbot
% Descripción: predicado constructor de un chatbot
% Dom: id X name X welcomeMessage X startFlowId X flowsIn X chatbot
% MetaPrimaria: chatbot/6
chatbot(ChatbotID, NameChatbot, WelcomeMessage, StartFlowId, FlowsIn, [ChatbotID, NameChatbot, WelcomeMessage, StartFlowId, FlowsOut]):-
    noFlowsDuplicados(FlowsIn),
    FlowsOut = FlowsIn.

% nombre predicado: newChatbot
% Descripción: predicado que crea un nuevo chatbot sin duplicados
% Dom: id X name X welcomeMessage X startFlowId X flows X chatbot
% MetaPrimaria: newChatbot/6
newChatbot(ChatbotID, NameChatbot, WelcomeMessage, StartFlowId, Flows, [ChatbotID, NameChatbot, WelcomeMessage, StartFlowId, Flows]).

% nombre predicado: getChatbotID
% Descripción: predicado que devuelve el id de un chatbot
% Dom: chatbot X id
% MetaPrimaria: getChatbotID/2
% MetaSecundaria: newChatbot/6
getChatbotID(Chatbot, ChatbotID):-
    newChatbot(ChatbotID, _, _, _, _, Chatbot).

% nombre predicado: getChatbotName
% Descripción: predicado que devuelve el nombre de un chatbot
% Dom: chatbot X nameChatbot
% MetaPrimaria: getChatbotName/2
% MetaSecundaria: newChatbot/6
getChatbotNameChatbot(Chatbot, NameChatbot):-
    newChatbot(_, NameChatbot, _, _, _, Chatbot).

% nombre predicado: getChatbotWelcomeMessage
% Descripción: predicado que devuelve el mensaje de bienvenida de un chatbot
% Dom: chatbot X welcomeMessage
% MetaPrimaria: getChatbotWelcomeMessage/2
% MetaSecundaria: newChatbot/6
getChatbotWelcomeMessage(Chatbot, WelcomeMessage):-
    newChatbot(_, _, WelcomeMessage, _, _, Chatbot).

% nombre predicado: getChatbotStartFlowId
% Descripción: predicado que devuelve el id del flujo inicial de un chatbot
% Dom: chatbot X startFlowId
% MetaPrimaria: getChatbotStartFlowId/2
% MetaSecundaria: newChatbot/6
getChatbotStartFlowId(Chatbot, StartFlowId):-
    newChatbot(_, _, _, StartFlowId, _, Chatbot).

% nombre predicado: getChatbotFlows
% Descripción: predicado que devuelve los flujos de un chatbot
% Dom: chatbot X flows
% MetaPrimaria: getChatbotFlows/2
% MetaSecundaria: newChatbot/6
getChatbotFlows(Chatbot, Flows):-
    newChatbot(_, _, _, _, Flows, Chatbot).

% RF6:
% nombre predicado: chatbotAddFlow
% Descripción: predicado que agrega un flujo a un chatbot (versión recursiva)
% Dom: chatbot X flow X newChatbot
% MetaPrimaria: chatbotAddFlow/3
% MetaSecundaria: getChatbotID, getChatbotName, getChatbotWelcomeMessage, getChatbotStartFlowId, getChatbotFlows, noFlowsDuplicados
chatbotAddFlow(Chatbot, Flow, NewChatbot) :-
    getChatbotFlows(Chatbot, CurrentFlows),
    noPertenece(Flow, CurrentFlows),  % Verificar si el flujo no está en los flujos actuales
    chatbotAddFlowRec(Chatbot, Flow, CurrentFlows, NewChatbot).

% nombre predicado: chatbotAddFlowRec
% Descripción: predicado auxiliar recursivo para agregar un flujo a un chatbot
% Dom: chatbot X flow X flows X newChatbot
% MetaPrimaria: chatbotAddFlowRec/4
% MetaSecundaria: getChatbotID, getChatbotName, getChatbotWelcomeMessage, getChatbotStartFlowId, getChatbotFlows, noFlowsDuplicados
chatbotAddFlowRec(Chatbot, Flow, CurrentFlows, NewChatbot) :-
    getChatbotID(Chatbot, ID),
    getChatbotNameChatbot(Chatbot, NameChatbot),
    getChatbotWelcomeMessage(Chatbot, WelcomeMessage),
    getChatbotStartFlowId(Chatbot, StartFlowId),
    chatbot(ID, NameChatbot, WelcomeMessage, StartFlowId, [Flow|CurrentFlows], NewChatbot).

% nombre predicado: noFlowsDuplicados
% Descripción: predicado que verifica si no hay flujos duplicados en una lista de flujos
% Dom: flows
% MetaPrimaria: noFlowsDuplicados/1
% MetaSecundaria: noPertenece
noFlowsDuplicados([]).
noFlowsDuplicados([Flow|Rest]):-
    noPertenece(Flow, Rest),  % Verificar que el flujo no esté en el Resto
    noFlowsDuplicados(Rest).