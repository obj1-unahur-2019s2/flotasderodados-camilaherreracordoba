class ChevroletCorsa {
  var property color
  method capacidad() { 
    return 4
  }
  method velocidadMaxima()
  method peso()
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
}

// una opción: clase Motor
class Motor { 
	var property peso 
	var property velocidadMaxima
}
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


// sería como el depósito, maneja una colección de rodados
class Dependencia {
	var rodados = []
	var property empleados
/*
 * - `agregarAFlota(rodado)` y `quitarDeFlota(rodado)`.*/
 
	method agregarAFlota(rodado) {
		rodados.add(rodado)
	} 
	
	method quitarDeFlota(rodado) {
		rodados.remove(rodado)
	}
 /*
- `pesoTotalFlota()`, la suma del peso de cada rodado afectado a la flota.*/
	method pesoTotalFlota() {
		return rodados.sum({ rodado => rodado.peso()})
	}
/*- `estaBienEquipada()`, es verdadero si la flota tiene al menos 3 rodados,*/
	method estaBienEquipada() {
		return rodados.count() < 3 and rodados.all({rodado => rodado.velocidadMaxima() >= 100 })
 	} 
 /*  y además, _todos_ los rodados de la flota pueden ir al menos a 100 km/h.*/
 	method capacidadTotalEnColor(color){
 		return rodados.filter({rodado => rodado.color() == color }).sum({rodado => rodado.capacidad()})
 	}
/*- `capacidadTotalEnColor(color)`, la cantidad total de personas que puede transportar
*  la flota afectada a la dependencia, considerando solamente los rodados del color indicado.
- `colorDelRodadoMasRapido()`, eso.
*/
	method colorDelRodadoMasRapido() {
		return rodados.find({ rodados.velocidadMaxima().max()}).color()
	}
/*- `capacidadFaltante()`, que es el resultado de restar, de la cantidad de empleados,
*  la capacidad sumada de los vehículos de la flota.*/
	method capacidadFaltante() {
		return rodados.sum({ rodados.capacidad() }) - self.empleados()
	}
	 /*
- `esGrande()`, la condición es que la dependencia tenga al menos 40 empleados y 5 rodados.
 */
 	method esGrande() {
 		return rodados.size() >= 5 and self.empleados() >= 40
 	}
}

// recordamos: los colores con objetos vacíos, no como String
object azul {}
object rojo {}
object verde {}


// un ejemplo de cómo configurar la trafic en un test
//	test "pruebo la trafic" { 
//  	trafic.motor(bataton)
}