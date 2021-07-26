*Econometría Basica
*Con la base econmth

*Nivel - Nivel
reg actmth hsgpa study male colgpa

*Nivel - Log

gen lhsgpa = log(hsgpa)
reg actmth lhsgpa study male colgpa

*con la base wage1

*Log - Nivel

reg lwage educ exper expersq female
*Log - Log

gen lexper = log(exper)
reg lwage educ lexper female

*V. Dummy
reg actmth hsgpa study male colgpa

*Interaccion

gen econmale = male*econhs

reg actmth econmale hsgpa study male econhs colgpa

