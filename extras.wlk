//dame un grrrr un k un grrrr hola eri (corazon con las manos)

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

//TESTING
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