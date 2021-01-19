#***********************************************************
#
#  Modelamiento Ambiental con aplicaciones en R
#
#  Profesor Jorge E. Pachon
#
#***********************************************************
#
#Este archivo tiene informacion de variables meteorologicas de la ciudad de Bogota
#provenientes de la estacion Simon Bolivar de la Red de Monitoreo de Calidad del Aire
#RMCAB (http://201.245.192.252:81/home/map)
#
#
#creacion de una variable donde se almacena la informacion
bogotaset <- read.csv("IDRD2012.csv"); bogotaset
#Nombre de columnas
colnames(bogotaset)
#Numero de columnas
length(bogotaset)
#numero de observaiones
nrow(bogotaset)

#creacion de variable con datos de precipitacion
lluvia=bogotaset[,"Lluvia"]
fechas=bogotaset[,"date"]
viento_dir=bogotaset[,"dirviento"]
viento_vel=bogotaset[,"velviento"]
hum=bogotaset[,"Humedad"]
temp=bogotaset[,"Temperatura"]

#calculo de promedios aritmeticos
mean(lluvia, na.rm=TRUE)
mean(viento_dir, na.rm=TRUE)
mean(viento_vel, na.rm=TRUE)
mean(temp, na.rm=TRUE)
mean(hum, na.rm=TRUE)

#calculo del rango 
min(lluvia, na.rm=TRUE)
max(lluvia, na.rm=TRUE)
#repetir para las demas variables

#calculo desviacion estandar
sd(lluvia, na.rm=TRUE)
sd(viento_dir, na.rm=TRUE)
sd(viento_vel, na.rm=TRUE)
sd(temp, na.rm=TRUE)
sd(hum, na.rm=TRUE)


#separacion de variables por meses
ene=bogotaset[1:744,]
feb=bogotaset[745:1440,]
mar=bogotaset[1441:2184,]
abr=bogotaset[2185:2904,]
may=bogotaset[2905:3648,]
jun=bogotaset[3649:4368,]
jul=bogotaset[4369:5112,]
ago=bogotaset[5113:5856,]
sep=bogotaset[5857:6576,]
oct=bogotaset[6577:7320,]
nov=bogotaset[7321:8040,]
dic=bogotaset[8041:8784,]


ene_prec=mean(ene[,"Lluvia"],na.rm=TRUE)
feb_prec=mean(feb[,"Lluvia"],na.rm=TRUE)
mar_prec=mean(mar[,"Lluvia"],na.rm=TRUE)
abr_prec=mean(abr[,"Lluvia"],na.rm=TRUE)
may_prec=mean(may[,"Lluvia"],na.rm=TRUE)
jun_prec=mean(jun[,"Lluvia"],na.rm=TRUE)
jul_prec=mean(jul[,"Lluvia"],na.rm=TRUE)
ago_prec=mean(ago[,"Lluvia"],na.rm=TRUE)
sep_prec=mean(sep[,"Lluvia"],na.rm=TRUE)
oct_prec=mean(oct[,"Lluvia"],na.rm=TRUE)
nov_prec=mean(nov[,"Lluvia"],na.rm=TRUE)
dic_prec=mean(dic[,"Lluvia"],na.rm=TRUE)

prec2012=c(ene_prec,feb_prec,mar_prec,abr_prec,may_prec,jun_prec,jul_prec,ago_prec,sep_prec,oct_prec,nov_prec,dic_prec)
mes2012=c("ene","feb","mar","abr","may","jun","jul","ago","sep","oct","nov","dic")

#grafico de barras
barplot(prec2012, main="Precipitacion Bogota", ylab="prec(mm)", names.arg=mes2012)
#barplot(prec2012, main="Precipitacion Bogota", xlab="mes", ylab="prec(mm)", horiz=TRUE, names.arg=mes2012)













