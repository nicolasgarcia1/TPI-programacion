Proceso SistemaDeVentaDePasajesAereos
	
	// cantidad total de asientos disponibles sumando todos los vuelos
	Definir tam, tamVueloMenor, tamVueloMayor Como Entero
	tam <- 10  // 400
	tamVueloMenor <- 1  // 80
	tamVueloMayor <- 4  // 120
	
	// definicion de arreglos
	Definir pasajero Como Entero // subindice y contador del pasajero que inicia la venta de un pasaje
	Definir dni, telefono, idCliente, asiento,rutaElegida, equipajeBodega, contadorAsientos Como Entero
	Definir rutasAereas , nombreApellido como cadena
	Dimension asiento[4,tamVueloMayor+1], contadorAsientos[4]
	Dimension nombreApellido[tam], dni[tam], telefono[tam], idCliente[tam], rutaElegida[tam], equipajeBodega[tam]
	
	Definir opcionMenu Como Caracter 
	
	// inicializacion de arreglos fuera de la funcion principal
	inicializoArreglos(nombreApellido, tam, contadorAsientos, asiento, pasajero, tamVueloMayor) 
	
	mientras opcionMenu <> "salir" Hacer
		Escribir "**BIENVENIDO**"
		Escribir ""
		Escribir "Gracias por viajar con aerolineas messi"
		Escribir "1. Venta pasaje"
		Escribir "2. Buscar pasaje vendido"
		Escribir "3. Buscar pasajero"
		Escribir "4. Ordenar y mostrar lista pasajeros"
		Escribir "5. Listado/s"
		Escribir "Para terminar la ejecucion, ingrese salir"
		Escribir ""
		Escribir "Seleccione una opcion: "
		Leer opcionMenu
		opcionMenu <- Minusculas(opcionMenu) // validacion de ingreso de mayusculas y minusculas
		
		Segun opcionMenu
			caso '1':
				ventaPasaje(rutaElegida, nombreApellido, dni, telefono, idCliente, equipajeBodega, asiento, tam, contadorAsientos, pasajero, tamVueloMenor, tamVueloMayor)
			caso '2':
				buscarPasaje(asiento, dni, nombreApellido, tamVueloMenor, tamVueloMayor)
			caso '3':
				buscarPasajero(nombreApellido, dni, rutaElegida, pasajero, tam)
			caso '4':
				mostrarListaPasajeros(nombreApellido, pasajero, contadorAsientos)
			caso '5': 
				//listados()
			caso 'salir':
				
			De Otro Modo:
				Escribir "Opción inválida"
		FinSegun
	FinMientras
	
	Escribir "Gracias por elegirnos. "
FinProceso

SubProceso ventaPasaje (rutaElegida , nombreApellido, dni, telefono, idCliente, equipajeBodega, asiento, tam, contadorAsientos, pasajero, tamVueloMenor, tamVueloMayor Por Referencia)
	Definir avionLleno Como Logico // booleano para chequear si un vuelo está lleno
	avionLleno <- Falso
	
	Definir systemPause Como Caracter // simula systemPause de c 
	Definir nombre como cadena
	Definir ruta Como Entero
	
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
		ruta <- rutaElegida[pasajero]
		rutaElegida[pasajero] <- validarRuta(ruta)
		
		Si rutaElegida[pasajero] == 0 Entonces
			si contadorAsientos[0] < tamVueloMayor Entonces // chequea que el vuelo no este lleno
				contadorAsientos[0] <- contadorAsientos[0] + 1 // conteo del asiento
				asiento[0,contadorAsientos[0]] <- pasajero // asignacion del asiento al pasajero
			SiNo
				avionLleno <- Verdadero // sirve para validar si el codigo pide el resto de datos o sale
				Mostrar "No se encuentran pasajes disponibles para este vuelo"
				Mostrar ""
				Mostrar "Presione enter para continuar"
				Leer systemPause
			FinSi
		FinSi
		Si rutaElegida[pasajero] == 1 Entonces
			si contadorAsientos[1] < tamVueloMayor Entonces
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
			si contadorAsientos[2] < tamVueloMenor Entonces
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
			si contadorAsientos[3] < tamVueloMenor Entonces
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
			nombre <- nombreApellido[pasajero]
			nombreApellido[pasajero] <- validarNombreApellido(nombre)
			
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
			
			costoTotal <- costopasaje(rutaElegida, asiento, equipajeBodega , costoTotal, pasajero, contadorAsientos) 
			
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
					Mostrar "Equipaje en bodega: NO"
				caso 1:
					Mostrar "Equipaje en bodega: SI"
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


