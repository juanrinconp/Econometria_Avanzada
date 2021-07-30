*Insesgamiento
clear
set obs 1000
gen B1_store=.

set obs 10000
gen poblacionx=runiform(0,5)
gen epsilon=rnormal(0,1)
gen poblaciony=0.8*poblacionx+epsilon

qui forvalues i =1/1000{
gen random= runiform()
sort random
mata: ym = st_data((1,1000), "poblaciony")
mata: xm = st_data((1,1000), "poblacionx")
mata betaest = invsym(xm'xm)*xm'ym
mata: betaest
mata: st_numscalar("beta_1" , betaest)
local coef1= beta_1
replace B1_store= `coef1'  in `i'
drop random
}


summ 	B1_store

histogram B1_store, percent fcolor(none) lcolor(ebblue*.7) ytitle(Densidad) xtitle(Betas) xline(0.8, lwidth(thick) lpattern(dash) lcolor(orange*1)) title(Distribución Muestral 1000 Repeticiones)

*Consistencia

clear
set obs 10000
gen N=.
gen B1_store=.
gen poblacionx=runiform(0,5)
gen epsilon=rnormal(0,1)
gen poblaciony=0.8*poblacionx+epsilon

qui forvalues i = 5 10 to 10000{

set obs 10000
gen random= runiform()
sort random
mata: ym = st_data((1,`i'), "poblaciony")
mata: xm = st_data((1,`i'), "poblacionx")
mata: betaest = invsym(xm'xm)*xm'ym
mata: betaest
mata st_numscalar("beta_1" , betaest)
local coef1= beta_1
replace B1_store= `coef1'  in `i'
replace N=`i' in `i'
drop random
}

twoway 	 (scatter B1_store N)

