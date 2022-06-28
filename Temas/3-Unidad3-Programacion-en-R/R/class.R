
library(ggplot2)
# dataset mpg

# Muestra el conjunto de datos.
str(mpg)

head(mpg,10)

# Podemos tener datos univalora y multivariados

# Creando una grafica de barras
ggplot(mpg) + 
  geom_bar(aes(x=class), fill='blue')

# Agregar mas elemntox con + operator
ggplot(mpg) + 
  geom_bar(aes(x=class), fill='blue') +
  xlab('Tipo de auto') +
  ylab('Total')


ggplot(mpg, aes(x=displ)) +
  geom_histogram(aes(y=..density..), binwidth = 1, fill = 'blue') +
  geom_line(stat = 'density', col = 'gray50', size = 1.5) +
  ylab('Densidad') +
  xlab('Desplazamiento del motor')


