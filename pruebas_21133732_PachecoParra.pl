% pruebas_21133732_PachecoParra.pl
:- consult('TDA_System_21133732_PachecoParra.pl').

% Pruebas Laboratorio 2 Paradigmas de Programación - Prolog

% en el siguiente script de pruebas del laboratorio 2 de Paradigmas de Programación se encuentran las pruebas de los predicados realizados

% si en las consultas aparecen [...] se debe copiar y pegar el siguiente codigo en la primera consulta:
% set_prolog_flag(answer_write_options,[max_depth(0)]).

% -------------------------------Script Profesor--------------------------------------
% este es el script que se encuentra en el documento oficial del laboratorio 2

% casos en que la consulta debe retornar false: (se deben descomentar los casos en el mismo script de abajo)
% systemAddChatbot(S0, CB0, S1), (entrega false ya que se agrega un chatbot con un id duplicado)
% systemAddUser(S3, "user2", S4), (entrega false ya que se agrega un usuario que ya se encuentra en el sistema)
% systemLogin(S5, "user8", S6), (entrega false ya que se intenta logear un usuario que no está registrado en el sistema)
% systemLogin(S7, "user2", S8), (entrega false ya que se intenga logear un usuario cuando ya hay otro logeado en el sistema)

% se debe copiar y pegar la siguiente consulta:
/*
option(1, "1) Viajar", 12, 1, ["viajar", "turistear", "conocer"], OP1),
option(2, "2) Estudiar", 2, 1, ["estudiar", "aprender", "perfeccionarme"], OP2),
flow(1, "flujo1", [OP1], F10),
flowAddOption(F10, OP2, F11),
% flowAddOption(F10, OP1, F12), %si esto se descomenta, debe dar false, porque es opción con id duplicada.
% flowAddOption(F99, OP1, F100), % si esto se descomenta debe dar false ya que F99 no existe
chatbot(0, "Inicial", "Bienvenido\n¿Qué te gustaría hacer?", 1, [F11], CB0), %solo añade una ocurrencia de F11
%Chatbot1
option(1, "1) New York, USA", 1, 2, ["USA", "Estados Unidos", "New York"], OP3),
option(2, "2) París, Francia", 1, 1, ["Paris", "Eiffel"], OP4),
option(3, "3) Torres del Paine, Chile", 1, 1, ["Chile", "Torres", "Paine", "Torres Paine", "Torres del Paine"], OP5),
option(4, "4) Volver", 0, 1, ["Regresar", "Salir", "Volver"], OP6),
%Opciones segundo flujo Chatbot1
option(1, "1) Central Park", 1, 2, ["Central", "Park", "Central Park"], OP7),
option(2, "2) Museos", 1, 2, ["Museo"], OP8),
option(3, "3) Ningún otro atractivo", 1, 3, ["Museo"], OP9),
option(4, "4) Cambiar destino", 1, 1, ["Cambiar", "Volver", "Salir"], OP10),
option(1, "1) Solo", 1, 3, ["Solo"], OP11),
option(2, "2) En pareja", 1, 3, ["Pareja"], OP12),
option(3, "3) En familia", 1, 3, ["Familia"], OP13),
option(4, "4) Agregar más atractivos", 1, 2, ["Volver", "Atractivos"], OP14),
option(5, "5) En realidad quiero otro destino", 1, 1, ["Cambiar destino"], OP15),
flow(1, "Flujo 1 Chatbot1\n¿Dónde te Gustaría ir?", [OP3, OP4, OP5, OP6], F20),
flow(2, "Flujo 2 Chatbot1\n¿Qué atractivos te gustaría visitar?", [OP7, OP8, OP9, OP10], F21),
flow(3, "Flujo 3 Chatbot1\n¿Vas solo o acompañado?", [OP11, OP12, OP13, OP14, OP15], F22),
chatbot(1, "Agencia Viajes",  "Bienvenido\n¿Dónde quieres viajar?", 1, [F20, F21, F22], CB1),
% chatbotAddFlow(CB1, F20, CB30), % si se descomenta esto, debe dar false, ya que CB1 ya tiene F20  
%Chatbot2
option(1, "1) Carrera Técnica", 2, 1, ["Técnica"], OP16),
option(2, "2) Postgrado", 2, 1, ["Doctorado", "Magister", "Postgrado"], OP17),
option(3, "3) Volver", 0, 1, ["Volver", "Salir", "Regresar"], OP18),
flow(1, "Flujo 1 Chatbot2\n¿Qué te gustaría estudiar?", [OP16, OP17, OP18], F30),
chatbot(2, "Orientador Académico",  "Bienvenido\n¿Qué te gustaría estudiar?", 1, [F30], CB2),
% Chatbot99
chatbot(99, "Chatbot99", "Bienvenido\n¿Qué te gustaría hacer?", 1, [], CB99),
chatbotAddFlow(CB99, F10, CB100),
chatbotAddFlow(CB100, F11, CB101),
system("Chatbots Paradigmas", 0, [CB0], S0),
% systemAddChatbot(S0, CB0, S1), %si esto se descomenta, debe dar false, porque es chatbot id duplicado.
systemAddChatbot(S0, CB1, S01),
systemAddChatbot(S01, CB2, S02),
systemAddUser(S02, "user1", S2),
systemAddUser(S2, "user2", S3),
% systemAddUser(S3, "user2", S4), %si esto se descomenta, debe dar false, porque es username duplicado
systemAddUser(S3, "user3", S5),
% systemLogin(S5, "user8", S6), %si esto se descomenta, debe dar false ;user8 no existe.
systemLogin(S5, "user1", S7),
% systemLogin(S7, "user2", S8), %si esto se descomenta, debe dar false, ya hay usuario con login
systemLogout(S7, S9),
systemLogin(S9, "user2", S10).
% systemTalkRec(S10, "hola", S11), %si esto se descomenta, debe dar false, hola no es parte de los keywords
% systemTalkRec(S10, "1", S12),
% systemTalkRec(S12, "1", S13),
% systemTalkRec(S13, "Museo", S14),
% systemTalkRec(S14, "1", S15),
% systemTalkRec(S15, "3", S16),
% systemTalkRec(S16, "5", S17).
% para probar los demas ir poniendo un . en el final si se descomenta.
*/


