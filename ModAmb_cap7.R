#***********************************************************
#
#  Modelamiento Ambiental con aplicaciones en R
#
#  Profesor Jorge E. Pachon
#
#***********************************************************
#
# Dispersión de contaminantes en la atmósfera
#
# Ejemplos 3,4,5
# Tasa de emision SO2 (g/s)
Q=160
# altura efectiva de la chimenea (m)
H = 120
# velocidad del viento (m/s)
u=2.5
# distancia viento abajo de la chimenea (km)
x=0.8
# Estabilidad atmosférica
#Tipo B
# determinación de coeficientes (x<1km)
a=156
b=0.894
c=106.6
d=1.149
f=3.3
#coeficiente dispersión horizontal (sy) (m)
sy=a*x^b; sy
#coeficiente dispersión horizontal (sz) (m)
sz=c*x^d+f; sz
#aplicación de la ecuación gaussiana
#linea de máximos centrales
y=0
#concentracion (ug/m3)
C=Q/pi/u/sy/sz*exp(-0.5*(y/sy)^2)*exp(-0.5*(H/sz)^2)*1E6; C
#concentración en el suelo en un punto ubicado a 50m de la línea de máximos impactos
y=50
Cy=Q/pi/u/sy/sz*exp(-0.5*(y/sy)^2)*exp(-0.5*(H/sz)^2)*1E6; Cy

#construcción grafica C vs x
#creación de un vector "x" teniendo en cuenta la variación de coeficientes
#para x<1km
xl=seq(0.1,1,0.1)
syl=a*xl^b
szl=c*xl^d+f
#para x>1km
xh=seq(1,5,0.1)
c=108.2
d=1.098
f=2.0
syh=a*xh^b
szh=c*xh^d+f
x=c(xl,xh)
sy=c(syl,syh)
sz=c(szl,szh)
y=0
#concentracion (ug/m3)
C=Q/pi/u/sy/sz*exp(-0.5*(y/sy)^2)*exp(-0.5*(H/sz)^2)*1E6; C

plot(x,C, type="l", xlab="x(km)", ylab="C(ug/m3)")

***************************************************************************************************

#Ejemplo 7
# Tasa de emision SO2 (g/s)
Q=1656.2
# velocidad del viento (m/s)
u=4.5
# distancia viento abajo de la chimenea (km)
x=3
# Estabilidad atmosférica Tipo D
#altura física de la chiminea (m)
h=120
#diámetro de la chimenea (m)
d=1.2
#velocidad de salida de gases (m/s)
vs=10
#temperatura de salida de gases (K)
Ts=315
#presión ambiental (kPa)
Pa=95
#temperatura ambiental (K)
Ta=298

#elevación de la pluma DH (m)
DH=vs*d/u*(1.5+(2.68E-2*Pa*(Ts-Ta)/Ts*d)); DH
#altura efectiva de la chimenea (m)
H=h+DH; H

# Estabilidad atmosférica
#Tipo D
# determinación de coeficientes (x<1km)
a=68
b=0.894
c=44.5
d=0.516
f=-13.0
#coeficiente dispersión horizontal (sy) (m)
sy=a*x^b; sy
#coeficiente dispersión horizontal (sz) (m)
sz=c*x^d+f; sz
#aplicación de la ecuación gaussiana
#linea de máximos centrales
y=0
#concentracion (ug/m3)
C=Q/pi/u/sy/sz*exp(-0.5*(y/sy)^2)*exp(-0.5*(H/sz)^2)*1E6; C

















