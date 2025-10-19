import personaje.*
import extras.*
import wollok.game.*

class Maiz {
	var property position = game.at(1, 1)
	var imagenActual = "corn_baby.png"

	method image() {
		return imagenActual
	}

	method esRegada() {
		imagenActual = "corn_adult.png"
	}

	method esCocechada() {
		self.validarCosecha()
		personaje.agregarParaVentas(self)
		game.removeVisual(self)
	}

	method validarCosecha() {
		if(imagenActual != "corn_adult.png"){
			self.error("El Maiz no esta listo para la cosecha")
		}
	}

	method valorDeVenta() {
		return 150
	}
}


class Trigo {
	var property position = game.at(1, 1)
	var property etapa = 0
	var imagenActual = "wheat_0.png" 
	method image() {

		return imagenActual
	}

	method esRegada() {
		if(etapa != 3){
			etapa += 1
		}else{
			etapa = 0
		}
		imagenActual = "wheat_" + etapa + ".png"
	}

	
	method esCocechada() {
		self.validarCosecha()
		personaje.agregarParaVentas(self)
		game.removeVisual(self)
	}

	method validarCosecha() {
		if(etapa < 2 ){
			self.error("El Trigo no esta listo para la cosecha")
		}
	}
	
	method valorDeVenta() {
		return (etapa - 1) * 100
	}
}


class Tomaco {
	var property position = game.at(1, 1)
	
	method image() {
		return "tomaco.png"
	}

	method esRegada() {
		if(game.getObjectsIn(position.up(1)).isEmpty()){
			self.avanzar()
		}

	}

	method avanzar() {
		if(position.y() < game.height() - 1 ){
		position = position.up(1)
		}else{
			position = game.at(position.x(), 0)
		}
	}

	method esCocechada() {
		personaje.agregarParaVentas(self)
		game.removeVisual(self)
	}

	method valorDeVenta() {
		return 80
	}
}

class Aspersor {
	var property position = game.at(1, 1)
	const dir = [norte, sur, este, oeste, norEste, norOeste,
	surEste, surOeste]


	method image() {
		return "aspersor.png"
	}

	method regar(unaDireccion) {
		const cultivo = self.cultivoEn(unaDireccion)
		cultivo.remove(personaje)
		if(not cultivo.isEmpty()){
			cultivo.first().esRegada()
		}
	}

	method cultivoEn(unaDireccion) {
		return game.getObjectsIn(unaDireccion.siguiente(position))
	}

	method regarTodo() {
		dir.forEach({unaDir => self.regar(unaDir)})
	}

	method esRegada() {}

}