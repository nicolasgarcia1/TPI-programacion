Proceso SistemaDeVentaDePasajesAereos
	Definir opcionMenu, dni, telefono, idCliente, asiento,rutaElegida, asiento Como Entero
	Definir rutasAereas , nombreApellido como cadena
	Dimension rutasAereas[4]
	Definir capacidadRutasAereas, equipajeBodega Como Entero
	Dimension capacidadRutasAereas[4]
	Dimension nombreApellido[i]
	Dimension dni[i]
	Dimension telefono[i]
	Dimension idCliente[i]
	Dimension asiento[i]
	Dimension rutaElegida[i]
	Dimension equipajeBodega[i]
	Dimension asiento[4,i]
	contador1 <- 0
	contador2 <- 0
	contador3 <- 0
	contador4 <- 0
	
	inicializoArreglos(rutasAereas, capacidadRutasAereas)
	
	Escribir "***BIENVENIDO***"
	Escribir ""
	Escribir "Gracias por viajar con aerolineas messi"
	Escribir "1. Venta pasaje"
	Escribir "2. Buscar pasaje vendido"
	Escribir "3. Buscar pasajero"
	Escribir "4. Ordenar y mostrar lista pasajeros"
	Escribir "5. Listado/s"
	Escribir "Seleccione una opcion: "
	Leer opcionMenu
	
	Segun opcionMenu
		caso 1:
			ventaPasaje(rutaelegida , nombreApellido,dni,telefono,idCliente, equipajeBodega, asiento)
		caso 2:
			buscarPasaje()
		caso 3:
			buscarPasajero()
		caso 4:
			mostrarListaPasajeros()
		caso 5: 
			listados()
		otro caso:
			Escribir "Opción inválida"
	FinSegun
	
FinProceso

SubProceso ventaPasaje ( rutaelegida , nombreApellido,dni,telefono,idCliente, equipajeBodega, asiento Por Referencia)
	Definir contador1, contador2, contador3, contador4 Como Entero
	Definir opcioviaje como caracter
	Mostrar "Elija una opcion"
	Mostrar "1. Buenos Aires - Bariloche"
	Mostrar "2. Bueno Aires - Salta"
	Mostrar "3. Rosario - Buenos Aires"
	Mostrar "4. Mar Del Plata - Mendoza"
	leer rutaelegida[i]
	rutaelegida[i] <- rutaelegida[i] - 1
	
	Si rutaelegida[i] == 0 y contador1 < 120 Entonces
		contador1 <- contador1 + 1
		asiento[0,i] <- contador1
	FinSi
	Si rutaelegida[i] == 1 y contador2 < 120 Entonces
		contador2 <- contador2 + 1
		asiento[1,i] <- contador2
	FinSi
	Si rutaelegida[i] == 2 y contador3 < 80 Entonces
		contador3 <- contador3 + 1
		asiento[2,i] <- contador3
	FinSi
	Si rutaelegida[i] == 3 y contador4 < 80 Entonces
		contador4 <- contador4 + 1
		asiento[3,i] <- contador4
	FinSi
	
	
	Mostrar "Ingrese nombre y apellido"
	leer nombreApellido[i]
	Mostrar "Ingrese DNI"
	leer dni[i]
	Mostrar "Ingrese su telefono"
	leer telefono[i]
	Mostrar "Ingrese su numero de cliente"
	leer idCliente[i]
	Mostrar "¿Su equipaje va en la bodega? Ingrese SI o NO"
	leer opcionviaje
	Si opcionviaje == "si"
		equipajeBodega[i] <- 1
	SiNo
		equipajeBodega[i] <- 0
	FinSi
	
	
	
	
	
	
FinSubProceso


SubProceso buscarPasaje (Por Referencia)
	
FinSubProceso


SubProceso buscarPasajero (Por Referencia)
	
FinSubProceso


SubProceso mostrarListaPasajeros (Por Referencia)
	
FinSubProceso


SubProceso listados (Por Referencia)
	
FinSubProceso


SubProceso inicializoArreglos(rutasAereas Por Referencia, capacidadRutasAereas Por Referencia)
	rutasAereas[0] <- "Buenos Aires - Bariloche"
	rutasAereas[1] <- "Buenos Aires - Salta"
	rutasAereas[2] <- "Rosario - Buenos Aires"
	rutasAereas[3] <- "Mar Del Plata - Mendoza"
	capacidadRutasAereas[0] <- 120
	capacidadRutasAereas[1] <- 120
	capacidadRutasAereas[2] <- 80
	capacidadRutasAereas[3] <- 80
FinSubProceso






SubProceso OrdenSeleccion(arreglo, dim)
	Definir i, j, pos_menor, aux Como Entero
	para i <- 0 hasta dim - 2 Hacer
		pos_menor <- i
		para j<- i + 1 hasta dim - 1 Hacer
			Si arreglo[j]<arreglo[pos_menor] Entonces
				pos_menor <- j
			FinSi
			cant_comparaciones <- cant_comparaciones + 1
		FinPara
		aux <- arreglo[i]
		arreglo[i] <- arreglo[pos_menor]
		arreglo[pos_menor]<-aux
	FinPara
FinSubProceso