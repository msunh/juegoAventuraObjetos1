import wollok.game.*
import personajes2.*
import nivel_llaves.*
import utilidades.*

class Llave {

	var property position
	const property image = "llave2.png"
	const property esLlave = true
	const property esPollo = false
	const property esPuerta = false
	const property esCofre = false
	const property esModificador = false

}

class Pollo {

	var property position
	const property image = "pollo.png"
	// var property energiaQueOtorga = 10.randomUpTo(30).truncate(0)// la energia la pusimos aleatoria en un rago de 10 a 30
	// var property energiaQueOtorga = 50
	var property energia = 10
	const property esLlave = false
	const property esPollo = true
	const property esPuerta = false
	const property esCofre = false
	const property esModificador = false



	method energiaQueOtorga() {
		if (personaje2.modificadores().isEmpty()) {
			return energia
		} else if (personaje2.ultimoModificadorEsDuplicador()) {
			return energia * 2
		} else if (personaje2.ultimoModificadorEsReforzador() and personaje2.energiaMenorA10()) {
			return (energia * 2) + 20
		} else if (personaje2.ultimoModificadorEsReforzador()) {
			return energia * 2
		} else if (personaje2.ultimoModificadorEsTriple() and personaje2.energiaDelPersonajePar()) {
			return energia * 3
		} else {
			return 0
		}
	}

}

class Cofre {

	var property position = utilidadesParaJuego.posicionArbitraria()
	const property image = "caja.png"
	const property esPuerta = false
	const property esPollo = false
	const property esCofre = true
	const property esLlave = false
	const property esModificador = false

}

object puerta {

	const property image = "puerta.png"
	const property position = game.at(7, 7)
	const property esPuerta = true
	const property esBloque = false
	const property esPollo = false
	const property esLlave = false
	const property esCofre = false
	const property modificador = false

// tengo todas las llaves y aparece la puerta
	method aparecePuerta() {
		if (personaje2.cantidadDeLlaves().size() == 3) {
			game.addVisual(self)
		}
	}

}

//visual-palabra "energia"
object palabraEnergia {

	const property image = "energia.png"
	const property position = game.at(0, 14)
	const property esPollo = false
	const property esPuerta = false
	const property esCofre = false
	const property esLlave = false
	const property esModificador = false

}

//visual barra de energia
object barra {

// Carlos
// si tengo un método image(), no hace falta la var property
// acá creeeo que se confunde, y por eso la barra no se actualiza enseguida
// porque tenés dos métodos image(), el que te da Wollok por var property, y el que escribieron ustedes.
//****areglado****
	var property image = "1_barra_full.png"
	const property position = game.at(4, 14)
	const property esPuerta = false
	const property esPollo = false
	const property esCofre = false
	const property esLlave = false
	const property esModificador = false

	method tipoImage() {
		if (personaje2.energia() == 0) {
			image = "6_barra_vacia.png"
		} else if (personaje2.energia().between(1, 2)) {
			image = "5_barra_minima.png"
		} else if (personaje2.energia().between(3, 10)) {
			image = "4_barra_1_4.png"
		} else if (personaje2.energia().between(11, 20)) {
			image = "3_barra_mitad.png"
		} else if (personaje2.energia().between(21, 30)) {
			image = "2_barra_3-4.png"
		} else if (personaje2.energia() >= 40) {
			image = "1_barra_full.png"
		}
		return image
	}

}

class Modificador {

	var property position
	const property esLlave = false
	const property esPollo = false
	const property esPuerta = false
	const property esCofre = false
	var property esModificador = true

}

class Duplicador inherits Modificador {

	const property esDuplicador = true
	const property esReforzador = false
	const property esTriple = false
	const property image = "duplicador.png"

	method meChocaron() {
		game.addVisual(new Reforzador(position = utilidadesParaJuego.posicionArbitraria()))
	}

}

class Reforzador inherits Modificador {

	const property esDuplicador = false
	const property esReforzador = true
	const property esTriple = false
	const property image = "reforzador.png"

	method meChocaron() {
		game.addVisual(new Triple(position = utilidadesParaJuego.posicionArbitraria()))
	}

}

class Triple inherits Modificador {

	const property esDuplicador = false
	const property esReforzador = false
	const property esTriple = true
	const property image = "triplicador.png"

	method meChocaron() {
		game.addVisual(new Duplicador(position = utilidadesParaJuego.posicionArbitraria()))
	}

}
	





