*V. Omitidas
clear
set obs 10000
gen x1=rnormal(1,10)
gen x2= 0.1*x1 + runiform(1,3)
gen epsilon =rnormal()
gen y= 0.3*x1 + 1.2*x2 + epsilon

reg y x1 x2
outreg2 using reg1.doc, replace ctitle(Reg 1)


reg y x1
outreg2 using reg1.doc, append ctitle(Reg 2)


corr(y x1 x2)

