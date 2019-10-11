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

## Bonuses

En el nivel 2, mostrar la energía restante en la parte de arriba del tablero.

Lograr que cajas, llaves y comida aparezcan en lugares aleatorios.

En el nivel 2, arrancar con una sola comida, y que cada vez que el personaje obtiene una comida que aparezca otra.

En el nivel 2, que algunas llaves estén dentro de un cofre. Los cofres se abren de una patada, desde una posición adyacente. La patada que sea con una tecla. Cada patada le hace consumir al personaje 6 unidades de energía.

Agregar un nivel 3, en el que hay bichos que se mueven. El objetivo es matar todos los bichos, lanzándoles cuchillos. El cuchillo recorre hasta 3 celdas en la dirección del último movimiento del personaje. Si un bicho se choca con el personaje, entonces le resta 20 unidades de salud, y vuelve a su posición anterior.   
Se pueden hacer bichos con movimientos aleatorios, pero también que se muevan hacia el personaje.

