library(ks)
data(worldbank)

#NA = Not Available = Dato faltante

head(data)
class(worldbank)

#Podemos observar un poco de Dataset, queremos entonces la 2da columna
#y la tercera

CO2PIB <- worldbank[,c("CO2","GDP.capita")]

#Ahora vamos a eliminar los datos na
CO2PIB <- na.omit(CO2PIB)

#Usaremos ahora apply para aplicar una funcion 
#a una dimension de una matriz

apply(CO2PIB,2,summary)

#-------------------------------------------------------------------------------
# Viendo que la mediana es significativamente menor que la media en ambos casos
# podemos intuirnos que va a ser una distribucion asimetrica
#-------------------------------------------------------------------------------

#Ahora cargamos la library moments para ver su coeficiente de asimetria

library(moments)
apply(CO2PIB,2,skewness) 

#------------------------------------------------------------------------------
# Vemos que el coeficiente de asimetria, es mucho mas que 1, ahora vamos a ver
# el histograma para termianar de cercionarnos, entonces son asimetricos hacia
# la derecha
#------------------------------------------------------------------------------

hist(CO2PIB$CO2,freq=1)
hist(CO2PIB$GDP.capita,freq=1)

#------------------------------------------------------------------------------
# Se observa en los histogramas un alto grado de asimetria hacia la derecha
# Y en el caso del PIB podemos ver una bimodalidad
#------------------------------------------------------------------------------
