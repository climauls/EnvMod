#***********************************************************
#
#  Modelamiento Ambiental con aplicaciones en R
#
#  Profesor Jorge E. Pachon
#
#***********************************************************
#
# Modelación de calidad del agua en lagos
#
# Ejemplo 1
#
# Volumen del lago (m3)
V=50000
#Profundidad (m)
h=2
#carga de desechos (g/d)
W=140000
#caudal (m3/d)
Q=7500
#constante degradación (d-1)
k=0.319
#velocidad sedimentacion (m/d)
vs = 0.1
#area de sedimentacion (m2)
As = V/h
#cálculo del factor lambda (y)
y =(Q + k*V + vs*As); y

#Concentracion en estado estable (mg/L)
Css = W/y; Css

#Concentración en estado dinámico (mg/L)
t=seq(0,25,1)
C = W/(y*V)*(1-exp(-y*t)); C
plot(t,C, type="l", main="Concentracion vs tiempo lago bien mezclado", xlab="t(d)", ylab="C(mg/L)")

#***********************************************************************

# Ejemplo 2
#
# Area superficial (m2)
As=11E6
# Profundidad (m)
h=5
#Volumen del lago (m3)
V=As*h
# Tiempo de residencia (yr)
tr=4.6
#Caudal (m3/yr)
Q=V/tr
#carga de desechos (g/yr)
W=2000E6
#constante degradación (yr-1)
k=0.1
#concentración de entrada (mg/L)
Cin=15

#Concentracion en el estado estable (mg/L)
m=W+Q*Cin
y= (Q+k*V)
Css = m / y; Css

#Si la descarga de la industria se hace cero W=0
W=0
Css = (W + Q*Cin) / (Q + k*V); Css

#Si la descarga de la industria se hace cero W=0
m=Q/V*Cin
y=(Q/V+k)

#Concentración en estado dinámico (mg/L)
Co=Css
t=seq(0,20,1)
#si la concentración inicial es cero (0)
C = m/y*(1-exp(-y/V*t))
plot(t,C, type="l", main="Concentracion vs tiempo lago bien mezclado", xlab="t(yr)", ylab="C(mg/L)")

#si la concentración inicial es diferente de cero (0)
#Co
#C = m/y*(1-exp(-y/V*t))+Co*exp(-y/V*t)


