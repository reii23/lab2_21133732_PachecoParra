% TDA_Option_21133732_PachecoParra.pl

% ---------------------------------------------------------------------------------------------
% RF2:
% nombre predicado: option
% Descripcion: predicado constructor de una opcion de un chatbot. Cada opcion se enlaza a un chatbot y flujo especificado por su respectivo codigo
% Dom: code X message X chatbotCodeLink X initialFlowCodeLink X keywords X option
% MetaPrimaria: option/6
option(Code, Message, ChatbotCodeLink, InitialFlowCodeLink, Keywords, [Code, Message, ChatbotCodeLink, InitialFlowCodeLink, Keywords]).

% nombre predicado: getOptionCode
% Descripcion: predicado que devuelve el codigo de una opcion
% Dom: option X code
% MetaPrimaria: getOptionCode/2
% MetaSecundaria: option/6
getOptionCode(Option, Code) :-
    option(Code, _, _, _, _, Option).

% nombre predicado: getOptionMessage
% Descripcion: predicado que devuelve el mensaje de una opcion
% Dom: option X message
% MetaPrimaria: getOptionMessage/2
% MetaSecundaria: option/6
getOptionMessage(Option, Message) :-
    option(_, Message, _, _, _, Option).

% nombre predicado: getOptionChatbotCodeLink
% Descripcion: predicado que devuelve el codigo de un chatbot al que se enlaza una opcion
% Dom: option X chatbotCodeLink
% MetaPrimaria: getOptionChatbotCodeLink/2
% MetaSecundaria: option/6
getOptionChatbotCodeLink(Option, ChatbotCodeLink):-
    option(_, _, ChatbotCodeLink, _, _, Option).

% nombre predicado: getOptionInitialFlowCodeLink
% Descripcion: predicado que devuelve el codigo de un flujo inicial al que se enlaza una opcion 
% Dom: option X initialFlowCodeLink
% MetaPrimaria: getOptionInitialFlowCodeLink/2
% MetaSecundaria: option/6
getOptionInitialFlowCodeLink(Option, InitialFlowCodeLink):-
    option(_, _, _, InitialFlowCodeLink, _, Option).

% nombre predicado: getOptionKeywords
% Descripcion: predicado que devuelve las palabras clave de una opcion
% Dom: option X keywords
% MetaPrimaria: getOptionKeywords/2
% MetaSecundaria: option/6
getOptionKeywords(Option, Keywords):-
    option(_, _, _, _, Keywords, Option).

% pruebas
% probar option(1, "1 - viajar", 2, 4, ["viajar", "turistear", "conocer"], O1). 
% probar option(2, "2 - estudiar", 4, 3, ["aprender", "perfeccionarme"], O2).

% option(1, "1 - viajar", 2, 4, ["viajar", "turistear", "conocer"], O1), option(2, "2 - estudiar", 4, 3, ["aprender", "perfeccionarme"], O2), flow(2, "Flujo 14: mensaje de prueba", [O1, O2, O2, O1, O1], F14).
