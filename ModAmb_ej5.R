#***********************************************************
#
#  Modelamiento Ambiental con aplicaciones en R
#
#  Profesor Jorge E. Pachon
#
#***********************************************************
#
# Modelación de calidad del agua en ríos y corrientes
#
#Ejemplo2

#concentración DBO (mg/l)
DBO3=75
#constante degradacion (d-1)
k=0.345
#tiempo (d)
t=3
Lo=DBO3/(1-exp(-k*t)); Lo

t=seq(0,20,1)
ult=rep(Lo,21)
L=Lo*exp(-k*t)
DBO=Lo*(1-exp(-k*t))
par(mar=c(5, 5, 3, 5))
plot(t,L, type="l", col="black", main="perfil DBO", xlab="day", ylab="L(mg/l)")
#incluir eje secundario en y
par(new=TRUE)
plot(t,DBO, type="l", xaxt = "n", yaxt = "n", xlab="", ylab="", col="red", lty=2) 
axis(side = 4)
mtext("DBO(mg/l)", side = 4, line = 3)
legend("topleft", c("L", "DBO"),
       col = c("black", "red"), lty = c(1, 2))

lines(t,ult, lty=2)

#***************************************************************


#Ejemplo 4

##################################################################
#Wastewater mixes with a river resulting in:
#BOD = 10.9 mg/L
#DO = 7.6 mg/L
#Temperature = 20 °C
#Deoxygenation constant = 0.2 day-1
#Average flow = 0.3 m/s
#Average depth = 3.0 m
#What is the distance downstream of the maximum oxygen deficit?
#What is the minimum value of DO?
#Construct the deficit and OD profile in function of time
##################################################################

H=3.0
U=0.3

# concentracion inicial DBO (mg/L)
Lo=10.9
# inicial OD (mg/L)
OD=7.6
# concentracion de saturacion de OD  (mg/L)
Cs=9.07
# deficit inicial Do (mg/L)
Do=Cs-OD
# constante de degradacion k1 (d-1)
k1=0.2
# constante de reaireacion k2 (d-1) segun ecuacion Oconnos-Davis
k2=5.32*U^0.67/H^1.85
k2

# tiempo crítico (d)
tc = 1/(k2-k1)*log(k2/k1*(1-Do*(k2-k1)/(k1*Lo))); tc
#distancia al punto crítico
x=U*86400/1000*tc; x

# deficit maximo (mg/L)
Dmax=Do*exp(-k2*tc)+k1*Lo/(k2-k1)*(exp(-(k1*tc))-exp(-(k2*tc))); Dmax
t <- seq(0,20,1)
D=Do*exp(-k2*t)+k1*Lo/(k2-k1)*(exp(-(k1*t))-exp(-(k2*t))); D
plot(t,D, type="l", xlab="t(d)", ylab="D(mg/l)")
OD=Cs-D
#incluir eje secundario en y
par(new=TRUE)
plot(t, OD, type="l", xaxt = "n", yaxt = "n", xlab="", ylab="", col="red", lty=2) 
axis(side = 4)
mtext("DBO(mg/l)", side = 4, line = 3)
legend("topleft", c("Deficit", "OD"),
       col = c("black", "red"), lty = c(1, 4))







