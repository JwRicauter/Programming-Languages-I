%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EJERCICIO 1

% Dar una descripción breve de los siguentes conceptos relacionados a la programación en
% Prolog. Use ejemplos cuando sea posible.


% (1)
% Cláusula.
%		Una cláusula es la composición básica de un programa en Prolog. Esta
%		puede extenderse sobre más de una linea o puede haber muchas en una misma
%		linea. Además, está terminada obligatoriamente por un punto, seguido por al
%		menos un espacio en blanco.

% (2) 
% Comentario.
%		Un comentario es una parte de código la cual es ignorada por el compilador
%		en aras de proveer una explicación al código o proveer algún detalle. En prolog
%		los comentarios se realizan con el porcentaje, tal y como se puede ver en esta
%		definición.

% (3)
% Procedimiento.
%		Un procedimiento es un conjunto de acciones u operaciones que tienen que realizarse
%		de la misma forma, para obtener siempre el mismo resultado bajo las mismas circunstancias

% (4)
% Matching.
% 		El matching implica chequear entre dos términos si son indénticos o si variables
%		en ambos términos pueden tener los mismos objetos después de ser instanciadas
% 		Ejemplo:
%		date(D, M, 2006) = date(D1, feb, Y1) significa D = D1, M = feb, Y1 = 2006

% (5)
% Unificación.
%		Dados 2 terminos cualesquiere, T1 y T2, para que se unifiquen en PROLOG uno de ellos debe 
%		ser una variable no instanciada y al final acabara tomando el valor del otro.
%		Ejemplo:
%		A = 3+2, donde A es la variable no instanciada, si es así, evalúa 3+2 y unifica A con 5.

% (6)
% Base de datos / Base del conocimiento.
%		Una base de datos en prolog es una serie de hechos o reglas, con el motivo que mediante
%		estas, se pueda dar respuestas a preguntas sobre las relaciones planteadas. Un ejemplos
%		de esto es el tercer ejercicio de esta tarea, donde hay una base de datos a la cual
%		se le hacen preguntas.

% (7)
% Query.
%		Un query, como indica su nombre, es una consulta que se le hace al programa, este tipo
% 		de herramienta se termina con un punto y si no se quiere una única solucion a un query,
%		se dividen los querys por un espacio en blanco o por un punto y coma.
%		Ejemplo:
%		?- likes(profelovera, X).
%		X = mondongo ;
%		X = cachapabienresuerta ;
%		...
%		X = rompecolchon.
%		?-
%		El query de arriba le pregunta a Prolog que comida le gusta al 'profelovera'. El sistema
%		responde con X = <valor> si se puede probar que se puede llegar para una cierta X.		


% (8)
% Goal.
%		Un goal es algo que prolog intenta satisfacer encontrando valores para las variables
%		que hacen al goal tener éxito.
%		Ejemplo:
%		come(juancito, Comida), estudia(Estudiante, Materia).
%		donde los goals son come(juancito, Comida) Y estudia(Estudiante, Materia)

% (9)
% Consult.
%		El predicado consulta sirve para cargar archivos de extensión pl (Prolog), se utiliza
%		de ls siguiente manera: consult('unarchivo.pl')

% (10)
% Halt.
%		Halt es un comando de Prolog que se utiliza para frenar la ejecución de un programa.

% (11)
% Listing.
%		Enlista todos los predicados desde el modo llamador. Por ejemplo, si llamamos a listing
%		desde swipl, este nos enlistara las clausulas en el modulo de usuario por defecto.


