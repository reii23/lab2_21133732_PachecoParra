% TDA_Flow_21133732_PachecoParra.

% RF3:
% nombre funcion: flow
% Descripción: predicado constructor de un flujo de un chatbot
% Dom: id X namemessage X optionIn X flow
% MetaPrimaria: flow/4
% MetaSecundaria: removeDuplicates/4
flow(Id, NameMessage, OptionsIn, [Id, NameMessage, OptionsNoDuplicados]):-
    removeDuplicates(OptionsIn, [], OptionsNoDuplicados, []).