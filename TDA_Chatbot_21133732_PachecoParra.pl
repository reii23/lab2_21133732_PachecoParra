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

