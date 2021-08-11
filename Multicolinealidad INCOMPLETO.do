* Multicolinealidad
clear

set obs 1000  

gen  educacion  = runiform(0,20)

gen  edad  = runiform(20,60)

gen  experiencia = edad*rnormal(1,0.3)

gen epsilon = rnormal(0,1)

gen salario = 5 + 0.5*experiencia + 0.9*x2 + 2*x3 +  epsilon

reg y x1 x2 x3