% ----------------------- Script Alumno ----------------------------

% este es el script creado por el alumno que simula |un chatbot de cocina

% casos en que el script debe retornar false: (se deben descomentar los casos en el mismo script de abajo)
% systemAddChatbot(S1, CB1, S2), (entrega false ya que se agrega un chatbot con un id duplicado)
% systemAddChatbot(S1, CB1, S3), (entrega false ya que se agrega un chatbot con un id duplicado)
% systemAddUser(S5, "chef1", S6), (entrega false ya que el usuario ya está registrado en el sistema)
% systemLogin(S8, "chef2", S9), (entrega false ya que ya hay un usuario que tiene sesión iniciada en el sistema)
% systemLogin(S11, "chef3", S12), (entrega false ya que ya hay un usuario que tiene sesión iniciada en el sistema)
% systemLogin(S13, "chef4", S14), (entrega false ya que el usuario no está registrado en el sistema)

% se debe copiar y pegar la siguiente consulta:
/*
option(1, "1) Entradas", 1, 2, ["Entradas", "Aperitivos", "entrada"], OP1),
option(2, "2) Platos Principales", 1, 1, ["Plato Principal", "Fuerte"], OP2),
option(3, "3) Postres", 1, 1, ["Postre", "Dulce"], OP3),
option(4, "4) Salir", 0, 1, ["Salir", "Terminar"], OP4),
option(1, "1) Baja", 1, 2, ["Facil", "Simple", "Baja"], OP5),
option(2, "2) Media", 1, 2, ["Intermedio", "Medio"], OP6),
option(3, "3) Alta", 1, 3, ["Dificil", "Alto"], OP7),
option(4, "4) Ver todas las recetas", 1, 2, ["Todos", "Listar"], OP8),
option(5, "5) Cambiar tipo de plato", 1, 1, ["Cambiar", "Otro tipo"], OP9),
flow(1, "Flujo 1 ChatbotCocina\n¿Qué te gustaría cocinar?", [OP1, OP2, OP3, OP4], F1),
flow(2, "Flujo 2 ChatbotCocina\n¿Qué nivel de dificultad prefieres para tu receta?", [OP5, OP6, OP7, OP8, OP9], F2),
flow(3, "Flujo 3 ChatbotCocina\n¿Qué receta te gustaría ver?", [OP4], F3),
chatbot(1, "CocinaBot", "Bienvenido a CocinaBot\n¿Qué receta buscas?", 1, [F1, F2], CB1),
chatbot(2, "CocinaBot2", "Bienvenido a CocinaBot2\n¿Qué receta buscas?", 1, [F1, F2], CB2),
chatbot(3, "CocinaBot3", "Bienvenido a CocinaBot3\n¿Qué receta buscas?", 1, [F1, F2], CB3),
system("SistemaCocinaBot", 0, [], S0),
system("SistemaCocinaBot2", 0, [], S20),
system("SistemaCocinaBot3", 0, [], S22),
systemAddChatbot(S0, CB1, S1),
% systemAddChatbot(S1, CB1, S2), % debe retornar false, ya que CB1 ya está en el sistema
% systemAddChatbot(S1, CB1, S3), % debe retornar false por duplicidad
systemAddChatbot(S1, CB2, S2), 
systemAddChatbot(S2, CB3, S3),
systemAddUser(S1, "chef1", S4),
systemAddUser(S4, "chef2", S5),
% systemAddUser(S5, "chef1", S6), % debe retornar false, ya que "chef1" ya está en el sistema
systemAddUser(S5, "chef3", S7), 
systemLogin(S7, "chef1", S8),
% systemLogin(S8, "chef2", S9), % debe retornar false, "chef1" ya inició sesión
systemLogout(S8, S10), % "chef1" 
systemLogin(S10, "chef2", S11), 
% systemLogin(S11, "chef3", S12), % debe retornar false, "chef2" ya inició sesión
systemLogout(S11, S13), 
% systemLogin(S13, "chef4", S14), % debe retornar false, "chef4" no está registrado
systemLogin(S13, "chef3", S15), 
systemLogout(S15, S16),
systemLogin(S16, "chef1", S17), 
systemLogout(S17, S18),
systemLogin(S18, "chef2", S19).
% systemTalkRec(S19, "hola", S25). %si esto se descomenta, debe dar false, hola no es parte de los keywords
% systemTalkRec(S25, "1", S26). %si esto se descomenta, debe dar false ya que S25 no existe
% systemTalkRec(SS26, "1", S27). %si esto se descomenta, debe dar false ya que S26 da false

% para probar los demas ir poniendo un . en el final si se descomenta.
*/




