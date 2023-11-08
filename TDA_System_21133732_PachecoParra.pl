% TDA_System_21133732_PachecoParra.pl

:- consult('TDA_Chatbot_21133732_PachecoParra.pl').

% RF7:
% nombre predicado: system
% Descripción: predicado constructor de un sistema de chatbots
% Dom: nameSystem X initialChatbotCodeLink X chatbotsIn X system
% MetaPrimaria: system/4
% MetaSecundaria: removeDuplicates/4
system(SystemName, InitialChatbotCodeLink, Chatbots, [SystemName, InitialChatbotCodeLink, Chatbots, [], [], []]).

% pruebas
% system("NewSystem", 0, [ ], S0).
% system("NewSystem", 1, [CB11], S1).