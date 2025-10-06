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

	method cosecharPlanta() {
		self.validarCosecha()
		self.plantaEncima().first().esCocechada()
		console.println(listaDeCosechas.size())
	}

	method validarCosecha() {
		if(self.plantaEncima().isEmpty()){
			self.error("No hay ninguna planta que cosechar aqui")
		}
	}

	method agregarParaVentas(unCultivo) {
		listaDeCosechas.add(unCultivo)
	}

	var listaDeCosechas = []
	var  dinero = 0

	method venderCosecha() {
		self.validarVenta()
		dinero += listaDeCosechas.sum({cosecha => cosecha.valorDeVenta()})
		listaDeCosechas.clear()
	}

	method validarVenta() {
		if(listaDeCosechas.isEmpty()){
			self.error("No hay nada que vender")
		}
	}

	method listaDeCosechas() {return listaDeCosechas}
	method dinero() {return dinero}

	method colocarAspersor() {
		self.validarColocarAspersor()
		var unAspersor = new Aspersor(position = self.position())
		listaDeAspersores.add(unAspersor)
		game.addVisual(unAspersor)
		console.println(listaDeAspersores.size())
	}

	method validarColocarAspersor() {
		if(not self.plantaEncima().isEmpty()){
			self.error("No se puede colocar un aspersor aqui")
		}
	}

	const property listaDeAspersores = []


}