SubProceso buscarPasaje(asiento, dni, nombreApellido, tamVueloMenor, tamVueloMayor Por Referencia)
	Definir systemPause Como Caracter
	Definir pasajeroBuscado, ruta Como Entero
	
	Si nombreApellido[0] == "" Entonces
		Mostrar ""
		Mostrar "Todavia no hay pasajeros ingresados"
		Mostrar ""
		Mostrar "Presione enter para continuar."
		Leer systemPause
	SiNo
		Mostrar "1. Buenos Aires - Bariloche"
		Mostrar "2. Bueno Aires - Salta"
		Mostrar "3. Rosario - Buenos Aires"
		Mostrar "4. Mar Del Plata - Mendoza"
		Mostrar "Ingrese el vuelo elegido: "
		leer ruta
		ruta <- validarRuta(ruta)
		
		si asiento[ruta, 1] == -1 Entonces
			Mostrar ""
			Mostrar "El vuelo no tiene asientos ocupados."
			Mostrar "Presione enter para continuar."
			Leer systemPause
		SiNo
			Mostrar "Ingrese su numero de asiento: "
			leer nroAsiento
			
			si ruta == 0 o ruta == 1
				Mientras nroAsiento < 1 o nroAsiento > tamVueloMayor
					Mostrar "Asiento fuera del rango. Ingrese un asiento valido:"
					leer nroAsiento
				FinMientras
			SiNo
				Mientras nroAsiento < 1 o nroAsiento > tamVueloMenor
					Mostrar "Asiento fuera del rango. Ingrese un asiento valido:"
					leer nroAsiento
				FinMientras
			FinSi
			
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
				Mostrar "El asiento aún no está ocupado."
				Mostrar "Presione enter para continuar."
				Leer systemPause
			FinSi
		FinSi
	FinSi
	
FinSubProceso


SubProceso buscarPasajero(nombreApellido, dni, rutaElegida, pasajero, tam Por Referencia)
	Definir i Como Entero
	i <- 0
	Definir encontrado Como Logico
	encontrado <- Falso
	Definir nombre como cadena
	Definir systemPause Como Caracter
	
	si nombreApellido[0] == "" Entonces
		Mostrar ""
		Mostrar "Todavia no hay pasajeros ingresados."
		Mostrar ""
		Mostrar "Presione enter para continuar."
		Leer systemPause
	SiNo
		Mostrar "Ingrese su nombre y apellido"
		Leer nombre
		nombre <- validarNombreApellido(nombre)
		
		Mientras !encontrado y i < tam
			si nombreApellido[i] == nombre
				encontrado <- verdadero
			SiNo
				i <- i+1
			FinSi
		FinMientras
		
		Si encontrado Entonces
			Mostrar ""
			Mostrar "Nombre y apellido: ",nombreApellido[i]
			Segun rutaElegida[i]
				caso 0:
					Mostrar "Ruta: Buenos Aires - Bariloche"
				Caso 1:
					Mostrar "Ruta: Bueno Aires - Salta"
				Caso 2:
					Mostrar "Ruta: Rosario - Buenos Aires"
				Caso 3:
					Mostrar "Ruta: Mar Del Plata - Mendoza"
			FinSegun
			Mostrar "DNI: ",dni[i]
			Mostrar ""
			Mostrar "Presione enter para continuar."
			Leer systemPause
		SiNo
			Mostrar ""
			Mostrar "No se encontró el pasajero."
			Mostrar ""
			Mostrar "Presione enter para continuar."
			Leer systemPause
		FinSi
	FinSi
	
FinSubProceso


