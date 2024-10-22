class Bicicleta {
    const property rodado
    const property largo
    const property marca
    const property accesorios = []

    method agregarAccesorio(unAccesorio) {
        accesorios.add(unAccesorio)
    }

    method altura() = rodado * 2.5 + 15

    method velocidadDeCrucero() {
        if(largo > 120)
            return rodado + 6
        else
            return rodado + 2
    }

    method carga() = accesorios.sum({a => a.carga()})

    method peso() = rodado / 2 + accesorios.sum({a => a.peso()})

    method tieneLuz() = accesorios.any({a => a.esLuminoso()})

    method cuantosLivianos() {
        return accesorios.count({a => a.peso() < 1})
    }

    method sonCompanieras(unaBici, otraBici) {
        return unaBici != otraBici &&
        unaBici.marca() == otraBici.marca() &&
        (unaBici.largo() - otraBici.largo()).abs() <= 10
    }
}