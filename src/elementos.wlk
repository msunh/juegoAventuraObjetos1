import wollok.game.*
import personajes.*

class Bloque {

	var property position
	const property image = "caja.png"
	var property estaAgarrado = false
	const property esBloque = true

	// agregar comportamiento
	
	// Carlos
	// en realidad este método está agarrando o soltando el bloque
	// el nombre "actualizarPosicion" es confuso, sería mucho mejor p.ej. "agarrarOSoltar"
	method actualizarPosicion() {
		estaAgarrado = not estaAgarrado
	}

	method position() {
		if (self.estaAgarrado()) {
			self.position(personajeSimple.position())
		}
		return position
	}

	method rangoDeposito() {
		return self.position().x().between(5, 9) and self.position().y().between(7, 12)
	}

}

object puerta {

	const property image = "puerta.png"
	const property position = game.at(7, 7)
	const property esBloque = false

	// este metodo es para que no nos de un error 
	method actualizarPosicion() {
	}

}

