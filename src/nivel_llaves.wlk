import wollok.game.*
import fondo.*
import elementos2.*
import personajes2.*
import utilidades.*

object nivelLlaves {

	method configurate() {
		// fondo - es importante que sea el primer visual que se agregue
		game.addVisual(new Fondo(image = "fondoNivel2.png"))
			// otros visuals, p.ej. bloques o llaves
		game.addVisual(new Cofre())
		game.addVisual(new Cofre())
		game.addVisual(new Cofre())
			// medidor
		game.addVisual(palabraEnergia)
		game.addVisual(barra)
			// pollos y llaves que aparecen siempre en el mismo lugar
			// lo dejamos para que vean el metodo que usamos en el nivel 1.
			// game.addVisual(new Llave(position=game.at(11,3)))
			// game.addVisual(new Llave(position=game.at(3,3)))
			// game.addVisual(new Llave(position=game.at(2,11)))*/
			// aparecen en el mismo lugar
			// game.addVisual(new Pollo(position=game.at(11,11), energiaQueOtorga=5))
			// game.addVisual(new Pollo(position=game.at(3,7), energiaQueOtorga=30))
			// game.addVisual(new Pollo(position=game.at(13,1), energiaQueOtorga=10))*/
			// agregamos los pollos
			// en forma random (bonus)
		game.addVisual(new Pollo(position = utilidadesParaJuego.posicionArbitraria()))
			// personaje, es importante que sea el último visual que se agregue
		game.addVisual(personaje2)

			// mover al personaje			 		
		// Carlos
		// el sonido lo hubiera puesto en los métodos moverIzquierda / moverDerecha / etc.
		// así los sonidos de movimiento y de límite están en el mismo lugar
		// lo mismo en nivelBloques
		keyboard.left().onPressDo({ personaje2.moverIzquierda()
			game.sound("move.wav")
		})
		keyboard.right().onPressDo({ personaje2.moverDerecha()
			game.sound("move.wav")
		})
		keyboard.up().onPressDo({ personaje2.moverArriba()
			game.sound("move.wav")
		})
		keyboard.down().onPressDo({ personaje2.moverAbajo()
			game.sound("move.wav")
		})
			// dar la energia en un globito
		keyboard.e().onPressDo({ personaje2.decirEnergia()})
			// "patear" cofre con la letra "s"
		keyboard.s().onPressDo({ personaje2.patearCofre()})
			// agarra llaves con la tecla "a"
		keyboard.a().onPressDo({ personaje2.agarrarLlave()
			puerta.aparecePuerta()
		})
			// este es para probar, no es necesario dejarlo
		keyboard.g().onPressDo({ self.ganar()})
		keyboard.p().onPressDo({ self.perder()})
			// colisiones, acá sí hacen falta
			// colisiones porque cuando "se choca" con un pollo a la energia del personaje le pasa algo (aumenta)
			// me choco con "algo" como una llave o comida
			
		// Carlos
		// esta parte no está bien resuelta. El que debería resolver qué hacer cuando se encuentra al personaje
		// es el otro objeto, el pollo o la puerta.
		// O sea:    game.whenCollideDo(personaje2, { elemento => elemento.meChocoElPersonaje() )})
		// de esta forma, no tenés que preguntar si es pollo o es puerta
		// los cofres y las llaves no hacen nada, y listo 
		game.whenCollideDo(personaje2, { elemento => personaje2.meChocoCon()})
			// cuando me choco con la puerta despues de tener todas las llaves
		game.whenCollideDo(personaje2, { elemento => personaje2.meChocoConPuerta() })
	}

	method perder() {
		game.say(personaje2, "NO!!! PERDIMOS!")
		game.sound("lost.wav")
		game.schedule(4000, { game.addVisual(new Fondo(image = "perdimos.png"))})
		game.schedule(6000, { game.stop()})
	}

	
		method ganar() {
		game.say(personaje2, "SI! GANAMOS!! ")
		game.sound("win.mp3")
		game.clear()
		game.addVisual(new Fondo(image = "fondoNivel2.png"))
		game.addVisual(personaje2)
		game.schedule(2500, { 
			game.clear()
			game.addVisual(new Fondo(image = "ganamos.png"))
			game.schedule(3000, { 
			game.addVisual(new Fondo(image = "credits.png"))
			game.schedule(20000, { game.stop()})
			})
		})
	}
	

}

