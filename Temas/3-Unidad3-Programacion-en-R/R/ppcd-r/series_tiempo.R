library(ggplot2)
library(tidyr)
library(dplyr)

theme_set(theme_minimal())
# Datos de economia
head(economics)

# Obtener ayuda
#help('economics')

ggplot(economics, aes(x=date,y=pop)) +
  geom_line(color='#00AFBB', size=2)

ss <- subset(economics, date > as.Date('2006-1-1'))

ggplot(ss, aes(x=date,y=pop)) +
  geom_line(color='#FC4E07', size=2)

# Proporción desempleo / población
ggplot(economics, aes(x=date, y=pop)) +
  geom_line(aes(size=unemploy/pop),
            color='#FC4E07')

# Curva de correlación
# Esta grafica no nos sirve para series
# de tiempo, necesitamos que suba y baje
acf(economics$pop, 50)

acf(economics$uempmed, 50)

acf(economics$psavert, 50)

# %>% : esa sintaxis solo funciona si
# esta intalado library(tidyr)

df <- economics %>%
  select(date, psavert, uempmed) %>%
  gather(key='variable', value='value',
         -date)

# head(df)

ggplot(df, aes(x=date, y=value)) +
  geom_line(aes(color=variable), size=1) +
  scale_color_manual(values = c('#00AFBB', '#E7B800')) +
  theme_minimal()


ggplot(df, aes(x=date, y=value)) +
  geom_area(aes(color=variable, fill=variable),
            alpha=0.5, position = position_dodge(0.8)) +
  scale_color_manual(values = c('#00AFBB', '#E7B800')) +
  theme_minimal()


p <- ggplot(economics, aes(x=date, y=psavert)) +
  geom_line(color='#00AFBB', size=1)

# visualizamos la grafica
p

min <- as.Date('2002-1-1')
max <- NA
p + scale_x_date(limits=c(min, max))
p + stat_smooth(color='#FC4E07',
                fill='#FC4E07',
                method='loess')
library(TTR)
psr <- SMA(economics$psavert, n=8)
p + geom_line(aes(x=date, y=psr))
