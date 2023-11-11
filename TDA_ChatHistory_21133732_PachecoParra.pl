
% TDA_ChatHistory_21133732_PachecoParra.pl

% nombre predicado: chatHistory
% Descripción: predicado que devuelve el historial de un chat
% Dom: chat X chatHistory
% MetaPrimaria: chatHistory/2
% MetaSecundaria: chat/2
chatHistory(Chat, ChatHistory):-
    chat(ChatHistory, Chat).

% nombre predicado: getChatHistory
% Descripción: predicado que devuelve el historial de un chat
% Dom: chat X chatHistory
% MetaPrimaria: getChatHistory/2
% MetaSecundaria: chatHistory/2
getChatHistory(Chat, ChatHistory):-
    chatHistory(Chat, ChatHistory).
