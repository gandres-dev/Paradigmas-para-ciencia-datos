# Programa 4
# Integrantes
# Silva Velázquez Elsy Camila
# Longines Tapia Hugo Didier
# Andrés Urbano Guillermo Gerardo
library(MASS) 
library(ggplot2)

# . El objetivo del análisis es determinar la efectividad de los tratamientos
#  estimar la media de ganancia de peso, comparando el peso antes y después del
#  tratamiento (Prewt y Postwt). como evidencia de que son ganancias reales
print(anorexia)


# 1.- Grafica el peso antes y después del experimento identificando los puntos de cada grupo
# con diferentes formas y colores (como se añadirán más elementos a la gráfica, se sugiere
#                                 usar ggplot)
plt <- ggplot(anorexia, aes(x=Prewt, y=Postwt)) 
plt <- plt + geom_point(aes(shape=Treat, color=Treat), size=2)
plt

# 2.- • Agrega líneas de regresión por mínimos cuadrados usando los mismos colores para
# identificarlos (ggplot regala los intervalos de confianza)
plt <- ggplot(anorexia, aes(x=Prewt, y=Postwt)) 
plt <- plt + geom_smooth(aes(colour=Treat), method='lm')
plt <- plt + geom_point(aes(shape=Treat, color=Treat), size=2)
plt

# 3.- Agrega una línea con pendiente 1 y ordenada al origen 0
plt <- ggplot(anorexia, aes(x=Prewt, y=Postwt))
plt <- plt + geom_smooth(aes(colour=Treat), method='lm')
plt <- plt + geom_point(aes(shape=Treat, color=Treat), size=2)
plt + geom_abline(intercept = 0, slope=1) 

# 4.- ¿Se puede concluir algo sobre la eficacia de los tratamientos?

# Concluir
# Los puntos que estan bajo la identidad nos dicen que no hubo un progreso, ya que el peso
# antes del terapia era mayor que el actual. Los puntos arriba de la identidad indican que si
# progreso.
# Siguiendo la idea anterior, mientras la pendiente de la regresion lineal este más cerca de 
# la pendiente de la identidad es un indicador de mejora para los pacientes. 
# EL grupo de control sin terapia (Count) mostro que la tendencia del grupo empeoro por como
# se ve su pendiente(negativa), mientras que la terapia familiar(FT) y 
# terapia cognitiva conductual(CBT) mejoro considerablemente.

# 5.- Otra forma de ver los datos es dividir la gráfica de acuerdo al tipo de tratamiento; se
# puede realizar con facet_grid:
plt <- ggplot(anorexia, aes(x=Prewt, y=Postwt)) + facet_grid (.~ Treat )
plt <- plt + geom_smooth(aes(colour=Treat), method='lm')
plt <- plt + geom_point(aes(shape=Treat, color=Treat), size=2)
plt


# 6.- Muestra el resumen de cada modelo de regresión, ¿Para qué grupos existe evidencia
# de una relación entre los pesos? Explica la diferencia entre el grupo de control y los
# grupos con terapias; genera una conclusión al respecto.

# Resumen:
plt <- ggplot(anorexia, aes(x=Prewt, y=Postwt)) + facet_grid (.~ Treat )
plt <- plt + geom_smooth(aes(colour=Treat), method='lm')
plt <- plt + geom_point(aes(shape=Treat, color=Treat), size=2)
plt + geom_abline(intercept = 0, slope=1) 

# La diferencia es que los grupos con terapia tiene pendiente positiva, por lo tanto, tienen 
# un proceso, a diferencia con el grupo de control sin terapia hubo disminución en los pesos.


