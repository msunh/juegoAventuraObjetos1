# Juego de aventura

El enunciado de la parte grupal se puede ver [acá](https://github.com/obj1-unahur/juego-aventura-2019s2). Debajo se proponen algunas extensiones que deberán ser implementadas de manera individual.

Para evitar problemas con Git y facilitarnos la corrección, te pedimos que sigas esta receta antes de empezar:
1. Clonar este repositorio.
1. Copiar y pegar todo el código del repositorio de tu entrega grupal acá (menos el `README.md`, para que no pierdas la consigna).
1. Hacer un commit **solo** con estos cambios.
1. Comenzar a trabajar en la parte individual.

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
