datos <- read.table("DATASETS/data_banknote_authentication.txt")
Ind0 <- datos$V5 == 0
datos0 <- datos[Ind0,1:4]
datos1 <- datos[!Ind0,1:4]

#Podriamos hacer un summary de cada columna pero mejor apliquemos 
#lo siguiente

by(datos[,1:4],datos$V5,summary)
by(datos[,1:4],datos$V5,var)

#Ahora hacemos el boxplot
boxplot(datos0[,1],datos1[,1],names=c("0","1"))

#Vamos a utilizar el ggpairs de la libreria GGally asi que la activamos
#y ahora transformamos la columna 5 en un factor, o dato cualitativo

library(GGally)
datos$V5 <- as.factor(datos$V5)
ggpairs(datos, aes(colour=datos$V5))
