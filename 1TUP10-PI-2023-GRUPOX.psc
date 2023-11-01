Proceso SistemaDeVentaDePasajesAereos
	Definir tam, contador1, contador2, contador3, contador4 Como Entero
	Definir opcionMenu, dni, telefono, idCliente, asiento,rutaElegida, asiento Como Entero
	Definir rutasAereas , nombreApellido como cadena
	Definir capacidadRutasAereas, equipajeBodega Como Entero
	Dimension capacidadRutasAereas[4], asiento[4,tam], rutasAereas[4]
	Dimension nombreApellido[tam], dni[tam], telefono[tam], idCliente[tam], asiento[tam], rutaElegida[tam], equipajeBodega[tam]
	contador1 <- 0
	contador2 <- 0
	contador3 <- 0
	contador4 <- 0
	tam <- 400
	
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
		caso 1:
			ventaPasaje(rutaElegida, nombreApellido, dni, telefono, idCliente, equipajeBodega, asiento, tam, contador1, contador2, contador3, contador4)
		caso 2:
			buscarPasaje()
		caso 3:
			buscarPasajero()
		caso 4:
			mostrarListaPasajeros()
		caso 5: 
			listados()
		De Otro Modo:
			Escribir "Opción inválida"
	FinSegun
	
FinProceso

SubProceso ventaPasaje (rutaElegida , nombreApellido, dni, telefono, idCliente, equipajeBodega, asiento, tam, contador1, contador2, contador3, contador4 Por Referencia)
	Definir i Como Entero
	Mientras nombreApellido <> "" y i < tam Hacer
		i <- i+1
	FinMientras
	Definir ruta, equipaje como cadena
	Definir costoTotal Como Real

	Si i <= tam Entonces
		Definir opcionEquipaje Como Entero
		Mostrar "Elija una opcion"
		Mostrar "1. Buenos Aires - Bariloche"
		Mostrar "2. Bueno Aires - Salta"
		Mostrar "3. Rosario - Buenos Aires"
		Mostrar "4. Mar Del Plata - Mendoza"
		leer rutaElegida[i]
		rutaElegida[i] <- rutaElegida[i] - 1
		
		Si rutaElegida[i] == 0 y contador1 < 120 Entonces
			contador1 <- contador1 + 1
			asiento[0,i] <- contador1
		FinSi
		Si rutaElegida[i] == 1 y contador2 < 120 Entonces
			contador2 <- contador2 + 1
			asiento[1,i] <- contador2
		FinSi
		Si rutaElegida[i] == 2 y contador3 < 80 Entonces
			contador3 <- contador3 + 1
			asiento[2,i] <- contador3
		FinSi
		Si rutaElegida[i] == 3 y contador4 < 80 Entonces
			contador4 <- contador4 + 1
			asiento[3,i] <- contador4
		FinSi
		
		
		Mostrar "Ingrese nombre y apellido: "
		leer nombreApellido[i]
		Mostrar "Ingrese DNI"
		leer dni[i]
		Mostrar "Ingrese su telefono: "
		leer telefono[i]
		Mostrar "Ingrese su numero de cliente: "
		leer idCliente[i]
		Mostrar "¿Su equipaje va en la bodega? 1-SI 2-NO: "
		leer opcionEquipaje
		Mientras opcionEquipaje < 1 o opcionEquipaje > 2 Hacer
			Mostrar "Opcion invalida. Ingrese nuevamente 1-SI 2-NO: "
			Leer opcionEquipaje
		FinMientras
		Segun opcionEquipaje
			caso 1:
				equipajeBodega[i] <- 1
			caso 2:
				equipajeBodega[i] <- 0
		FinSegun
	FinSi
	
	Si rutaElegida[i] == 0
		ruta <- "Buenos Aires - Bariloche"
	FinSi
	Si rutaElegida[i] == 1
		ruta <- "Buenos Aires - Salta"
	FinSi
	Si rutaElegida[i] == 2
		ruta <- "Rosario - Buenos Aires"
	FinSi
	Si rutaElegida[i] == 3
		ruta <- "Mar del Plata - Mendoza"
	FinSi
	Si equipajeBodega[i] == 1
		equipaje <- "Si"
	FinSi
	Si equipajeBodega[i] == 0
		equipaje <- "No"
	FinSi
	
	costoTotal <- costopasaje (rutaElegida, asiento, equipajeBodega , costoTotal)
	
	
	Mostrar "Ruta : ",ruta
	Mostrar "Nombre y Apellido : ",nombreApellido[i]
	Mostrar "DNI : ",dni[i]
	Mostrar "Telefono : ",telefono[i]
	Mostrar "Id Cliente: ",idCliente[i]
	Mostrar "Equipaje en bodega ",equipaje
	Mostrar "Asiento ",asiento[i]
	Mostrar "Costo pasaje $ ",costoTotal
	
	
	i <- i + 1
FinSubProceso


SubProceso buscarPasaje (Por Referencia)
	
FinSubProceso


SubProceso buscarPasajero (Por Referencia)
	
FinSubProceso


SubProceso mostrarListaPasajeros (Por Referencia)
	
FinSubProceso


SubProceso listados (Por Referencia)
	
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
	
	Para i <- 0 Hasta tam Hacer
		nombreApellido <- ""
	FinPara
FinSubProceso

SubProceso costoTotal <- costopasaje (rutaElegida, asiento, equipajeBodega Por Valor, costoTotal Por Referencia)
	Si rutaElegida[i] == 0
		Si asiento[i] <= 20
			costoTotal <- 150000
		FinSi
		Si asiento[i] > 20 y asiento[i] <= 60
			costoTotal <- 150000 * 1.10
		FinSi
		Si asiento[i] > 60
			costoTotal <- 180000
		FinSi
		Si equipajeBodega[i] == 1
			costoTotal <- costoTotal * 1.05
		FinSi
	FinSi
	
	Si rutaElegida[i] == 1
		Si asiento[i] <= 20
			costoTotal <- 120000
		FinSi
		Si asiento[i] > 20 y asiento[i] <= 60
			costoTotal <- 120000 * 1.10
		FinSi
		Si asiento[i] > 60
			costoTotal <- 150000
		FinSi
		Si equipajeBodega[i] == 1
			costoTotal <- costoTotal * 1.05
		FinSi
	FinSi
	
	Si rutaElegida[i] == 2
		Si asiento[i] <= 10
			costoTotal <- 70000
		FinSi
		Si asiento[i] > 10 y asiento[i] <= 40
			costoTotal <- 70000 * 1.15
		FinSi
		Si asiento[i] > 40
			costoTotal <- 95000
		FinSi
		Si equipajeBodega[i] == 1
			costoTotal <- costoTotal * 1.05
		FinSi
	FinSi
	
	Si rutaElegida[i] == 3
		Si asiento[i] <= 10
			costoTotal <- 95000
		FinSi
		Si asiento[i] > 10 y asiento[i] <= 40
			costoTotal <- 95000 * 1.15
		FinSi
		Si asiento[i] > 40
			costoTotal <- 125000
		FinSi
		Si equipajeBodega[i] == 1
			costoTotal <- costoTotal * 1.05
		FinSi
	FinSi
	
FinSubProceso

