import wollok.game.*

class Fondo {

	const property position = game.at(0, 0)
	var property image
	const property esBloque = false
	const property esPollo = false
	const property esPuerta = false
	const property esLlave = false
	const property esCofre = false
	const property esModificador = false

	// este metodo es para que no nos de un error al posicionarnos en (0,0) 
	method actualizarPosicion() {
	}

}
