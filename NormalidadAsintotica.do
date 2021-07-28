*Normalidad Asintotica
clear
capture program drop  MCO
program define MCO, rclass
args N
clear
set obs `N'
capture drop y x
gen x=runiform(0,8)
gen y = 0.5*x+runiform(0,5)
qui reg y x
return scalar beta = _b[x]
end
			

simulate Beta1000=r(beta), reps(1000) nodots: MCO 1000
save Beta1000.dta
simulate  Beta10000=r(beta), reps(1000) nodots: MCO 10000
merge 1:1   _n using beta1000
kdensity Beta1000, n(500) generate(x_1000 f_1000) kernel(gaussian) nograph
label variable f_1000 "N=1000"
kdensity  Beta10000, n(500) generate(x_10000 f_10000) kernel(gaussian) nograph
label variable f_10000 "N=10000"
graph twoway (line f_1000 x_1000) (line f_10000 x_10000)
						
						
// PARA PRUEBAS DE HIPOTESIS :   //
replace  Beta1000=sqrt(1000)*(Beta1000-0.5)
replace  Beta10000=sqrt(10000)*(Beta10000-0.5)
drop x_1000 f_1000 x_10000 f_10000
kdensity Beta1000, n(500) generate(x_1000 f_1000) kernel(gaussian) nograph
label variable f_1000 "N=1000"
kdensity Beta10000, n(500) generate(x_10000 f_10000) kernel(gaussian) nograph
label variable f_10000 "N=10000"
graph twoway (line f_1000 x_1000) (line f_10000 x_10000) (function normalden(x, sqrt(0.5)),range(-2 2)) , legend(label(3 "Distribución Normal ")  cols(3))


************************


clear all
set seed 10344
postfile sim m1000 using sim1000, replace

forvalues i = 1/1000 {
qui capture drop y
qui set obs 1000
qui gen y = rchi2(1)

}

postclose sim


clear all
postfile sim m100000 using sim100000, replace

forvalues i = 1/1000 {
qui capture drop y
qui set obs 100000
qui gen y = rchi2(1)

}

postclose sim

clear
use sim100000
merge 1:1 _n using sim1000
kdensity m1000, n(500) gen(x_1000  f_1000) kernel(gaussian) nograph
label variable  f_1000 "N =  1000"
kdensity m100000, n(500) gen(x_100000  f_100000) kernel(gaussian) nograph
label variable  f_1000 "N =  100000"
graph twoway (line f_1000 x_1000)(line f_100000 x_100000)

