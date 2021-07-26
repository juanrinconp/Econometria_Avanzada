*Normalidad Asintotica
clear
capture program drop  MCO
program define MCO, rclass
	args N 
	clear
	set obs `N' 
	capture drop y x
	gen x=runiform(0,8)
	generate y = 0.5*x+runiform(0,5) 
	qui reg y x
	return scalar betha = _b[x]
end

simulate Betha1000=r(betha), reps(1000) nodots: MCO 1000
save Betha1000.dta
simulate Betha10000=r(betha), reps(1000) nodots: MCO 10000
merge 1:1 _n using Betha1000
br
kdensity Betha1000, n(500) generate(x_1000 f_1000) kernel(gaussian) nograph
label variable f_1000 "N=1000"
kdensity Betha10000, n(500) generate(x_10000 f_10000) kernel(gaussian) nograph
label variable f_10000 "N=10000"
graph twoway (line f_1000 x_1000) (line f_10000 x_10000)

// PARA PRUEBAS DE HIPOTESIS :   //

replace Betha1000=sqrt(1000)*(Betha1000-0.5)
replace Betha10000=sqrt(10000)*(Betha10000-0.5)
drop x_1000 f_1000 x_10000 f_10000
kdensity Betha1000, n(500) generate(x_1000 f_1000) kernel(gaussian) nograph
label variable f_1000 "N=1000"
kdensity Betha10000, n(500) generate(x_10000 f_10000) kernel(gaussian) nograph
label variable f_10000 "N=10000"
graph twoway (line f_1000 x_1000) (line f_10000 x_10000)
