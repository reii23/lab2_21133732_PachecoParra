% nombre predicado: user
% Descripción: predicado constructor de un usuario
% Dom: userName X user
% MetaPrimaria: user/2
user(UserName, [UserName]).

% nombre predicado: getUsername
% Descripción: predicado que devuelve el nombre de un usuario
% Dom: user X userName
% MetaPrimaria: getUsername/2
% MetaSecundaria: user/2
getUsername(User, UserName):-
    user(UserName, User).