//Introducción



//----------------------------------------------------------------------------//
// COMANDOS BÁSICOS
//----------------------------------------------------------------------------//
*update all actualiza Stata
*ssc intall instalar paquetes
*cd		    cambiar el directorio
*set mem	modificar la memoria empleada
*use		abrir el documento
*insheet	importar datos de otros documentos
*edit 		puede importar los datos desde la ventana (copiar pegar)
*compress	si necesita más memoria
*clear  	limpiar la base
*log using  guarda los resultados en un archivo de texto
*help 		AYUDA
*lookup 	AYUDA
*search 	AYUDA
*findit		buscar comandos creados por usuarios
*display 	displays strings and values of scalar expressions
*exit 		cierra el programa
//----------------------------------------------------------------------------//


//----------------------------------------------------------------------------//
// DESCRIBIR VARIABLES
//----------------------------------------------------------------------------//
*describe	describir la base de datos
*list		hacer una lista de los contenidos de la base
*codebook 	una descripción detallada de los contenidos
*log		crear un log
*summarize	estadisticas descriptivas
*tabstat	tabla de estadisticas descriptivas
*graph	    graficar
*kdensity	grafica de la densidad
*sort 	    ordena los datos	
*histogram  histograma
*tabulate//tab	hace tablas de frecuencia
*correlate	correlaciones
//----------------------------------------------------------------------------//


//----------------------------------------------------------------------------//
// MODIFICAR DATOS BASE
//----------------------------------------------------------------------------//
*label data	 	darle un nombre a la base de datos
*order	 		ordenar las variables de la base de datos
*label variable	darle un nombre a una variable
*label define	
*label values	aplicar los nombres a una variables 
*rename		    renombrar una variable
*recode		    recodificar los valores de una variable
*notes			poenr notas a la base de datos
*generate		crear una variable nueva
*egen			tiene funciones especiales
*replace		reemplazar un valor 
*by				ejecutar el comando basado en valores de varlist
*if				condición al final del comando
*in 			condición al final del comando
//----------------------------------------------------------------------------//

//----------------------------------------------------------------------------//
//MANIPULAR LA BASE DE DATOS
//----------------------------------------------------------------------------//
*pwd			Muestra el directorio actual 
*dir  			(ls) Muestra los archivos del directorio actual
*cd				Cambiar de directorio
*keep if		mantenga las observaciones si ...
*keep 			mantenga las variables
*drop			borre las variables
*append using 	adjunte observaciones
*merge 			incluya variables adicionales
*sort			ordene las variables
*order
*destring		convertir string var en numero
*collapse		genera sumas, promedios etc sobre algunas observaciones
//----------------------------------------------------------------------------//

//----------------------------------------------------------------------------//
//ANALISIS DE DATOS
//----------------------------------------------------------------------------//
*ttest	      t-test
*regress	Regression
*predict	Predicts after model estimation
*kdensity	Kernel density estimates and graphs
*pnorm		Graphs a standardized normal plot
*qnorm		Graphs a quantile plot
*rvfplot	Graphs a residual versus fitted plot
*rvpplot	Graphs a residual versus individual predictor plot
*xi			Creates dummy variables during model estimation
*test		Test linear hypotheses after model estimation


//----------------------------------------------------------------------------//

// Reg en mata

//----------------------------------------------------------------------------//




//----------------------------------------------------------------------------//

// Insesgamiento

//----------------------------------------------------------------------------//




histogram B1_store, percent fcolor(none) lcolor(ebblue*.7) ytitle(Densidad) xtitle(Betas) xline(0.8, lwidth(thick) lpattern(dash) lcolor(orange*1)) title(Distribución Muestral 1000 Repeticiones)



//----------------------------------------------------------------------------//

// Consistencia

//----------------------------------------------------------------------------//






twoway (scatter B1_store N)


//----------------------------------------------------------------------------//

// Outreg

//----------------------------------------------------------------------------//


reg y x1 x2
outreg2 using ejemplo.doc, replace ctitle(Regresión 1)

reg y x1 x2 x3
outreg2 using ejemplo.doc, append ctitle(Regresión 1)




