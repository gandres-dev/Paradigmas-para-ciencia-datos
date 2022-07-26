# MEDIA MOVIL Y EXPONENCIAL

# Media movil 

# Para calcular la media movil vamos a generar primero un vector vacio, 
# al cual lo vamos a ir llenando a partir de secciones de la serie que le ingresemos
# y las cuales vamos a tomar  apartir del valor n que requerirá mediante un ciclo for.

MM <- function(serie, n){
    Movil <- c()
    Movil[1:(n-1)] <- NA
    
    for (i in n:length(serie)){
      Movil[i] <- mean(serie[(i-n+1):i])
    }
    return(Movil)
}

# Exponencial

# Para la exponencial vamos a generarla al igual que la anterior. Una vez definidda la ventana, 
# vamos a obtener el pomedio de la serie ingresada desde 1 hasta n, y vamos a calcular el 
# valor de beta = 2/(n+1), despues vamos a irterar el vector exp co un ciclo for
# y vamos a aplicar la formula de la media exp a partir de valor de beta definido

ME <- function(serie, n){
  Exp <- c()
  Exp[1:(n-1)] <- NA
  Exp[n] <- mean(serie[1:n])
  beta <- 2/(n+1)
  
  for (i in (n+1):length(serie)){
    Exp[i] <- beta * serie[i] + (1-beta) * Exp[i-1]
  }
  return(Exp)
}


# Exportación de los datos

library (ggplot2)
theme_set(theme_minimal())
# dentro de ggplot
head(economics)

p <- ggplot(economics, aes(x=date, y=psavert))+
  geom_line(color='#0F61F1', size=1)
p

movil <- MM(economics$psavert, n=8)
expo <- ME(economics$psavert, n=8)

p + geom_line(aes(x=date, y=movil, color='Movil Media')) + 
  geom_line(aes(x=date, y=expo, color = 'Media Exp.'))

# COMENTARIOS
# Como puede verse con valore de n iguales, mabas medias generan resultados bastantes similares
# y en ambos casos, se suaviza de forma general y correcta, sin cambios drasticos el comportamiento 
# temporal de los datos.

