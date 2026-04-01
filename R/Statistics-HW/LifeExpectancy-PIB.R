library(gapminder)
head(gapminder)
dim(gapminder)

EuropeTrue <- gapminder$continent == "Europe"
True2007 <- gapminder$year == "2007"

#Ahora tras tener nuestras listas logicas veamos

EspVidaEuropa <- gapminder$lifeExp[EuropeTrue]
EspVidaEuropa2007 <- gapminder$lifeExp[EuropeTrue&True2007]

#Ahora grafiquemos el histograma

hist(EspVidaEuropa2007,freq=F,xlab=" Esperanza de Vida")

#------------------------------------------------------------------------------
# Observamos en el histograma dos conglomerados, uno entre 74-76 y 78-80
#-----------------------------------------------------------------------------

#Ahora hagamos un boxplot por continente para el año 1982

True1952 <- gapminder$year == "1952"
boxplot(gapminder$lifeExp[True1952] ~ gapminder$continent[True1952],
        xlab="Continente", ylab="Esperanza de vida")
table(gapminder$continent[True1952])#Hay solo dos paises de oceania 

#------------------------------------------------------------------------------
# Observamos que el primer cuartil de Europa esta por encima del tercer cuartil
# de Asia Africa y America, por comparacion Africa su primer cuartil es el que 
# esta por debajo del primer cuartil de America, la mediana de Asia y Q1 de Eur
# entonces africa es la que menos esperanza de vida tenia
#-------------------------------------------------------------------------------

#Ahora vamos a hacer el mapa de dispersion
GDP2007 = gapminder$gdpPercap[True2007]
EspVida2007 = gapminder$lifeExp[True2007]
plot(GDP2007,EspVida2007,xlab="Renta per capita",ylab="Esperanza de vida"
     ,main="Año 2007")

#-------------------------------------------------------------------------------
# Se observa que hay un tipo de dependencia que no es lineal pero que se asimila
# a algunas reacciones quimicas de solubilidad, ie aumenta rapidamente con la 
# renta pero posteriormente se satura y se reduce su aumento. Nos recuerda a 
# la formula de Michaelis-Mentel
#------------------------------------------------------------------------------

k=1000
x=0:50000
y= 40+40*x/(k+x)
lines(x,y,col="red")

# Para finalizar tenemos que colorear en funcion del continente y cambiar a log

continent2007 = gapminder$continent[True2007]
levels(continent2007)

plot(GDP2007, EspVida2007, pch=19, xlab="PIB per capita",ylab="Esperanza de vida",
     main="Año 2007",col=c("red","green","black","blue","pink")[unclass(continent2007)])
legend("bottomright",pch=16,col=c("red","green","black","blue","pink"),
       legend=levels(continent2007))

#Y ahora vemos su transformacion con logaritmo

plot(log(GDP2007), EspVida2007, pch=19, xlab="PIB per capita",ylab="Esperanza de vida",
     main="Año 2007",col=c("red","green","black","blue","pink")[unclass(continent2007)])
legend("bottomright",pch=16,col=c("red","green","black","blue","pink"),
       legend=levels(continent2007))

#------------------------------------------------------------------------------
# Realmente no lo linealiza correctamente entonces tendriamos que buscar otra 
# transformacion que linealice mejor nuestros datos
#------------------------------------------------------------------------------