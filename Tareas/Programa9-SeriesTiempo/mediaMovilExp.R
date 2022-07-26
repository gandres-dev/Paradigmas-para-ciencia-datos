# Integrantes:
# Silva Velázquez Elsy Camila
# Longines Tapia Hugo Didier
# Andrés Urbano Guillermo Gerardo

library (ggplot2)


#' Calcula la media móvil de una serie de tiempo
#'
#' @param serie - un vector con los datos de la serie
#' @param n -- el retraso (lag) de la ventana para calcular la media movil
#'
#' @return Un vector con la media para la ventana indicada.
media_movil <- function(serie, n){
  m <- c()
  m[1:(n-1)] <- NA
  
  for (i in n:length(serie)){
    m[i] <- mean(serie[(i-n+1):i])
  }
  return(m)
}


#' Calcula la media exponencial de una serie de tiempo
#'
#' @param serie - un vector con los datos de la serie
#' @param n -- el retraso (lag) de la ventana para calcular la media movil
#'
#' @return Un vector con la media para la ventana indicada.
movil_exp <- function(serie, n){
  exp <- c()
  exp[1:(n-1)] <- NA
  exp[n] <- mean(serie[1:n])
  alpha <- 2/(n+1)
  
  for (i in (n+1):length(serie)){
    exp[i] <- alpha * serie[i] + (1-alpha) * exp[i-1]
  }
  return(exp)
}


ads <- read.csv('https://bit.ly/2l9BdhA')
ads$Time <- ymd_hms(ads$Time)

p <- ggplot(ads, aes(x=Time, y=Ads)) + geom_line(color='#0F61F1', size=1)
dev.off()
p

movil <- media_movil(ads$Ads, n=8)
expo <- movil_exp(ads$Ads, n=8)

p + geom_line(aes(x=Time, y=movil, color='Movil Media')) +
  geom_line(aes(x=Time, y=expo, color = 'Media Exp.'))

