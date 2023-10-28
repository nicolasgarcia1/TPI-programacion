Proceso sistemaDeVentaDePasajesAéreos
	definir opcionMenu Como Entero
	definir rutasAereas como cadena
	Dimension rutasAereas[4]
	definir capacidadRutasAereas Como Entero
	Dimension capacidadRutasAereas[4]
	
	
	inicializoArreglos(rutasAereas, capacidadRutasAereas)
	
	Escribir "**********BIENVENIDO**********"
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
			ventaPasaje()
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

SubProceso ventaPasaje(Por Referencia)
	
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
	