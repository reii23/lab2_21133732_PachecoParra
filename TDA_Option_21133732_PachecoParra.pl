% TDA_Option_21133732_PachecoParra.pl

% ---------------------------------------------------------------------------------------------
% RF2:
% nombre predicado: option
% Descripción: predicado constructor de una opción de un chatbot. Cada opción se enlaza a un chatbot y flujo especificado por su respectivo codigo
% Dom: code X message X chatbotCodeLink X initialFlowCodeLink X keywords X option
% MetaPrimaria: option/6
option(Code, Message, ChatbotCodeLink, InitialFlowCodeLink, Keywords, [Code, Message, ChatbotCodeLink, InitialFlowCodeLink, Keywords]).

% nombre predicado: getOptionCode
% Descripción: predicado que devuelve el código de una opción
% Dom: option X code
% MetaPrimaria: getOptionCode/2
% MetaSecundaria: option/6
getOptionCode(Option, Code) :-
    option(Code, _, _, _, _, Option).

% nombre predicado: getOptionMessage
% Descripción: predicado que devuelve el mensaje de una opción
% Dom: option X message
% MetaPrimaria: getOptionMessage/2
% MetaSecundaria: option/6
getOptionMessage(Option, Message) :-
    option(_, Message, _, _, _, Option).

% nombre predicado: getOptionChatbotCodeLink
% Descripción: predicado que devuelve el código de un chatbot al que se enlaza una opción
% Dom: option X chatbotCodeLink
% MetaPrimaria: getOptionChatbotCodeLink/2
% MetaSecundaria: option/6
getOptionChatbotCodeLink(Option, ChatbotCodeLink):-
    option(_, _, ChatbotCodeLink, _, _, Option).

% nombre predicado: getOptionInitialFlowCodeLink
% Descripción: predicado que devuelve el código de un flujo inicial al que se enlaza una opción 
% Dom: option X initialFlowCodeLink
% MetaPrimaria: getOptionInitialFlowCodeLink/2
% MetaSecundaria: option/6
getOptionInitialFlowCodeLink(Option, InitialFlowCodeLink):-
    option(_, _, _, InitialFlowCodeLink, _, Option).

% nombre predicado: getOptionKeywords
% Descripción: predicado que devuelve las palabras clave de una opción
% Dom: option X keywords
% MetaPrimaria: getOptionKeywords/2
% MetaSecundaria: option/6
getOptionKeywords(Option, Keywords):-
    option(_, _, _, _, Keywords, Option).

% pruebas
% probar option(1, "1 - viajar", 2, 4, ["viajar", "turistear", "conocer"], O1). 
% probar option(2, "2 - estudiar", 4, 3, ["aprender", "perfeccionarme"], O2).

% option(1, "1 - viajar", 2, 4, ["viajar", "turistear", "conocer"], O1), option(2, "2 - estudiar", 4, 3, ["aprender", "perfeccionarme"], O2), flow(2, "Flujo 14: mensaje de prueba", [O1, O2, O2, O1, O1], F14).
