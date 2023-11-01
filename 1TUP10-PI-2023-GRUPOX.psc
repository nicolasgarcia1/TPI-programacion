Proceso SistemaDeVentaDePasajesAereos
	Definir tam, contador1, contador2, contador3, contador4 Como Entero
	tam <- 400
	Definir dni, telefono, idCliente, asiento,rutaElegida Como Entero
	Definir rutasAereas , nombreApellido como cadena
	Definir opcionMenu Como Caracter
	Definir capacidadRutasAereas, equipajeBodega Como Entero
	Dimension capacidadRutasAereas[4], asiento[4,tam], rutasAereas[4]
	Dimension nombreApellido[tam], dni[tam], telefono[tam], idCliente[tam], rutaElegida[tam], equipajeBodega[tam]
	contador1 <- 0
	contador2 <- 0
	contador3 <- 0
	contador4 <- 0
	
	inicializoArreglos(rutasAereas, capacidadRutasAereas, nombreApellido, tam)
	
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
		caso '1':
			ventaPasaje(rutaElegida, nombreApellido, dni, telefono, idCliente, equipajeBodega, asiento, tam, contador1, contador2, contador3, contador4)
		caso '2':
			//buscarPasaje()
		caso '3':
			//buscarPasajero()
		caso '4':
			//mostrarListaPasajeros()
		caso '5': 
			//listados()
		De Otro Modo:
			Escribir "Opci�n inv�lida"
	FinSegun
	
FinProceso

SubProceso ventaPasaje (rutaElegida , nombreApellido, dni, telefono, idCliente, equipajeBodega, asiento, tam, contador1, contador2, contador3, contador4 Por Referencia)
	Definir pasajero Como Entero
	Mientras nombreApellido[pasajero] <> "" y pasajero < tam Hacer
		pasajero <- pasajero+1
	FinMientras
	Definir costoTotal Como Real

	Si pasajero <= tam Entonces
		Definir opcionEquipaje Como Entero
		Mostrar "Elija una opcion"
		Mostrar "1. Buenos Aires - Bariloche"
		Mostrar "2. Bueno Aires - Salta"
		Mostrar "3. Rosario - Buenos Aires"
		Mostrar "4. Mar Del Plata - Mendoza"
		leer rutaElegida[pasajero]
		rutaElegida[pasajero] <- rutaElegida[pasajero] - 1
		
		Si rutaElegida[pasajero] == 0 y contador1 < 120 Entonces
			contador1 <- contador1 + 1
			asiento[0,pasajero] <- contador1
		FinSi
		Si rutaElegida[pasajero] == 1 y contador2 < 120 Entonces
			contador2 <- contador2 + 1
			asiento[1,pasaje] <- contador2
		FinSi
		Si rutaElegida[pasajero] == 2 y contador3 < 80 Entonces
			contador3 <- contador3 + 1
			asiento[2,pasajero] <- contador3
		FinSi
		Si rutaElegida[pasajero] == 3 y contador4 < 80 Entonces
			contador4 <- contador4 + 1
			asiento[3,pasajero] <- contador4
		FinSi
		
		
		Mostrar "Ingrese nombre y apellido: "
		leer nombreApellido[pasajero]
		Mostrar "Ingrese DNI"
		leer dni[pasajero]
		Mostrar "Ingrese su telefono: "
		leer telefono[pasajero]
		Mostrar "Ingrese su numero de cliente: "
		leer idCliente[pasajero]
		Mostrar "�Su equipaje va en la bodega? 1-SI 2-NO: "
		leer opcionEquipaje
		Mientras opcionEquipaje < 1 o opcionEquipaje > 2 Hacer
			Mostrar "Opcion invalida. Ingrese nuevamente 1-SI 2-NO: "
			Leer opcionEquipaje
		FinMientras
		Segun opcionEquipaje
			caso 1:
				equipajeBodega[pasajero] <- 1
			caso 2:
				equipajeBodega[pasajero] <- 0
		FinSegun
	FinSi

	costoTotal <- costopasaje(rutaElegida, asiento, equipajeBodega , costoTotal, pasajero)
	
	
	Segun rutaElegida[pasajero]
		caso 0:
			mostrar "Ruta: Buenos Aires - Salta"
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
	Mostrar "Asiento: ",asiento[rutaElegida[pasajero], pasajero]
	Mostrar "Costo pasaje: $",costoTotal
	
	
FinSubProceso


//SubProceso buscarPasaje (Por Referencia)
	
//FinSubProceso


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


SubProceso inicializoArreglos(rutasAereas, capacidadRutasAereas, nombreApellido, tam Por Referencia)
	definir i Como Entero
	rutasAereas[0] <- "Buenos Aires - Bariloche"
	rutasAereas[1] <- "Buenos Aires - Salta"
	rutasAereas[2] <- "Rosario - Buenos Aires"
	rutasAereas[3] <- "Mar Del Plata - Mendoza"
	capacidadRutasAereas[0] <- 120
	capacidadRutasAereas[1] <- 120
	capacidadRutasAereas[2] <- 80
	capacidadRutasAereas[3] <- 80
	
	Para i <- 0 Hasta tam-1 Hacer
		nombreApellido[i] <- ""
	FinPara
FinSubProceso


