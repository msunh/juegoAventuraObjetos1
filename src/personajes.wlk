import wollok.game.*
import elementos.*
import elementos2.*
import nivel_bloques.*

// en la implementación real, conviene tener un personaje por nivel
// los personajes probablemente tengan un comportamiendo más complejo que solamente
// imagen y posición
object personajeSimple {

	var property position = game.at(7, 6)
	const property image = "player.png"
	const property esBloque = false
	var property cantidadDeLlaves = []

	// mover al personaje // si se choca con la pared da un mensaje 
	method moverIzquierda() {
		if (position.x() > 0) {
			position = position.left(1)
		} else {
			game.say(self, "no puedo avanzar más!!")
			game.sound("limite.mp3")
		}
	}

	method moverArriba() {
		// height altura, width ancho
		if (position.y() < game.height() - 1) {
			position = position.up(1)
		} else {
			game.say(self, "no puedo avanzar más!!")
			game.sound("limite.mp3")
		}
	}

	method moverDerecha() {
		if (position.x() < game.width() - 1) {
			position = position.right(1)
		} else {
			game.say(self, "no puedo avanzar más!!")
			game.sound("limite.mp3")
		}
	}

	method moverAbajo() {
		// height altura, width ancho
		if (position.y() > 0) {
			position = position.down(1)
		} else {
			game.say(self, "no puedo avanzar más!!")
			game.sound("limite.mp3")
		}
	}

	// agarrar las cajas y soltar
	method agarrarCaja() {
		game.colliders(self).forEach({ bloque =>
			bloque.actualizarPosicion()
			game.sound("agarrar.mp3")
		})
	}

	method soltarCaja() {
		game.colliders(self).forEach({ bloque =>
			bloque.actualizarPosicion()
			game.sound("soltar.mp3")
		})
	}

	// con este metodo verifica que todos los bloques esten en el deposito y sobre la puerta para salir
	//
	// si le faltan traer bloques da un mensaje
	// si no esta en la puerta tambien.
	method entrarPorLaPuerta() {
		if (self.estanTodosEnDeposito() and self.estaSobreLaPuerta()) {
			nivelBloques.terminar()
		} else if (not self.estanTodosEnDeposito() and self.estaSobreLaPuerta()) {
			game.say(self, "te faltan traer más Bloques!!")
		} else if (self.estanTodosEnDeposito() and not self.estaSobreLaPuerta()) {
			game.say(self, "dirigite a la puerta para terminar!!")
		}
	}

	// verifico si todos los bloques estan en el deposito
	method estanTodosEnDeposito() {
		return game.allVisuals().filter({ b => b.esBloque() }).all({ b => b.rangoDeposito() })
	}

	// verifico si estoy sobre la puerta y no en otro lugar
	method estaSobreLaPuerta() {
		return self.position().x() == puerta.position().x() and self.position().y() == puerta.position().y()
	}

}

