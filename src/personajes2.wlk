import wollok.game.*
import elementos2.*
import nivel_llaves.*
import utilidades.*

// personaje del nivel 2
// Carlos
// los dos personajes comparten toda la lógica del movimiento, se podría haber definido una clase y usar herencia
// o que del movimiento se encargaran otros objetos.
object personaje2 {

	var property position = game.at(7, 6)
	var property energia = 40
	var property postionDelCofre
	var property cantidadDeLlaves = []
	var property modificadores = []
	

	// agrego el metodo de image para poder cambiar la imagen al perder 
	method image() {
		if (self.sinEnergia()) {
			return "player_dead.png"
		} else {
			return "player.png"
		}
	}

	// Cada direccion lo que hace primero es preguntar la posicion del personaje 
	// evalua si puede avanzar o no 
	// si tiene energia, se mueve y luego resta un punto. Se mueve y tambien evalua no irse del rango del tablero
	// si puede avanzar manda por parametro la posicion al metodo moverseA() - 
	// Si llega al limite del tablero no se mueve, si se queda sin 
	// energia no se mueve y pierde.
	method moverIzquierda() {
		if (position.x() > 0) {
			self.moverseA(self.position().left(1))
		} else {
			game.say(self, "no puedo avanzar más!")
			game.sound("limite.mp3")
		}
	}

	method moverDerecha() {
		if (position.x() < game.width() - 1) {
			self.moverseA(self.position().right(1))
		} else {
			game.say(self, "no puedo avanzar más!")
			game.sound("limite.mp3")
		}
	}

	method moverArriba() {
		// height altura, width ancho
		if (position.y() < game.height() - 1) {
			self.moverseA(self.position().up(1))
		} else {
			game.say(self, "no puedo avanzar más!")
			game.sound("limite.mp3")
		}
	}

	method moverAbajo() {
		// height altura, width ancho
		if (position.y() > 0) {
			self.moverseA(self.position().down(1))
		} else {
			game.say(self, "no puedo avanzar más!")
			game.sound("limite.mp3")
		}
	}

	// hace eso, retorna si se me quedé sin energia 
	method sinEnergia() {
		return energia == 0
	}

	// si apreto la tecla "e" da un mensaje de la energia que tiene el personaje
	method decirEnergia() {
		game.say(self, "Tengo: " + self.energia() + "  puntos de energia!")
	}

	// evaluo si es una llave
	// Carlos
	// si el método me dice si me choqué con una llave, que se llame p.ej. "meEstoyChocandoConLlave"
	// el nombre "esLlave" es confuso, porque self es un personaje, no una llave
	// lo mismo con esPollo / esPuerta / esCofre 
	method esLlave() {
		return game.colliders(self).first().esLlave()
	}

	// evaluo si me choco con comida
	method esPollo() {
		return game.colliders(self).first().esPollo()
	}

	// evaluo si me choco con Puerta
	method esPuerta() {
		return game.colliders(self).first().esPuerta()
	}

	// evaluo si me choco con Cofre
	method esCofre() {
		return game.colliders(self).first().esCofre()
	}

	// evaluo si me choco con modificador
	method esModificador() {
		return game.colliders(self).first().esModificador()
	}

	method noHayNada() {
		return game.colliders(self).size() == 0
	}

	// agarrar las llaves
	// coloco metodos donde pregunte si estoy parado sobre nada  o algo que no es una llave
	method agarrarLlave() {
		if (self.noHayNada()) {
			game.say(self, "no hay nada para agarrar")
		} else if (not self.esLlave()) {
			game.say(self, "no hay llaves para agarrar")
		} else {
			game.colliders(self).forEach({ key =>
				game.removeVisual(key)
				cantidadDeLlaves.add(key)
				game.sound("agarrar.mp3")
			})
		}
	}

	// me choco con la comida que me da energia, evalúo si lo es.
	method meChocoCon() {
		if (self.esPollo()) {
			game.colliders(self).forEach({ pollo =>
				game.removeVisual(pollo)
				energia += pollo.energiaQueOtorga()
					 game.sound("energia.mp3")
				game.addVisual(new Pollo(position = utilidadesParaJuego.posicionArbitraria()))
			})
		}
	}

	// me choco con la puerta y gano el juego, antes evaluo si es una puerta.
	method meChocoConPuerta() {
		if (self.esPuerta()) {
			nivelLlaves.ganar()
		}
	}
	
		method ultimoModificador() {
		return modificadores.last()
	}
	
	method ultimoModificadorEsDuplicador(){
		return modificadores.find({ m => m.esDuplicador() }) == self.ultimoModificador()
	}
	
	method  ultimoModificadorEsReforzador(){
		return modificadores.find({ m => m.esReforzador() }) == self.ultimoModificador()
	}
	
	method  ultimoModificadorEsTriple(){
		return modificadores.find({ m => m.esReforzador() }) == self.ultimoModificador()
	}
	
	method energiaMenorA10(){
		return self.energia() < 10
	}
	
	method energiaDelPersonajePar(){
		return self.energia().even()
	}
	
	method energiaDelPersonajeImpar(){
		return self.energia().odd()
	}

	// me choco con modificador
	method meChocoModificador() {
		if (self.esModificador()) {
			game.colliders(self).forEach({ modificador =>
				game.removeVisual(modificador)
				modificadores.add(modificador)
				modificador.meChocaron()
				game.sound("energia.mp3")
				
			})
		}
	}

	// moverseA evalua que si tiene o no energia para moverse, en caso de no tenerla pierde y se termina el juego
	method moverseA(posicionNueva) {
		if (not self.sinEnergia()) {
			position = posicionNueva
			energia -= 1
			barra.tipoImage()
			if (self.sinEnergia()) {
				nivelLlaves.perder()
			}
		}
	}

	// añadimos "patear cofre" (no podemos lograr lo de la posicion aledaña, por lo tanto se posiciona sobre él)
	// primero verifica si es cofre
	// si es cofre, remueve el visual y en su lugar agrega una llave
	// guardo la posicion del cofre que acabo de "patear" en una variable
	// para que luego la llave aparezca en el mismo lugar
	method patearCofre() {
		if (self.noHayNada()) {
			game.say(self, "no hay nada para patear")
		} else if (not self.esCofre()) {
			game.say(self, "no sirve para patear")
		} else if (self.esCofre()) {
			game.colliders(self).forEach({ cofre =>
				game.removeVisual(cofre)
				postionDelCofre = cofre.position()
				game.sound("romper.mp3")
				energia -= 6
			})
			game.addVisual(new Llave(position = postionDelCofre))
		}
	}

}

