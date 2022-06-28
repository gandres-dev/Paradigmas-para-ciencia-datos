library(ggplot2)
library(scales)
library(RColorBrewer)


ggplot(mpg, aes(x=reorder(manufacturer, cty, FUN=mean), y=cty)) +
  geom_jitter(colour='lightblue', alpha=0.5, width=0.1) +
  geom_point(stat = 'summary', fun='mean') + 
  geom_errorbar(stat='summary', fun.data='mean_se', 
                fun.args=list(mult=1.96), width=0) +
  labs(x='Fabricante', y = 'Rendimiento') +
  theme_bw() + 
  theme(axis.text.x = element_text(angle=45, hjust=1))



library(ggplot2)
ggplot(mpg, aes(x=reorder(drv, cty, FUN=mean), y=cty)) +
  geom_violin(colour='lightblue', alpha=0.5, width=0.1) +
  geom_point(stat = 'summary', fun='mean') + 
  geom_errorbar(stat='summary', fun.data='mean_se', 
                fun.args=list(mult=1.96), width=0) +
  labs(x='Fabricante', y = 'Rendimiento') +
  theme_bw() + 
  theme(axis.text.x = element_text(angle=45, hjust=1))


#----------------------------------------
# Otra grafica en la que vamos obtener las medianas contra
# todos los puntos
set.seed(3939394)

# La comma para indicar que queremos por filas en vez col
data <- mpg[sample.int(nrow(mpg), size=200, replace=F),]

# Ordenado por el rendimiento
data$manufacturer <- reorder(data$manufacturer, data$displ)
data$manufacturer

medianas <- aggregate(data$displ,
                      list(data$manufacturer),
                      FUN=median)

names(medianas) <- c('manufacturer', 'displ')
medianas$y_val <- as.numeric(medianas$manufacturer)
ggplot(data, aes(x=displ,y=manufacturer)) +
  geom_point(position = position_jitter(h=0.4), alpha=0.4) +
  labs(x='Rendimiento', y='Fabricante')  + 
  geom_segment(data=medianas,
               aes(x=displ, xend=displ,
                   y=y_val - 0.4, yend=y_val + 0.4),
               col='red')

#------------------------------
# Datos on multiples variables
# Otra grafica en la que vamos obtener las medianas contra
# todos los puntos
set.seed(3939394)

# La comma para indicar que queremos por filas en vez col
data <- mpg[sample.int(nrow(mpg), size=200, replace=F),]

# Ordenado por el rendimiento
data$manufacturer <- reorder(data$manufacturer, data$displ)
data$manufacturer

medianas <- aggregate(data$displ,
                      list(drv=data$drv,
                           data$manufacturer),
                      FUN=median)

names(medianas) <- c('drv', 'manufacturer', 'displ')
medianas$y_val <- as.numeric(medianas$manufacturer)

jit_val = 0.6

ggplot(data, aes(x=displ,y=manufacturer, group=drv, col=drv)) +
  geom_point(position = position_jitter(h=jit_val), alpha=0.4) +
  labs(x='Rendimiento', y='Fabricante')  + 
  geom_segment(data=medianas,
               aes(x=displ, xend=displ, group=drv, col=drv,
                   y=y_val - jit_val, yend=y_val + jit_val))


#-------------------------------
library(ggplot2)
ggplot(mpg) + 
  geom_bar(aes(x=class, fill=drv)) +
  xlab('Tipo de auto') +
  ylab('Total')


#-------------------------------
# Convertimos en factor, para agruparlo en categoria
library(ggplot2)
ggplot(mpg) + 
  geom_bar(aes(x=class, fill=factor(cyl))) +
  xlab('Tipo de auto') +
  ylab('Total')


#-------------------------------
# Para separar cada barra, en vez de estar apilado
library(ggplot2)
ggplot(mpg) + 
  geom_bar(aes(x=class, fill=factor(cyl)),
           position = position_dodge(preserve = 'single')) +
  xlab('Tipo de auto') +
  ylab('Total')

#-------------------------------------------
library(ggplot2)
# Conjunto de datps mtcars

sp <- ggplot(mtcars, aes(x=wt, y=mpg, label=rownames(mtcars))) +
  geom_point()

sp + geom_text()



sp2 <- ggplot(mtcars, aes(x=wt, y=mpg, label=rownames(mtcars))) +
  geom_point()

sp2 + geom_label()



sp3 <- ggplot(mtcars, aes(x=wt, y=mpg, label=rownames(mtcars))) +
  geom_point()

sp3 + geom_label(aes(color=factor(cyl)))


# Paquete para visualizar mejor las etiquetas
library(ggrepel)
# Definimos una semilla
set.seed(12345)
#SUbsample
ss <- sample(1:32, 15)
# Tomas las filas
df <- mtcars[ss,]

p <- ggplot(df, aes(wt, mpg)) +
  geom_point(color='red')

#p

p + geom_text_repel(aes(label=rownames(df)), size=3.5)


p + geom_text_repel(aes(label=rownames(df),color=factor(cyl)), 
                    size=3.5)


#--------------------------------------
p2 <- ggplot(df, aes(wt, mpg)) +
  geom_point(color='red')

p2 + geom_label_repel(aes(label=rownames(df),fill=factor(cyl)),color= 'white',
                    size=3.5) +
  theme(legend.position = "botom")
