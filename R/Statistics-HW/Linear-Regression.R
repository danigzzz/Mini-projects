n <- 50
x <- rnorm(n)
y <- exp(x) + rnorm(n,sd=0.5)
plot(x,y,type="p")

library(moments)
cor(x,y)/(sd(x)*sd(y))

#-----------------------------------------------------------------------------
#a) Existe una relacion entre las variables que no es muy lineal, parece mas
# exponencia ya que exhibe algo de curvatura y tiene un coef de pearson de 0,32
# pero no podemos aplicar una transformacion logaritmica ya que hay datos 
# negativos
#------------------------------------------------------------------------------
#b) Parece ser linealizable pero tenemos que aplicarle una transformacion antes 
# del logaritmo para que podamos quitarnos los numeros negativos, apliquemos la
# transformacion afin y= ln(y+min(y))
#------------------------------------------------------------------------------

k <- ifelse(min(y) <= 0, abs(min(y))+0.001, 0)
y_trans <- log(y+k)
modelo_lin <- lm(y_trans ~ x)

plot(x, y_trans, 
     pch = 19, 
     col = adjustcolor("steelblue", alpha.f = 0.6),
     xlab = "Variable Independiente (x)", 
     ylab = "Variable Dependiente (y)",
     main = "Ajuste Exponencial mediante Linealización Logarítmica")
grid(lwd = 1.5)

boxplot(y) 
y_ord <-sort(y)
y_ord[46:50]

#-------------------------------------------------------------------------------
#c) tiene 5 valores atipicos como podemos observar en el boxplot que son
# los que hemos mostrado
#------------------------------------------------------------------------------
#d) bueno lo hemos calculado ya pero como es una curva creciente es obvio que 
# 0.8 o algo similar tiene que ser su coef de correlacion, se parece ademas a 
# a una recta pendiente 1 pero claro con curva exponencial
#------------------------------------------------------------------------------
