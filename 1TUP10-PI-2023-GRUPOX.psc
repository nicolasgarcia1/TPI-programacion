Proceso SistemaDeVentaDePasajesAereos
	
	// cantidad total de asientos disponibles sumando todos los vuelos
	Definir tam Como Entero
	tam <- 400 
	
	// definicion de arreglos
	Definir pasajero Como Entero // subindice y contador del pasajero que inicia la venta de un pasaje
	Definir dni, telefono, idCliente, asiento,rutaElegida Como Entero
	Definir rutasAereas , nombreApellido como cadena
	Definir equipajeBodega, contadorAsientos  Como Entero
	Dimension asiento[4,tam], rutasAereas[4], contadorAsientos[4]
	Dimension nombreApellido[tam], dni[tam], telefono[tam], idCliente[tam], rutaElegida[tam], equipajeBodega[tam]
	
	Definir opcionMenu Como Caracter 
	
	// inicializacion de arreglos fuera de la funcion principal
	inicializoArreglos(rutasAereas, nombreApellido, tam, contadorAsientos, asiento, pasajero) 
	
	mientras opcionMenu <> "salir" Hacer
		Escribir "***BIENVENIDO***"
		Escribir ""
		Escribir "Gracias por viajar con aerolineas messi"
		Escribir "1. Venta pasaje"
		Escribir "2. Buscar pasaje vendido"
		Escribir "3. Buscar pasajero"
		Escribir "4. Ordenar y mostrar lista pasajeros"
		Escribir "5. Listado/s"
		Escribir "Para terminar la ejecucion, ingrese *salir*"
		Escribir ""
		Escribir "Seleccione una opcion: "
		Leer opcionMenu
		opcionMenu <- Minusculas(opcionMenu) // validacion de ingreso de mayusculas y minusculas
		
		Segun opcionMenu
			caso '1':
				ventaPasaje(rutaElegida, nombreApellido, dni, telefono, idCliente, equipajeBodega, asiento, tam, contadorAsientos, pasajero)
			caso '2':
				buscarPasaje(asiento, dni, nombreApellido)
			caso '3':
				//buscarPasajero()
			caso '4':
				//mostrarListaPasajeros()
			caso '5': 
				//listados()
			caso 'salir':
				
			De Otro Modo:
				Escribir "Opción inválida"
		FinSegun
	FinMientras
	
	Escribir "Gracias por elegirnos. "
FinProceso

