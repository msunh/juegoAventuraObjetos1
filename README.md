# Juego de aventura

Se debe desarrollar un juego con dos niveles diferenciados. 

## Nivel 1 - mover cajas

El nivel 1 está ligeramente basado en el Sokoban (https://jumpingcat.eu/games/sokoban.html).  
El tablero incluye un personaje, varias cajas, una zona identificada como depósito, y una celda identificada como salida.  
El personaje debe llevar las cajas al depósito, luego dirigirse a la salida, y pulsar la tecla 'N'. Esto completa el turno.

Planteamos dos alternativas para que el personaje mueva una caja.  

1. la fácil: el personaje se posiciona en la celda donde está la caja, con una tecla la "levanta". Mientras un personaje tiene una caja, la caja se mueve junto con él. Con otra tecla, el personaje "suelta" la caja, que queda donde la dejó el personaje.
2. la difícil: como el Sokoban, el personaje debe posicionarse detrás de la caja y empujarla. P.ej. si el personaje está a la izquierda de una caja y se mueve hacia la derecha, entonces la caja se mueve también.

Esta pantalla debe incluir, al menos, 5 cajas.

## Nivel 2 - buscar llaves

En el nivel 2 el objetivo del personaje es agarrar 3 llaves que deben ponerse en el tablero, e ir a la puerta de salida.  
Un detalle **muy importante**: la puerta de salida aparece _recién_ cuando el personaje recoge todas las llaves, no antes.  

A cada paso que da el personaje, gasta una unidad de energía. El personaje arranca con 40 unidades de energía.  
Para recuperar energía, el personaje tiene que agarrar pollos, los pollos también deben ponerse en el tablero. Cada pollo suministra una cantidad de unidades de energía que se establece en forma particular para cada uno, p.ej. podríamos tener un pollo que dé 10 unidades de energía y otro que dé 30.

Si el personaje se queda sin energía, entonces pierde. Si pasa por la puerta de salida, entonces gana. En cualquiera de los dos casos, debe aparecer un cartel que indique el resultado.

## Estructura inicial
El código que acompaña a este enunciado tiene una estructura básica del juego, incluyendo los dos niveles, y cómo hacer la transición entre niveles. Están resueltas: la transición del nivel 1 al 2, y el fin de juego en caso de ganar. Falta manejar el caso de perder.

Se agregan algunos visuals, una tecla en el nivel 1 para simular que se terminó, y una tecla en el nivel 2 para simular que se ganó. Estas cosas son para probar: los visuals deben reemplazarse por los que implementen ustedes; con las teclas como prefieran, déjenlas como están, cambien de tecla, o bórrenlas.


## Bonuses
En el nivel 2, mostrar la energía restante en la parte de arriba del tablero.

Lograr que cajas, llaves y comida aparezcan en lugares aleatorios.

En el nivel 2, arrancar con una sola comida, y que cada vez que el personaje obtiene una comida que aparezca otra.

En el nivel 2, que algunas llaves estén dentro de un cofre. Los cofres se abren de una patada, desde una posición adyacente. La patada que sea con una tecla. Cada patada le hace consumir al personaje 6 unidades de energía.

## Mega bonus
Agregar un nivel 3, en el que hay bichos que se mueven automáticamente. El objetivo es matar todos los bichos, lanzándoles granadas. La granada recorre hasta 3 celdas en la dirección del último movimiento del personaje. Si un bicho se choca con el personaje, entonces le resta 20 unidades de salud, y vuelve a su posición anterior.  
Atenti: el personaje nace sin granadas, tiene que recogerlas del tablero. 

Se pueden hacer bichos con movimientos aleatorios, pero también que se muevan hacia el personaje.
Se pueden agregar items (como los pollos) que dan energía, y otros que dan salud (ponele, un botiquín).
Y ya da para poner indicadores de energía, salud y cantidad de granadas del personaje.



# Agregados para entregas individuales

A continuación, describimos extensiones al juego, que pueden ser resueltas en forma individual.
Todas estas extensiones aplican al nivel 2, el de buscar llaves.

## Modificadores del efecto energético de los pollos
Agregar al tablero elementos que modifiquen el efecto que tiene en la energía encontrarse con un pollo. Cada uno de estos elementos tiene un criterio particular para calcular cuánta energía adquiere el personaje al consumir un pollo. Implementar, al menos, las siguientes opciones:
- _duplicador_: brinda al personaje el doble de la energía configurada para el pollo.
- _reforzador_: brinda al personaje el doble la energía configurada para el pollo. Si el personaje tiene (antes de consumir el pollo) menos de 10 unidades de energía,  le brinda 20 unidades extra.
- _triple o nada_: brinda al personaje el triple de la energía configurada para el pollo si la energia del personaje es un número par, y nada si es impar.

Cuando el personaje se encuentra un modificador, lo incorpora, y el modificador desaparece del tablero. El modificador afecta a la ganancia de energía por los pollos que se encuentre _después_ de encontrarse con el modificador.  
Cuando el personaje se encuentra con un segundo modificador, el nuevo reemplaza el viejo.

## Celdas sorpresa
Agregar al tablero elementos con efectos variados, p.ej.
- uno quita 15 puntos de energía.
- otro agrega 30 puntos de energía.
- otro hace aparecer un pollo.
- otro "teletransporta" a otra posición.

Todos estos elementos tienen la misma imagen, la idea es que el efecto sea "sorpresa".  

**Atención**  
Estos elementos tienen en común que aplican cuando el personaje _pasa al lado_. Además, _no se pueden atravesar_, funcionan como paredes que impiden el paso del personaje.

Idealmente, cada uno de estos elementos tiene efecto solamente la primera vez que el personaje pasa por al lado. Pero sigue estando en el tablero e impidiendo el paso. Contemplar _dos imágenes_, una de celda sorpresa "activa" y otro de celda sorpresa que ya ha sido usada.

## Dos personajes
Agregar un segundo personaje al nivel 2. Los personajes mueven alternativamente, una vez cada uno. Los dos pueden recoger llaves y ganar energía con los pollos.  
El que pasa por la puerta con todas las llaves recogidas gana, no importa quién haya recogido qué llave. En tal caso, indicar quién ganó.  
Si uno de los personajes se queda sin energía, lo mejor sería que quedara jugando solamente el otro. Si esto no sale, que se dé el juego por perdido.

Contemplar, para cada personaje, dos imágenes, una cuando está activo (o sea, es el que se va a mover con la próxima flecha), uno cuando no.