SubProceso mostrarListaPasajeros(nombreApellido, pasajero, contadorAsientos Por Referencia)
	Definir ruta, opc, i, subIndice Como Entero
	
	Mostrar "1. Buenos Aires - Bariloche"
	Mostrar "2. Bueno Aires - Salta"
	Mostrar "3. Rosario - Buenos Aires"
	Mostrar "4. Mar Del Plata - Mendoza"
	Mostrar "Ingrese la ruta a mostrar: "
	leer ruta
	ruta <- validarRuta(ruta)
	
	Mostrar "1. Listado ascendente"
	Mostrar "2. Listado descendente"
	Mostrar "Ingrese una opcion: "
	Leer opc
	Mientras opc < 1 o opc > 2 Hacer
		Mostrar "Ingrese una opcion valida: "
		Leer opc
	FinMientras
	
	Mostrar contadorAsientos[ruta]
	
	Si opc == 1 Entonces
		Para i <- 0 Hasta contadorAsientos[ruta] - 1
			Mostrar "----------------------------------------"
			Mostrar "ASIENTO ",i+1
			Mostrar nombreApellido[i]
			Mostrar "----------------------------------------"
		FinPara
	SiNo
		Para j <- contadorAsientos[ruta] - 1 Hasta 0 Con Paso -1
			Mostrar "----------------------------------------"
			Mostrar "ASIENTO ",j+1
			Mostrar nombreApellido[j]
			Mostrar "----------------------------------------"
		FinPara
	FinSi
FinSubProceso


//SubProceso listados(Por Referencia)

//FinSubProceso


SubProceso ruta <- validarRuta(ruta Por Valor)
	Mientras ruta < 1 o ruta > 4
		Escribir "Ruta invalida, ingrese nuevamente: "
		Leer ruta
	FinMientras
	ruta <- ruta - 1
FinSubProceso


SubProceso nombre <- validarNombreApellido(nombre Por Valor)
	Mientras Longitud(nombre) > 60 o Longitud(nombre) < 7
		Escribir "Ingrese un nombre valido"
		Leer nombre
	FinMientras
	nombre <- Mayusculas(nombre) // convierte a mayusculas para despues validar la busqueda de la opcion 3
FinSubProceso 


SubProceso validarDNI(dni, pasajero Por Referencia)
	Definir i Como Entero
	
	si pasajero > 1 Entonces
		Para i <- 0 Hasta pasajero - 1 Hacer
			si dni[i] == dni[pasajero]
				Mostrar "DNI ya registrado. No puede sacar mas de un pasaje con el mismo DNI"
				Mostrar "Ingrese un DNI valido: "
				Leer dni[pasajero]
				validarDNI(dni, pasajero)
			FinSi
		FinPara
	SiNo
		si pasajero == 1 Entonces
			si dni[0] == dni[1]
				Mostrar "DNI ya registrado. No puede sacar mas de un pasaje con el mismo DNI"
				Mostrar "Ingrese un DNI valido: "
				Leer dni[pasajero]
				validarDNI(dni, pasajero)
			FinSi
		FinSi
	FinSi
	
	Mientras dni[pasajero] < 1000000 o dni[pasajero] > 99999999
		Escribir "Ingrese un dni valido: "
		Leer dni[pasajero]
		validarDNI(dni, pasajero)
	FinMientras
	
FinSubProceso


SubProceso validarTelefono(telefono, pasajero Por Referencia)
	Definir i Como Entero
	
	si pasajero > 1 Entonces
		Para i <- 0 Hasta pasajero - 1 Hacer
			si telefono[i] == telefono[pasajero]
				Mostrar "Telefono ya registrado. No puede sacar mas de un pasaje con el mismo telefono"
				Mostrar "Ingrese un telefono valido: "
				Leer telefono[pasajero]
				validarTelefono(telefono, pasajero)
			FinSi
		FinPara
	SiNo
		si pasajero == 1 Entonces
			si telefono[0] == telefono[1]
				Mostrar "Telefono ya registrado. No puede sacar mas de un pasaje con el mismo telefono"
				Mostrar "Ingrese un telefono valido: "
				Leer telefono[pasajero]
				validarTelefono(telefono, pasajero)
			FinSi
		FinSi
	FinSi
	
	mientras telefono[pasajero] < 1000000000 o telefono[pasajero] > 99999999999
		Escribir "ingrese un telefono valido: "
		leer telefono[pasajero]
		validarTelefono(telefono, pasajero)
	FinMientras
