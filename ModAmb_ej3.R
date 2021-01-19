#***********************************************************
#
#  Modelamiento Ambiental con aplicaciones en R
#
#  Profesor Jorge E. Pachon
#
#***********************************************************
#
#
# Solucion analitica
# Concentracion incial (Co)
Co=100
# Constante de degradacion k (d-1)
k=0.5
t <- seq(0,10,by=0.1)
C=Co*exp(-k*t)
plot(t,C, xlab= "t (d)", ylab= "C (mg/l)")

# Metodo numerico solucion sistema degradacion primer orden
# intervalo de tiempo (d)
dt=0.1
Cr=100
for (i in 1:100)
{Cr[i+1]=Cr[i]*(1-k*dt)}
Cr
lines(t,Cr, type="l", col="red")

legend("topright", legend=c("Analitico", "Numerico"), col=c("black", "red"), lty=1:1, cex=1.0, title="Convenciones", text.font=4, bg="snow2")

