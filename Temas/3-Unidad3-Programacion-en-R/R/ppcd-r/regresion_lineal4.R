# Instalar el paquete 
# install.packages('MASS')
library(MASS) 
library(ggplot2)

# Dataset: peso de anerexia (dentro de MASS)

plt <- ggplot(anorexia, aes(x=Prewt, y=Postwt)) +
  geom_point(aes(shape=Treat, color=Treat),
             size=3)

# Para ver nuestra grafica
plt


# Queremos ver si hay mejora despues del 
# tratanamiento

# Agregaremos mas elementos, para regresion lineal
# El color sea deacuerdo al tratamiento
plt <- plt + geom_smooth(aes(colour=Treat),
                  method='lm')

plt + geom_abline(intercept = 0, slope=1)


# Podemos sacar conclusiones viendo nuestro grafica
# Venis que si hay una mejora con el tratamiento