SubProceso ventaPasaje (rutaElegida , nombreApellido, dni, telefono, idCliente, equipajeBodega, asiento, tam, contadorAsientos, pasajero Por Referencia)
	Definir avionLleno Como Logico // booleano para chequear si un vuelo está lleno
	avionLleno <- Falso
	
	Definir systemPause Como Caracter
	
	// busqueda del indice a usar, se le asignará el primer lugar vacio que haya del 0 hasta tam
	Mientras nombreApellido[pasajero] <> "" y pasajero < tam Hacer 
		pasajero <- pasajero+1
	FinMientras
	
	Definir costoTotal Como Real

	Si pasajero < tam Entonces  // chequea que no esten todos los vuelos llenos
		Definir opcionEquipaje Como Entero
		Mostrar "Elija una opcion"
		Mostrar "1. Buenos Aires - Bariloche"
		Mostrar "2. Bueno Aires - Salta"
		Mostrar "3. Rosario - Buenos Aires"
		Mostrar "4. Mar Del Plata - Mendoza"
		leer rutaElegida[pasajero]
		validarRutaElegida(rutaElegida, pasajero)
		rutaElegida[pasajero] <- rutaElegida[pasajero] - 1 // se le resta uno para poder usar esta variable como subindice
		
		Si rutaElegida[pasajero] == 0 Entonces
			si contadorAsientos[0] < 120 Entonces
				contadorAsientos[0] <- contadorAsientos[0] + 1 // conteo del asiento
				asiento[0,contadorAsientos[0]] <- pasajero // asignacion del asiento al pasajero
			SiNo
				avionLleno <- Verdadero
				Mostrar "No se encuentran pasajes disponibles para este vuelo"
				Mostrar ""
				Mostrar "Presione enter para continuar"
				Leer systemPause
			FinSi
		FinSi
		Si rutaElegida[pasajero] == 1 Entonces
			si contadorAsientos[1] < 120 Entonces
				contadorAsientos[1] <- contadorAsientos[1] + 1
				asiento[1,contadorAsientos[1]] <- pasajero
			SiNo
				avionLleno <- Verdadero
				Mostrar "No se encuentran pasajes disponibles para este vuelo"
				Mostrar ""
				Mostrar "Presione enter para continuar"
				Leer systemPause
			FinSi
		FinSi
		Si rutaElegida[pasajero] == 2 Entonces
			si contadorAsientos[2] < 80 Entonces
				contadorAsientos[2] <- contadorAsientos[2] + 1
				asiento[2,contadorAsientos[2]] <- pasajero
			SiNo
				avionLleno <- Verdadero
				Mostrar "No se encuentran pasajes disponibles para este vuelo"
				Mostrar ""
				Mostrar "Presione enter para continuar"
				Leer systemPause
			FinSi
		FinSi
		Si rutaElegida[pasajero] == 3 Entonces
			si contadorAsientos[3] < 80 Entonces
				contadorAsientos[3] <- contadorAsientos[3] + 1
				asiento[3,contadorAsientos[3]] <- pasajero
			SiNo
				avionLleno <- Verdadero
				Mostrar "No se encuentran pasajes disponibles para este vuelo"
				Mostrar ""
				Mostrar "Presione enter para continuar"
				Leer systemPause
			FinSi
		FinSi
		
		Si avionLleno == Falso Entonces
			Mostrar "Ingrese nombre y apellido: "
			leer nombreApellido[pasajero]
			validarNombreApellido(nombreApellido, pasajero)
			
			Mostrar "Ingrese DNI"
			leer dni[pasajero]
			validarDNI(dni, pasajero)
			
			Mostrar "Ingrese su telefono: "
			leer telefono[pasajero]
			validarTelefono(telefono, pasajero)
			
			Mostrar "Ingrese su numero de cliente: "
			leer idCliente[pasajero]
			validarIdCliente(idCliente, pasajero)
			
			Mostrar "¿Su equipaje va en la bodega? 1-SI 2-NO: "
			leer opcionEquipaje
			Mientras opcionEquipaje < 1 o opcionEquipaje > 2 Hacer
				Mostrar "Opcion invalida. Ingrese nuevamente 1-SI 2-NO: "
				Leer opcionEquipaje
			FinMientras
			
			Segun opcionEquipaje
				caso 1:
					equipajeBodega[pasajero] <- 1 // verdadero
				caso 2:
					equipajeBodega[pasajero] <- 0 // falso
			FinSegun

			costoTotal <- costopasaje(rutaElegida, asiento, equipajeBodega , costoTotal, pasajero) 
		
			Segun rutaElegida[pasajero]
				caso 0:
					mostrar "Ruta: Buenos Aires - Bariloche"
				caso 1:
					mostrar "Ruta: Buenos Aires - Salta"
				caso 2: 
					mostrar "Ruta: Rosario - Buenos Aires"
				caso 3:
					mostrar "Ruta: Mar del Plata - Mendoza"
			FinSegun
			Mostrar "Nombre y Apellido: ",nombreApellido[pasajero]
			Mostrar "DNI: ",dni[pasajero]
			Mostrar "Telefono: ",telefono[pasajero]
			Mostrar "Id Cliente: ",idCliente[pasajero]
			Segun equipajeBodega[pasajero]
				Caso 0:
					Mostrar "Equipaje en bodega: SI"
				caso 1:
					Mostrar "Equipaje en bodega: NO"
			FinSegun
			Mostrar "Asiento: ",contadorAsientos[rutaElegida[pasajero]]
			Mostrar "Costo pasaje: $",costoTotal
			Mostrar ""
			Mostrar "Presione enter para continuar"
			leer systemPause
		FinSi
	SiNo
		Mostrar "No hay pasajes disponibles para ningun vuelo"
		Mostrar ""
		Mostrar "Presione enter para continuar"
		Leer systemPause
	FinSi
	
FinSubProceso


SubProceso buscarPasaje(asiento, dni, nombreApellido Por Referencia)
	Definir systemPause Como Caracter
	Definir pasajeroBuscado Como Entero
	
	Mostrar "1. Buenos Aires - Bariloche"
	Mostrar "2. Bueno Aires - Salta"
	Mostrar "3. Rosario - Buenos Aires"
	Mostrar "4. Mar Del Plata - Mendoza"
	Mostrar "Ingrese el vuelo elegido: "
	leer ruta
	Mientras ruta < 1 o opcion > 4
		Mostrar "Opcion invalida, ingrese nuevamente: "
		leer ruta
	FinMientras
	ruta <- ruta - 1
	
	si asiento[ruta, 1] == -1 Entonces
		Mostrar ""
		Mostrar "El vuelo no tiene asientos ocupados."
		Mostrar "Presione enter para continuar."
		Leer systemPause
	SiNo
		Mostrar "Ingrese su numero de asiento"
		leer nroAsiento
		
		si asiento[ruta, nroAsiento] <> -1 Entonces
			pasajeroBuscado <- asiento[ruta, nroAsiento]
			Mostrar ""
			Mostrar "Nombre y apellido: ",nombreApellido[pasajeroBuscado]
			Segun ruta
				caso 0:
					Mostrar "Ruta: Buenos Aires - Bariloche"
				Caso 1:
					Mostrar "Ruta: Bueno Aires - Salta"
				Caso 2:
					Mostrar "Ruta: Rosario - Buenos Aires"
				Caso 3:
					Mostrar "Ruta: Mar Del Plata - Mendoza"
			FinSegun
			Mostrar "DNI: ",dni[pasajeroBuscado]
			Mostrar ""
			Mostrar "Presione enter para continuar."
			Leer systemPause
		SiNo
			Mostrar ""
			Mostrar "El asiento aún no está ocupado o no existe."
			Mostrar "Presione enter para continuar."
			Leer systemPause
		FinSi
	FinSi

