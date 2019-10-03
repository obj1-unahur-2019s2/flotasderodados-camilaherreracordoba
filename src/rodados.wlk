class ChevroletCorsa {
  var property color
  method capacidad() { 
    return 4
  }
  method velocidadMaxima(){ return 150 }
  method peso(){ return 1300 }
}

class RenaultKwid {
  var tieneTanqueAdicional
  method capacidad() { 
    if (tieneTanqueAdicional) {
      return 3
    } else {
      return 4
    }  
  }
  method velocidadMaxima(){
  	return if (tieneTanqueAdicional) { 120 } else { 110 }
  }
  method peso() {
  	return if (tieneTanqueAdicional) { 1350 } else { 1200 }
  }
  method color() { return azul }
}


object trafic {
	var property motor
	var property interior
	

	method peso() {
    	return 4000 + motor.peso() + interior.peso()
    }
	method capacidad() { 
		return interior.capacidad()
	}
	method velocidadMaxima() { return motor.velocidadMaxima()}
	method color() { return beige}
}

// una opción: clase Motor
/*class Motor { 
	var property peso 
	var property velocidadMaxima
}*/
/* uno **pulenta** (que pesa 800 kg y permite una velocidad máxima de 130 km/h)
 * y otro **batatón** (que pesa 500 kg y permite una velocidad máxima de 80 km/h)
 */
// otra opción: un objeto x cada motor

object comodo { 
	method peso() { return 700 }
	method capacidad() { return 5 }
}

object popular { 
	method peso() { return 12 }
	method capacidad() { return 1000 }
}


object bataton {
	method peso() { return 500 }
	method velocidadMaxima() { return 80 }
}
object pulenta {
	method peso() { return 800 }
	method velocidadMaxima() { return 130 }
}

class AutoEspecial {
	var property capacidad
	var property velocidadMaxima
	var property peso
	var property color
}


class Dependencia {
	var rodados = []
	var property empleados
	var property pedidos = []

 
	method agregarAFlota(rodado) {
		rodados.add(rodado)
	} 
	
	method quitarDeFlota(rodado) {
		rodados.remove(rodado)
	}

	method pesoTotalFlota() {
		return rodados.sum({ rodado => rodado.peso()})
	}

	method estaBienEquipada() {
		return rodados.size() > 2 and rodados.all({rodado => rodado.velocidadMaxima() >= 100 })
 	} 

 	method capacidadTotalEnColor(color){
 		return rodados.filter({rodado => rodado.color() == color }).sum({rodado => rodado.capacidad()})
 	}
	method colorDelRodadoMasRapido() {
		return rodados.max({ rodado => rodado.velocidadMaxima()}).color()
	}
	method capacidadFaltante() {
		return rodados.sum({ rodados.capacidad() }) - self.empleados()
	}

 	method esGrande() {
 		return rodados.size() >= 5 and self.empleados() >= 40
 	}
 	
 	method totalPasajeros() {
 		return pedidos.sum({ pedido => pedido.cantidadPasajeros()})
 	}
 	method pedidosQueNoSePuedenSatisfacer() {
 		return pedidos.filter({pedido => not rodados.any({ auto => pedido.puedeRealizarPedido(auto)})})
 	}
 	method esColorIncompatible(miColor){
 		return pedidos.all({ pedido => pedido.coloresIncompatibles().any({ color =>  color == miColor }) })
 	}
 	method relajarPedidos(){
 		
 	}
}

// recordamos: los colores con objetos vacíos, no como String
object azul {}
object rojo {}
object verde {}
object beige {}
object negro {}

class Pedido {
	var property distancia 
	var property tiempoMaximo
	var property cantidadPasajeros
	var property coloresIncompatibles = #{}
	
	method velocidadRequerida() {
		return distancia / tiempoMaximo
	}
	
	method puedeRealizarPedido(auto) {
		return (auto.velocidadMaxima()- self.velocidadRequerida() > 10) 
				and (auto.capacidad() >= cantidadPasajeros ) 
				and  not(coloresIncompatibles.any({color => color == auto.color()})) 
	}
	method acelerar() {
		tiempoMaximo -=1
	}
	method relajar() {
		tiempoMaximo +=1
	}
}