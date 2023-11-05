% TDA_Chatbot_21133732_PachecoParra.pl

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
