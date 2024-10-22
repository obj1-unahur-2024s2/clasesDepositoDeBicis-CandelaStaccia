class Depositos {
    const property bicis = []

    method bicisRapidas() {
        return bicis.filter({b => b.velocidadDeCrucero() > 25})
    }

    method marcas() {
        return bicis.map({b => b.marca()}).asSet()
    }

    method esNocturno() {
        return bicis.all({b => b.tieneLuz()})
    } 

    method hayParaLlevar(kilos) {
        return bicis.any({b => b.carga() > kilos})
    }

    method agregar(unaBici) {
        bicis.add(unaBici)
    }

    method marcaDeLaMasRapida() {
        return self.bicisRapidas().max({b => b.velocidadDeCrucero()}).marca()
    }

    method cargaTotalDeLasLargas() {
        return self.bicisLargas().sum({b => b.carga()})
    }

    method bicisLargas() {
        return bicis.filter({b => b.largo() > 170})
    }

    method bicisSinAccesorios() {
        return bicis.count({b => b.accesorios().isEmpty()})
    }

    method bicisCompanierasDe(unaBici) {
        return bicis.filter({b => b.sonCompanieras(unaBici, b)})
    }


    
    method hayCompanieras() {
        return bicis.any({b => 
        bicis.any({b2 => b != b2 && b2.sonCompanieras(b, b2)}) 
        }) //?????
    }
    
    /*
    method parejasDeCompanieras(unParDeBicis) {
        //Hacer lista de 2 bicis y si son compañeras, devolverlas ??
        if(unParDeBicis.primerBici().sonCompanieras(unParDeBicis.primerBici(), unParDeBicis.segundaBici()))
            return unParDeBicis.parDeBicis()
        else
            return null //O string "Las bicis no son una pareja de compañeras"
    }*/

    method parejasDeCompanieras(unaBici, otraBici) {
        const par = [unaBici, otraBici]
        if(unaBici.sonCompanieras(unaBici, otraBici))
            return par
        else
            return null //O string "Las bicis no son una pareja de compañeras"
    }

    method seHizoLaLuz() {
        return bicis.all({b => b.tieneLuz()})
    } //es lo mismo que esNocturno() ???? creo que si...
}

///////////
class ParDeBicis {
    const property parDeBicis = []

    method agregarParDeBicis(unaBici, otraBici) {
        parDeBicis.addAll(unaBici, otraBici)
    } 

    method primerBici() = parDeBicis.first()

    method segundaBici() = parDeBicis.last()
}