# Instalar el paquete 
# install.packages('DAAG')
library(DAAG)

# Dataset
head(ais)
help(ais)
# Se pienda que son estos dos caracteristicas
# Podemos predecir algunod datos
# bmi - Body mass index, kg
# ssf - sum of skin folds


# Se observa una dependecia lineal
plot(ais$ssf, ais$pcBfat)

# Sacamos el conjunto de mujeres
mujeres <- which(ais$sex == 'f')
points(ais$ssf[mujeres], ais$pcBfat[mujeres],
       col='blue', pch=16)

# Ahora a los hombres
points(ais$ssf[-mujeres], ais$pcBfat[-mujeres],
       col='red', pch=16)

# Se observa quea una linea diferente para
# las mujeres y para los hombres

# indice grasa depensa solo las pieles ssf
lm.obj <- lm(ais$pcBfat ~ ais$ssf)

# Vemos los beta0 y beta1
summary(lm.obj)

mujeres = as.integer(ais$sex == 'f')
# lm.obj2 - solo es el nombre de variable
# R usa $ en vez operator .
lm.obj2 <- lm(ais$pcBfat ~ ais$ssf + mujeres)
summary(lm.obj2)

# Vemos los parametros encontrados y lo ponemos
# en abline

# Linea para los hombres
abline(a=1.1307, b=0.1579, col='red')


# La suma de mujeres + intercept
# 2.984386 + 1.130660
# Linea para las mujeres 
abline(a=4.1151, b=0.1579, col='blue')

# Podemos sacar conclusiones viendo la grafica

# Vemos que podemos seperar el conjunto de datps
# dado que ve bien seperados, analizar merjos nuestro 
# datos
