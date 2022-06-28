# Estara dispobible para el ambiente del script
library(ggplot2)


# Otro algoritmo para el ancho de los contenedores
ggplot(mpg, aes(x=displ)) +
  geom_histogram(aes(y=..density..), binwidth = 1, fill = 'blue') +
  geom_line(stat = 'density', col = 'gray50', size = 1.5, bw = 'SJ') +
  xlab('Motor') +
  ylab('Densidad')


# Grafica de caja

library(ggplot2)

# Diagrama de caja bigote
# Identifica facilmente valores atipicos
ggplot(data = mpg, aes(class, cty)) +
  geom_boxplot(fill = 'aliceblue') +
  labs(title = 'Box plot', x = 'Tipos de auto', y = 'Rendimiento')


# Diagram violin
library(ggplot2)

ggplot(mpg, aes(class, cty)) +
  geom_violin(fill = 'aliceblue') +
  labs(title = 'Violin plot', x = 'Tipos de auto', y = 'Rendimiento')

library(tidyverse)
library(ggplot2)

mpg_summary <- mpg %>%
  group_by(class) %>%
  summarize(mean_cty=mean(cty),
            sd_cty = sd(cty),
            n_cty = n(),
            se = sd_city / sqrt(n_cty),
            x_max = mean_cty + se,
            x_min = mean_cty -se
  )



mpg_summary <- reorder(mpg_summary$class,
                       mpg_summary$mean_cty)


ggplot(mpg_summary, aes(mean_cty, y = class)) +
  geom_errorbarh(aes(mean_city, xmax = x_max, xmin = x_min, y = class),
                 height = 0, color = 'gray60') + 
  geom_point(col = 'black') +
  labs(title = 'Barras de error', x = 'rendimeinto',
       y = 'Tipos de auto')
  



