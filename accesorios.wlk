object farolito {
    method peso() = 0.5

    method carga() = 0

    method esLuminoso() = true
}

class Canasto {
    const property volumen

    method peso() = volumen / 10

    method carga() = volumen * 2

    method esLuminoso() = false
}

class Morral {
    const property largo
    var tieneOjoDeGato

    method peso() = 1.2

    method carga() = largo / 3

    method esLuminoso() = tieneOjoDeGato

    method cambiarEstadoOjo() {
        tieneOjoDeGato = not tieneOjoDeGato
    } //?
}

/*
Los nuevos accesorios deberían tener los métodos peso(), carga() y esLuminoso()
para cumplir con el polimorfismo. A su vez, hay que evaluar si son objetos o clases
detectando si tienen atributos y estos cambian al crearse, por ejemplo, otra instancia
(como las bicicletas que varían en rodado, accesorios, largo y marca).
*/
