import wollok.game.*

class Maiz {
	var property position = game.at(1, 1)
	var imagenActual = "corn_baby.png"
	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return imagenActual
	}

	method esRegada() {
		imagenActual = "corn_adult.png"
	}
}


class Trigo {
	var property position = game.at(1, 1)
	var etapa = 0
	var imagenActual = "wheat_0.png" 
	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return imagenActual
	}

	method esRegada() {
		if(etapa != 3){
			etapa += 1
		}else{
			etapa = 0
		}
		self.actualizarImagen()
	}

	method actualizarImagen() {
		imagenActual = "wheat_" + etapa + ".png"
	}
}


class Tomaco {
	var property position = game.at(1, 1)
	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return "tomaco.png"
	}

	method esRegada() {
		if(position < game.width()){
			position = position.up(1)
		}else{
			position = game.at(1, self.position().y())
		}
	}

}