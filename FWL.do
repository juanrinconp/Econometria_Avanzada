ssc install outreg2

clear
set seed 21008
set obs 100
gen x1 = rnormal()
* Correlacion + entre los regresores
gen x2 = rnormal() + .2*x1

* Proceso generador de datos
gen y = 4 + x1 + 5*x2 + rnormal()

* Paso 1: Residuos de la reg x1 x2
reg x1 x2
predict resid_x1, res

* Paso 2: Residuos de la reg y x2
reg y x2
predict resid_y, res

*FWL
reg resid_y resid_x1

outreg2 using myreg.doc, replace ctitle(Modelo FWL)

* Reg correcta
reg y x1 x2

outreg2 using myreg.doc, append ctitle(Modelo Correcto)
