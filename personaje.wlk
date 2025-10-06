import wollok.game.*
import cultivos.*

object personaje {
	var property position = game.center()
	const property image = "fplayer.png"

	method sembrarSemillaDeMaiz() {
		self.validarSembrado()
		game.addVisual(new Maiz(position = self.position()))
	}

	method sembrarSemillaDeTrigo() {
		self.validarSembrado()
		game.addVisual(new Trigo(position = self.position()))
	}

	method sembrarSemillaDeTomaco() {
		self.validarSembrado()
		game.addVisual(new Tomaco(position = self.position()))
	}

	method validarSembrado() {
		if(not self.plantaEncima().isEmpty()){
			self.error("Este espacio esta ocupado")
		}
	}

	method plantaEncima() {
		var cultivo = game.getObjectsIn(position)
		cultivo.remove(self)
		return cultivo
	}

	method regarPlanta() {
		self.validarRegado()
		self.plantaEncima().first().esRegada()
	}

	method validarRegado() {
		if(self.plantaEncima().isEmpty()){
			self.error("No hay ninguna planta que regar aqui")
		}
	}

}