% (12)
% Trace.
% 		Rastrear la ejecución de una consulta te permite ver todos los goals que estan ejecutándose
%		como parte de la consulta, en secuencia, mostrándo si tienen éxito o no. El rastreo te permite
%		también ver que pasos ocurren en el backtracking de Prolog. Cabe destacar que se detiene el 
%		rastreo con un notrace.
%		Ejemplo: tenemos las siguientes reglas.
%		factorial(0, 1).
%		factorial(N, NFact) :-
%	    N > 0,
%	    Nminus1 is N - 1,
%	    factorial(Nminus1, Nminus1Fact),
%	    NFact is Nminus1Fact * N.
%
%		Ahora ejecutándo trace.
%
%		prolog -s factorial.pl
%		blah blah blah …
%		?- trace.
%		true.
%		[trace]  ?- factorial(3, X).
%		   Call: (7) factorial(3, _G284) ? creep*
%		^  Call: (8) 3>0 ? creep
%		^  Exit: (8) 3>0 ? creep
%		^  Call: (8) _L205 is 3-1 ? creep
%		^  Exit: (8) 2 is 3-1 ? creep
%		   Call: (8) factorial(2, _L206) ? creep
%		^  Call: (9) 2>0 ? creep
%		^  Exit: (9) 2>0 ? creep
%		^  Call: (9) _L224 is 2-1 ? creep
%		^  Exit: (9) 1 is 2-1 ? creep
%		   Call: (9) factorial(1, _L225) ? creep
%		^  Call: (10) 1>0 ? creep
%		^  Exit: (10) 1>0 ? creep
%		^  Call: (10) _L243 is 1-1 ? creep
%		^  Exit: (10) 0 is 1-1 ? creep
%		   Call: (10) factorial(0, _L244) ? creep
%		   Exit: (10) factorial(0, 1) ? creep
%		^  Call: (10) _L225 is 1*1 ? creep
%		^  Exit: (10) 1 is 1*1 ? creep
%		   Exit: (9) factorial(1, 1) ? creep
%		^  Call: (9) _L206 is 1*2 ? creep
%		^  Exit: (9) 2 is 1*2 ? creep
%		   Exit: (8) factorial(2, 2) ? creep
%		^  Call: (8) _G284 is 2*3 ? creep
%		^  Exit: (8) 6 is 2*3 ? creep
%		   Exit: (7) factorial(3, 6) ? creep
%		
%		X = 6 ;
%		   Redo: (10) factorial(0, _L244) ? creep
%		^  Call: (11) 0>0 ? creep
%		^  Fail: (11) 0>0 ? creep
%		   Fail: (9) factorial(1, _L225) ? creep
%		   Fail: (8) factorial(2, _L206) ? creep
%		   Fail: (7) factorial(3, _G284) ? creep
%		
%		false.
%		[debug]  ?- notrace. % turn off tracing
%		
%		true.
%		[debug]  ?-


% (13)
% Spy.
%		Es posible usar el predicado spy para rastrear la ejecución de un programa de prolog.
% 		Una vez se tenga cargado tu programa de prolong usando consultas, configura un punto espia 
%		(spy point) en el predicado ancestro.
%		Ejemplo.
%		?- listing(happy).
%		happy(A) :-
%		        rich(A).
%		true.
%		?- listing(rich).
%		rich(fred).
%		true.
%		?- spy(rich).
% 									Spy point on rich/1
%		true.
%		[debug]  ?- happy(fred).
%		   Call: (8) rich(fred) ? creep
%		   Exit: (8) rich(fred) ? creep
%		   Exit: (7) happy(fred) ? creep
%		true.


% (14)
% Nospy.
%		Nospy remueve el punto espia de todos los predicados.



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EJERCICIO 2

% Hay tres errores sintácticos en esta definición. Escribe la forma correcta e indica los errores:


% error([ ]).
% error( [Head|Tail ) :-write (Head),error(Tail)


% El primer error sintáctico encontrado tiene nombre de "Unexpected end of file", esto indica
% que alguna regla no termina con un punto, como especificamente se requiere para que funcione
% el programa. Añadimos el punto entonces.


% error([ ]).
% error( [Head|Tail ) :-write (Head),error(Tail).

% El segundo error sintáctico tiene el siguiente nombre : "Illegal start of term", lo cual sugiere
% que hace falta un fin a un tármino, en nuestro caso, no se cierra el corchete en la regla.
% Procedemos a corregirlo.


% error([ ]).
% error([Head|Tail]) :-write (Head),error(Tail).

% El tercer error obedece al nombre de "Operator expected", es decir, hace falta un operador
% entre dos operandos, ahora bien, los dos operandos que reconoce prolog es write y (Head).error(Tail)
% ya que los espacios delimitan terminos, por ende, una solucion a esto es quitar el espacio.
% Luego, la definición queda:


% error([ ]).
% error( [Head|Tail] ) :-write(Head),error(Tail).


% Como ya no hay mas errores, terminamos.



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EJERCICIO 3

% Dada la base de datos presentada a continuación


% estupido(X) :- hombre(X).
% estupido(X) :- gato(X).
% hombre(X) :- masculino(X),humano(X).
% gato(X) :- masculino(X), felino(X).
% hombre(socrates).
% hombre(rover).
% humano(socrates).
% felino(rover).

% Describa como resolveria Prolog los siguientes predicados:
% estupido(rover).
% humano(rover).
% gato(socrates).



% Primero ordenamos la base de datos.

% estupido(X) :- hombre(X).
% estupido(X) :- gato(X).
% gato(X) :- masculino(X), felino(X).
% hombre(X) :- masculino(X),humano(X).
% hombre(socrates).
% hombre(rover).
% humano(socrates).
% felino(rover).


% Primera parte, veamos como resolvera prolog estupido(rover)

% estupido(X) :- hombre(X).
% estupido(X) :- gato(X).
% estupido(rover).
% hombre(X) :- masculino(X),humano(X).
% hombre(socrates).
% hombre(rover).
% gato(X) :- masculino(X), felino(X).
% humano(socrates).
% felino(rover).

% Esto evalua verdadero debido a que prolog busca lo necesario para ser estúpido y encuentra que hay dos 
% reglas para ser estúpido, o eres hombre o eres gato. En este caso, ya teníamos que rover es un hombre
% por lo que cumple la regla de que estúpido y por ende, evalúa true.


% Segunda parte, veamos como resolvera prolog humano(rover)

% estupido(X) :- hombre(X).
% estupido(X) :- gato(X).
% hombre(X) :- masculino(X),humano(X).
% hombre(socrates).
% hombre(rover).
% gato(X) :- masculino(X), felino(X).
% humano(rover).
% humano(socrates).
% felino(rover).

 
% Esto evalua true ya que se tiene la regla de que un hombre es masculino y humano, como rover es hombre
% entonces rover es masculino y humano, por lo que humano(rover) evalúa verdadero.


% Tercera parte, veamos como resolvera prolog gato(socrates)


% estupido(X) :- hombre(X).
% estupido(X) :- gato(X).
% hombre(X) :- masculino(X),humano(X).
% hombre(socrates).
% hombre(rover).
% gato(X) :- masculino(X), felino(X).
% gato(socrates).
% humano(socrates).
% felino(rover).


% Esto evalía true porque socrates es hombre y, por regla, un estupido es un hombre, que a la vez es 
% por regla un gato. Luego, socrates es un gato.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EJERCICIO 4


% Describa que hace el predicado presentado a continuacion.

% quehago([ ]).
% quehago([H|T]) :- quehago(T).


% Primero cabe destacar que esto arroja un Warning "singleton variables" que indica que hay una regla
% que si bien esta declarada y no causa ningun error, es inútil puesto que no hace nada.

% En la segunda regla podemos observar que se recibe una lista con un numero de objetos distinto
% de cero en donde hay al menos un objeto H y una secuencia de obetos a la derecha de H, llamado T.
% Cabe destacar que T tambien puede ser una lista vacia.

% En general, el predicado recibe una lista, que recursivamente va decrementando en tamañoo gracias
% a la segunda línea del predicado hasta que esta lista sea cero, por lo que termina la recursión