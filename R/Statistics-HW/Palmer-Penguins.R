library(palmerpenguins)

Gentoo <- penguins$species == "Gentoo"
LongPicoG <- penguins$bill_length_mm[Gentoo]

# Tras haber cargado los datos correctamente y haber extraido los datos de la
# especie que nos interesaba, como hemos visto que hay un dato NA

LongPicoG <- na.omit(LongPicoG)

#Empecemos calculando medidas de posición

mean(LongPicoG)
median(LongPicoG)

#Ahora calculemos medidas de dispersion

sd(LongPicoG)
var(LongPicoG)
max(LongPicoG)-min(LongPicoG) #Rango de todos los datos
quantile(LongPicoG,probs=c(0.25,0.75))
quantile(LongPicoG,0.75,names=F)-quantile(LongPicoG,0.25,names=F) #R.Interc

#------------------------------------------------------------------------------
# El rango es considerablemente mayor al RI, osea que hay datos muy alejados
#------------------------------------------------------------------------------

#Grafiquemos su boxplot

boxplot(LongPicoG, horizontal = T) #Observese que hay un dato atipico muy alto
B <- boxplot(LongPicoG, horizontal=T)

#Examinando el B podemos ver que el dato atipico es 59.6, veamos su asimetria

library(moments)
skewness(LongPicoG) # es ligeramente mayor a 0,5 asi que un poquito asimetrica

#finalmente grafiquemos el estimador Kernel

plot(density(LongPicoG))

#------------------------------------------------------------------------------
# Podemos observar que hay como dos componentes, una modal mas abundante, y otra
# un poquito mayor, en principio parece que hay dos poblaciones, y querriamos
# encontrar que variable provoca el clustering
#------------------------------------------------------------------------------

Macho <- penguins$sex =="male"
GentooMacho <- Gentoo & Macho
LongPicoGM <- penguins$bill_length_mm[GentooMacho]
LongPicoGM <- na.omit(LongPicoGM)

GentooHembra <- Gentoo & !Macho
LongPicoGH <- penguins$bill_length_mm[GentooHembra]
LongPicoGH <- na.omit(LongPicoGH)

plot(density(LongPicoGM),col="blue",xlim=c(35,65))
lines(density(LongPicoGH),col="red")
lines(density(LongPicoG))

#------------------------------------------------------------------------------
# Separamos la poblacion en machos y hembra y lo que vemos es que los hembras 
# provocan una de las sobpoblaciones, y otra para los machos, aunque podría ser
# que hubiera otra variable como la edad que no estemos analizando
#------------------------------------------------------------------------------

LongPicoAletaG <- penguins[Gentoo,c(3,5)]
LongPicoAletaG <- na.omit(LongPicoAletaG)
cor(LongPicoAletaG$flipper_length_mm,LongPicoAletaG$bill_length_mm)

#su correlacion no es muy alta 0.66

recta <- lm(LongPicoAletaG$bill_length_mm~LongPicoAletaG$flipper_length_mm)
recta
plot(LongPicoAletaG$flipper_length_mm,LongPicoAletaG$bill_length_mm, pch=19,
     xlab="Longitud aleta", ylab="Lobgitud pico")
abline(recta,col="red")

# Podemos observar que aunque hay algo de correlacion si que podemos observar 
# que la nube de puntos esta separada de la recta