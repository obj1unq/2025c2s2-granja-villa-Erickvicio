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
	var etapa = 0
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
	
	method image() {
		return "aspersor.png"
	}

	method regar(unaDireccion) {
		self.validarRegar(self.cultivoEn(unaDireccion))
		self.cultivoEn(unaDireccion).first().esRegada()
	}

	method validarRegar(unaDireccion) {
		if(self.cultivoEn(unaDireccion).isEmpty()){
			self.error("No hay nada que regar en tu ano eri jijijijijijiji")
		}
	}

	method cultivoEn(unaDireccion) {
		return game.getObjectsIn(unaDireccion.siguiente(position))
	}

	method regarTodo() {
		self.regar(norte)
		self.regar(sur)
		self.regar(este)
		self.regar(oeste)
		self.regar(norEste)
		self.regar(norOeste)
		self.regar(surEste)
		self.regar(surOeste)
	}

}