FinSubProceso


//SubProceso buscarPasajero (Por Referencia)
	
//FinSubProceso


//SubProceso mostrarListaPasajeros (Por Referencia)
	
//FinSubProceso


//SubProceso listados (Por Referencia)
	
//FinSubProceso


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


SubProceso validarRutaElegida(rutaElegida, pasajero Por Referencia)
	Mientras rutaElegida[pasajero] < 1 o rutaElegida[pasajero] > 4
		Escribir "Ruta invalida, ingrese nuevamente: "
		Leer rutaElegida[pasajero]
	FinMientras
FinSubProceso


SubProceso validarNombreApellido(nombreApellido, pasajero Por Referencia)
	Mientras Longitud(nombreApellido[pasajero]) > 60 o Longitud(nombreApellido[pasajero]) < 7
		Escribir "Ingrese un nombre valido"
		Leer nombreApellido[pasajero]
	FinMientras
	nombreApellido[pasajero] <- Mayusculas(nombreApellido[pasajero]) // convierte a minusculas para despues validar la busqueda de la opcion 3
FinSubProceso 


SubProceso validarDNI(dni, pasajero Por Referencia)
	Mientras dni[pasajero] < 1000000 o dni[pasajero] > 99999999
		Escribir "Ingrese un dni valido: "
		Leer dni[pasajero]
	FinMientras
FinSubProceso


SubProceso validarTelefono(telefono, pasajero Por Referencia)
	mientras telefono[pasajero] < 1000000000 o telefono[pasajero] > 99999999999
		Escribir "ingrese un telefono valido: "
		leer telefono[pasajero]
	FinMientras
FinSubProceso


SubProceso validarIdCliente(idCliente, pasajero Por Referencia)
	Mientras  idCliente[pasajero] < 1000 o idCliente[pasajero] > 9999
		Escribir "Ingrese un numero de cliente valido (entre 1000 y 9999)"
		Leer idCliente[pasajero]
	FinMientras
FinSubProceso


SubProceso costoTotal <- costopasaje (rutaElegida, asiento, equipajeBodega, costoTotal, pasajero Por Referencia)
	Si rutaElegida[pasajero] == 0
		Si asiento[0,pasajero] <= 20
			costoTotal <- 150000
		FinSi
		Si asiento[0,pasajero] > 20 y asiento[pasajero] <= 60
			costoTotal <- 150000 * 1.10
		FinSi
		Si asiento[0,pasajero] > 60
			costoTotal <- 180000
		FinSi
	FinSi
	
	Si rutaElegida[pasajero] == 1
		Si asiento[1,pasajero] <= 20
			costoTotal <- 120000
		FinSi
		Si asiento[1,pasajero] > 20 y asiento[pasajero] <= 60
			costoTotal <- 120000 * 1.10
		FinSi
		Si asiento[1,pasajero] > 60
			costoTotal <- 150000
		FinSi
	FinSi
	
	Si rutaElegida[pasajero] == 2
		Si asiento[2,pasajero] <= 10
			costoTotal <- 70000
		FinSi
		Si asiento[2,pasajero] > 10 y asiento[pasajero] <= 40
			costoTotal <- 70000 * 1.15
		FinSi
		Si asiento[2,pasajero] > 40
			costoTotal <- 95000
		FinSi
	FinSi
	
	Si rutaElegida[pasajero] == 3
		Si asiento[3,pasajero] <= 10
			costoTotal <- 95000
		FinSi
		Si asiento[3,pasajero] > 10 y asiento[pasajero] <= 40
			costoTotal <- 95000 * 1.15
		FinSi
		Si asiento[3,pasajero] > 40
			costoTotal <- 125000
		FinSi
	FinSi
	
	Si equipajeBodega[pasajero] == 1
		costoTotal <- costoTotal * 1.05
	FinSi
FinSubProceso


SubProceso inicializoArreglos(rutasAereas, nombreApellido, tam, contadorAsientos, asiento, pasajero Por Referencia)
	definir i, j, k Como Enteros
	rutasAereas[0] <- "Buenos Aires - Bariloche"
	rutasAereas[1] <- "Buenos Aires - Salta"
	rutasAereas[2] <- "Rosario - Buenos Aires"
	rutasAereas[3] <- "Mar Del Plata - Mendoza"
	
	Para i <- 0 Hasta tam-1 Hacer
		nombreApellido[i] <- ""
	FinPara
	
	contadorAsientos[0] <- 0
	contadorAsientos[1] <- 0
	contadorAsientos[2] <- 0
	contadorAsientos[3] <- 0
	
	Para j <- 0 Hasta 3 Hacer
		para k <- 0 hasta tam-1 Hacer
			asiento[j, k] <- -1
		FinPara
	FinPara
	
	pasajero <- 0
FinSubProceso


