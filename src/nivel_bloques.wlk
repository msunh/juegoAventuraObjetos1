import wollok.game.*
import fondo.*
import personajes.*
import elementos.*
import nivel_llaves.*
import utilidades.*

object nivelBloques {

	method configurate() {
		// fondo - es importante que sea el primer visual que se agregue
		game.addVisual(new Fondo(image = "fondoCompleto.png"))
			// otros visuals, p.ej. bloques o llaves
			// aparecen las bloques - nos faltaria una condicion para que no aparezcan dentro del deposito
			
		game.addVisual(new Bloque(position = utilidadesParaJuego.posicionArbitraria()))
		game.addVisual(new Bloque(position = utilidadesParaJuego.posicionArbitraria()))
		game.addVisual(new Bloque(position = utilidadesParaJuego.posicionArbitraria()))
		game.addVisual(new Bloque(position = utilidadesParaJuego.posicionArbitraria()))
		game.addVisual(new Bloque(position = utilidadesParaJuego.posicionArbitraria()))
			// puerta del nivel 1
		game.addVisual(puerta)
			// personaje, es importante que sea el último visual que se agregue
		game.addVisual(personajeSimple)
			// teclado
		keyboard.left().onPressDo({ personajeSimple.moverIzquierda()
			//game.sound("move.wav")
		})
		keyboard.right().onPressDo({ personajeSimple.moverDerecha()
			//game.sound("move.wav")
		})
		keyboard.up().onPressDo({ personajeSimple.moverArriba()
			//game.sound("move.wav")
		})
		keyboard.down().onPressDo({ personajeSimple.moverAbajo()
			//game.sound("move.wav")
		})
			// para que agarre y suelte las cajas
		keyboard.a().onPressDo({ personajeSimple.agarrarCaja()})
		keyboard.s().onPressDo({ personajeSimple.soltarCaja()})
			// para pasar rapido el nivel
		keyboard.g().onPressDo({ self.terminar()})
			// tiene todos bloques en el deposito y con n termina el nivel sobre la puerta
		keyboard.n().onPressDo({ personajeSimple.entrarPorLaPuerta()})
	// en este no hacen falta colisiones
	}

	method terminar() {
		//game.sound("win.mp3")
			// game.clear() limpia visuals, teclado, colisiones y acciones
		game.clear()
			// después puedo volver a agregar el fondo, y algún visual para que no quede tan pelado
		game.addVisual(new Fondo(image = "fondoCompleto.png"))
		game.addVisual(personajeSimple)
			// después de un ratito ...
		game.schedule(2500, { game.clear()
				// cambio de fondo
			game.addVisual(new Fondo(image = "finNivel1.png"))
				// después de un ratito ...
			game.schedule(3000, { // ... limpio todo de nuevo
				game.clear()
					// y arranco el siguiente nivel
				nivelLlaves.configurate()
			})
		})
	}

}

