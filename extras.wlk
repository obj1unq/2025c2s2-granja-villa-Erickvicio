import wollok.game.*

//Direcciones
object norte {
    method siguiente(unaPosicion) {
        return unaPosicion.up(1)
    }
}
object sur {
    method siguiente(unaPosicion) {
        return unaPosicion.down(1)
    }
}
object este {
    method siguiente(unaPosicion) {
        return unaPosicion.left(1)
    }
}

object oeste {
    method siguiente(unaPosicion) {
        return unaPosicion.right(1)
    }
}

object norOeste {
    method siguiente(unaPosicion) {
        return norte.siguiente(oeste.siguiente(unaPosicion))
    }
}
object norEste {
    method siguiente(unaPosicion) {
        return norte.siguiente(este.siguiente(unaPosicion))
    }
}
object surOeste {
    method siguiente(unaPosicion) {
        return sur.siguiente(oeste.siguiente(unaPosicion))
    }
}

object surEste {
    method siguiente(unaPosicion) {
        return sur.siguiente(este.siguiente(unaPosicion))
    }
}

//Mercados

class Mercado {
    var property image = "market.png"
    var property position = game.center() 

    var property dinero = 200
    const property mercaderia = []

    method agregarAMercaderia(listaDeElementos) {
        mercaderia.addAll(listaDeElementos)
    }

    method comprar(cantidad) {
        self.validarCompraDe(cantidad)
        dinero -= cantidad
    }

    method validarCompraDe(cantidad) {
        if(cantidad > dinero){
            self.error("No contamos con suficiente capital :C")
        }
    }

    method informacion() {
        game.say(self, "Tenemos "+ mercaderia +" y disponemos de "
		+ dinero +" para la compra")
    }
    
	method esRegada() {}
}