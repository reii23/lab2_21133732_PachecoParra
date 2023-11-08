% TDA_Chatbot_21133732_PachecoParra.pl

:- consult('TDA_Flow_21133732_PachecoParra.pl').
:- consult('TDA_Option_21133732_PachecoParra.pl').

% ---------------------------------------

% RF5:
% nombre predicado: chatbot
% Descripción: predicado constructor de un chatbot
% Dom: id X name X welcomeMessage X startFlowId X flowsIn X chatbot
% MetaPrimaria: chatbot/6
% MetaSecundaria: removeDuplicates/4
chatbot(ChatbotID, NameChatbot, WelcomeMessage, StartFlowId, FlowsIn, [ChatbotID, NameChatbot, WelcomeMessage, StartFlowId, FlowsOut]):-
    removeDuplicates(FlowsIn, [], FlowsOut, []).

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

% nombre predicado: chatbotAddFlow
% Descripción: predicado que agrega un flujo a un chatbot de manera recursiva
% Dom: chatbot X flow X newChatbot
% MetaPrimaria: chatbotAddFlow/3
% MetaSecundaria: getChatbotID/2, getChatbotName/2, getChatbotWelcomeMessage/2, getChatbotStartFlowId/2, getChatbotFlows/2, removeDuplicatesFlow/4, chatbot/6
chatbotAddFlow(Chatbot, [], Chatbot).
chatbotAddFlow(Chatbot, [Flow|RestFlows], NewChatbot) :- 
    getChatbotID(Chatbot, ID),
    getChatbotName(Chatbot, NameChatbot),
    getChatbotWelcomeMessage(Chatbot, WelcomeMessage),
    getChatbotStartFlowId(Chatbot, StartFlowId),
    getChatbotFlows(Chatbot, Flows),
    removeDuplicatesFlow([Flow], Flows, NewFlows, []),
    chatbot(ID, NameChatbot, WelcomeMessage, StartFlowId, NewFlows, TempChatbot),
    chatbotAddFlow(TempChatbot, RestFlows, NewChatbot).

% nombre predicado: removeDuplicatesFlow
% Descripción: predicado que elimina los flujos duplicados de una lista de flujos
% Dom: flow X flows X newFlows
% MetaPrimaria: removeDuplicatesFlow/3
% MetaSecundaria: getFlowId/2, noPertenece/2
removeDuplicatesFlow([AddElem|AddRest], ListaAcc, ListaOut, IdVisitadas):-
    getFlowId(AddElem, ID),
    noPertenece(ID, IdVisitadas),
    removeDuplicatesFlow(AddRest, [AddElem|ListaAcc], ListaOut, [ID|IdVisitadas]).
removeDuplicatesFlow([_|AddRest], ListaAcc, ListaOut, IdVisitadas) :-
    removeDuplicatesFlow(AddRest, ListaAcc, ListaOut, IdVisitadas).

% nombre predicado: newChatbot
% Descripción: predicado que crea un nuevo chatbot sin duplicados
% Dom: id X name X welcomeMessage X startFlowId X flows X chatbot
% MetaPrimaria: newChatbot/6
newChatbot(ChatbotID, NameChatbot, WelcomeMessage, StartFlowId, Flows, [ChatbotID, NameChatbot, WelcomeMessage, StartFlowId, Flows]).

% pruebas
% option(1, "1 - viajar", 2, 4, ["viajar", "turistear", "conocer"], O1), option(2, "2 - estudiar", 4, 3, ["aprender", "perfeccionarme"], O2), flow(1, "Flujo 1: mensaje de prueba", [], F1), flow(2, "Flujo 2: mensaje de prueba", [O1, O2, 02, 02, 02, 02, 02], F2), chatbot(10, "Chatbot 10", "Bienvenido al chatbot 10", 10, [F1, F2, F1], C10).