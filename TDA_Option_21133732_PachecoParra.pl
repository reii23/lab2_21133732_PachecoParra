% TDA_Option_21133732_PachecoParra.pl

% ---------------------------------------------------------------------------------------------
% RF2:
% nombre funcion: option
% Descripción: predicado constructor de una opción de un chatbot. Cada opción se enlaza a un chatbot y flujo especificado por su respectivo codigo
% Dom: code X message X chatbotCodeLink X initialFlowCodeLink X keywords X option
% MetaPrimaria: option/6
option(Code, Message, ChatbotCodeLink, InitialFlowCodeLink, Keywords, [Code, Message, ChatbotCodeLink, InitialFlowCodeLink, Keywords]).

% nombre funcion: getOptionCode
% Descripción: predicado que devuelve el código de una opción
% Dom: option X code
% MetaPrimaria: getOptionCode/2
% MetaSecundaria: option/6
getOptionCode(Option, Code) :-
    option(Code, _, _, _, _, Option).

% nombre funcion: getMessageOption
% Descripción: predicado que devuelve el mensaje de una opción
% Dom: option X message
% MetaPrimaria: getMessageOption/2
% MetaSecundaria: option/6
getMessageOption(Option, Message) :-
    option(_, Message, _, _, _, Option).

% pruebas
% probar option(1, "1 - viajar", 2, 4, ["viajar", "turistear", "conocer"], O1). 
% probar option(2, "2 - estudiar", 4, 3, ["aprender", "perfeccionarme"], O2).

% option(1, "1 - viajar", 2, 4, ["viajar", "turistear", "conocer"], O1), option(2, "2 - estudiar", 4, 3, ["aprender", "perfeccionarme"], O2), flow(2, "Flujo 14: mensaje de prueba", [O1, O2, O2, O1, O1], F14).