FinSubProceso


SubProceso validarIdCliente(idCliente, pasajero Por Referencia)
	Definir i Como Entero
	
	si pasajero > 1 Entonces
		Para i <- 0 Hasta pasajero - 1 Hacer
			si idCliente[i] == idCliente[pasajero]
				Mostrar "Numero de cliente ya registrado. No puede sacar mas de un pasaje con el mismo numero de cliente"
				Mostrar "Ingrese un numero de cliente valido: "
				Leer idCliente[pasajero]
				validarIdCliente(idCliente, pasajero)
			FinSi
		FinPara
	SiNo
		si pasajero == 1 Entonces
			si idCliente[0] == idCliente[1]
				Mostrar "Numero de cliente ya registrado. No puede sacar mas de un pasaje con el mismo numero de cliente"
				Mostrar "Ingrese un numero de cliente valido: "
				Leer idCliente[pasajero]
				validarIdCliente(idCliente, pasajero)
			FinSi
		FinSi
	FinSi
	
	Mientras  idCliente[pasajero] < 1000 o idCliente[pasajero] > 9999
		Escribir "Ingrese un numero de cliente valido (entre 1000 y 9999)"
		Leer idCliente[pasajero]
		validarIdCliente(idCliente, pasajero)
	FinMientras
FinSubProceso


SubProceso costoTotal <- costopasaje (rutaElegida, asiento, equipajeBodega, costoTotal, pasajero, contadorAsientos Por Referencia)
	Si rutaElegida[pasajero] == 0
		Si contadorAsientos[0] <= 20
			costoTotal <- 150000
		SiNo
			Si contadorAsientos[0] > 20 y contadorAsientos[0] <= 60
				costoTotal <- 150000 * 1.10
			SiNo
				costoTotal <- 180000
			FinSi
		FinSi
	FinSi
	
	Si rutaElegida[pasajero] == 1
		Si contadorAsientos[1] <= 20
			costoTotal <- 120000
		SiNo
			Si contadorAsientos[1] > 20 y contadorAsientos[1] <= 60
				costoTotal <- 120000 * 1.10
			SiNo
				costoTotal <- 150000
			FinSi
		FinSi
	FinSi
	
	Si rutaElegida[pasajero] == 2
		Si contadorAsientos[2] <= 10
			costoTotal <- 70000
		SiNo
			si contadorAsientos[2] > 10 y contadorAsientos[2] <= 40
				costoTotal <- 70000 * 1.15
			sino
				costoTotal <- 95000
			FinSi
		FinSi
	FinSi
	
	Si rutaElegida[pasajero] == 3
		Si contadorAsientos[3] <= 10
			costoTotal <- 95000
		SiNo
			si contadorAsientos[3]> 10 y contadorAsientos[3] <= 40
				costoTotal <- 95000 * 1.15
			SiNo
				costoTotal <- 125000
			FinSi
		FinSi
	FinSi
	
	Si equipajeBodega[pasajero] == 1
		costoTotal <- costoTotal * 1.05
	FinSi
FinSubProceso


SubProceso inicializoArreglos(nombreApellido, tam, contadorAsientos, asiento, pasajero, tamVueloMayor Por Referencia)
	definir i, j, k Como Enteros
	
	Para i <- 0 Hasta tam-1 Hacer
		nombreApellido[i] <- ""
	FinPara
	
	contadorAsientos[0] <- 0
	contadorAsientos[1] <- 0
	contadorAsientos[2] <- 0
	contadorAsientos[3] <- 0
	
	Para j <- 0 Hasta 3 Hacer
		para k <- 0 hasta tamVueloMayor Hacer
			asiento[j, k] <- -1
		FinPara
	FinPara
	
	pasajero <- 0
FinSubProceso