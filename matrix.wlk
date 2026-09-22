object neo{
    var energia = 100

    method vitalidad(){
        return energia * 0.1
    }

    method esElegido(){
        return true
    }

    method saltar(){
        energia = energia % 2
    }
}

object morfeo{
    var vitalidad = 8
    var estaCansado = false

    method vitalidad(){
        return vitalidad
    }

    method estaCansado(){
        return estaCansado
    }
    method esElegido(){
        return false
    }

    method saltar(){
        if (vitalidad - 1 >= 0){
        vitalidad -= 1
        }
        estaCansado = not estaCansado
    }
}

object trinity{
    method saltar(){
        
    }

    method vitalidad(){
        return 0
    }

    method esElegido(){
        return false
    }
}

object nave{
    const pasajeros = []

    method subirPasajero(pasajero){
        pasajeros.add(pasajero)
    }

    method bajarPasajero(pasajero){
        pasajeros.remove(pasajero)
    }

    method cantidadDePasajeros(){
        return pasajeros.size()
    }

    method estaEquilibrada(){
        return self.vitalidadDelPasajeroDeMayorVitalidad() <= self.vitalidadDelPasajeroDeMenorVitalidad() * 2
    }

    method estaElElegido(){
        return pasajeros.any({p => p.esElegido()})
    }

    method elPasajeroDeMenorVitalidad(){
        return pasajeros.min({p => p.vitalidad()})
    }

    method vitalidadDelPasajeroDeMenorVitalidad(){
        return self.elPasajeroDeMenorVitalidad().vitalidad()
    }

    method elPasajeroDeMayorVitalidad(){
        return pasajeros.max({p => p.vitalidad()})
    }

    method vitalidadDelPasajeroDeMayorVitalidad(){
        return self.elPasajeroDeMayorVitalidad().vitalidad()
    }

    method chocar(){
        pasajeros.forEach({p => p.saltar()})
        pasajeros.clear()
    }

    method acelerar(){
        pasajeros.filter({p => not p.esElegido()}).forEach({p => p.saltar()})
    }
}