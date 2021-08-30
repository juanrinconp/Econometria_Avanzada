

//***************************************************************
// PROBLEMAS DE ENDOGENEIDAD
//***************************************************************
// Los problemas de endogeneidad dentro de los modelo econometricos son las situaciones más comunes que tratamos de evitar justamente porque causan efectos indeseados como sesgamiento de las estimaciones y/o inconsistencias. Dentro de los problemas de endogenedidad tenemos:

///* Problema de Variables omitidas relevantes:
clear
set obs 1000

gen Xs=rnormal()
gen Xr=runiform()*Xs + rnormal() 
reg Xr Xs
gen Br_Store=.
gen Y=0.5*Xs+2*Xr+rnormal()
reg Y Xs 

drop Y
qui forvalues i =1/1000{
gen Y=0.5*Xs+2*Xr+rnormal()
reg Y Xs
local coef1=_b[Xs]
replace Br_Store=`coef1' in `i'
drop Y
}
summ Br_Store

histogram Br_Store, percent fcolor(none) lcolor(ebblue*.7) ytitle(Densidad) xtitle(Betas) xline(2, lwidth(thick) lpattern(dash) lcolor(orange*1)) title(Distribución Muestral 1000 Repeticiones)

///* Problema de Variables irrelevantes

clear
set obs 1000
gen Xr=runiform()
gen Xa=runiform()*8
gen Ba_StoreC=.
gen Ba_StoreS=.

qui forvalues i =1/1000{
gen Y2=0.8*Xa+rnormal()
reg Y2 Xa Xr
local coef1=_b[Xa]
replace Ba_StoreC=`coef1' in `i'
reg Y2 Xa 
local coef2=_b[Xa]
replace Ba_StoreS=`coef2' in `i'
drop Y2
}

summ // NO HAY SESGO

// PROBLEMA DE SIMULTANEIDAD:
clear
set obs 1000
gen x=rnormal()
gen y=-0.5*x+runiform(0,1)
replace x=0.8*y+rnormal()
reg y x // Y depede de X y X depende de Y, esperariamos que el resultado fuera -0.5 pero el betha esta recogiendo este problema

// PROBLEMA DE MEDICIÓN EN X
clear
set obs 1000
gen x=runiform()
gen error1=rnormal()
gen xobs=x+error1
gen y=0.8*x+rnormal()
reg y x
reg y xobs // Es como sumar un parametro distinto a cada observación de X

// PROBLEMA DE MEDICIÓN EN Y
clear
set obs 10000
gen x=runiform()
gen y=0.8*x+rnormal()
gen error1=rnormal()
gen yobs=y+error1
reg y x
reg yobs x
// El sesgo en menor en comparación a si existiera en X



