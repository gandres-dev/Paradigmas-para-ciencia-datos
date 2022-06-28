

mayores <- function(v, th) {
  ind  <- v > th
  v[ind]
}

mayores(3:30, 18)

mayores_pares <- function(v, th) {
  ind <- v %% 2 == 0 & v > th
  v[ind]
}

mayores_pares(3:30,18)


# Otra solucion mas eficiente
mayores_pares2 <- function(v, th) {
  ind <- !bitwAnd(v,1) & v > th
  v[ind]
}
mayores_pares2(3:30,18)

# Recibe una matriz 
# Suma por columnas
suma_cols <- function(m) {
  n_col <- ncol(m)
  n_filas <- nrow(m)
  suma_ <- numeric(n_col)
  for (j in 1:n_col) {
    for(i in 1:n_filas) {
      suma_[j] <- suma_[j] + m[i,j]
    }
  }
  suma_
}

print(matrix(1:20, 5, 4))

suma_cols(matrix(1:20, 5, 4))

# Suma por filas
suma_fils<-function(m){
  n_col<- ncol(m)
  n_fil<-nrow(m)
  suma_<-numeric(n_fil)
  for(i in 1:n_fil){
    for(j in 1:n_col){
      suma_[i] <- suma_[i] + m[i,j]
    }
  }
  suma_
}

suma_fils(matrix(1:20, 5, 4))


sum(suma_fils(matrix(1:20, 5, 4)))

# functino colSums esta imple
help("colSums")

# Problema de programacion
c <- 10
c(1, 2, 3)
s <- c
s

# Problem 'name clash'
c <- function() {
  print("hola mundo")
}
c(1, 2)
# Ambiato espacio de nombre
base::c(1,2,3)
c
# Eliminar nuestra functino c
rm(c)

#View(c) Sirve para mostrar la funcion
# Conocer la ruta
getwd()
setwds('/home/guillermo/hddShare/IIMAS/Semestre2022-1/Paradigmas-y-Programacion-para-Ciencia-de-Datos/r')



datos <- read.table('datos.txt')
datos

datos <- read.table('datos.txt', header=T)

class(datos$FamilyNames)
class(datos$FamilyGenders)
# Factores
# Aquello que sirve para identificar

cols <- c('character', 'integer', 'factor', 'integer')
datos <- read.table('datos.txt', header=T, colClasses=cols)
class(datos$FamilyGenders)

x <- 'hola'
y <- data.frame(a=1+1i, b=5, c='c')

dump(c('x', 'y'), file='ejemplo.txt')

(source('ejemplo.txt'))


gato <- c('Cat', 2, 'Male', 10)
datos

datos <- rbind(datos, gato)
datos


write.table(datos, file='datos_.txt')

write.table(datos, file='datos_.txt', quote=FALSE, row.names=FALSE)


# Datos de fechas
as.Date('2015-01-01')
f1 <- as.Date('2015-01-01')
f2 <- as.Date('2021-08-23')
f2
f2 - f1
f1 <- as.Date('2021-01-01')
f2 - f1

f1 <- as.Date('2021/01/01')
f1
format(f2, '%y/%m/%d')

# Graficas
plot(c(1,2, 3, 4), c(5,8,2,1))
plot(c(1,2, 3, 4), c(5,8,2,1), pch='*')
plot(c(1,2, 3, 4), c(5,8,2,1), pch='*', xlab='x', ylab='y')

#Agrega puntos a la ultima grafica
points(c(1,4), c(2,5), pch='x')
lines(c(1,4), c(2,5), col='green')

# data drame iris
# iris viene por defecto
plot(iris)
plot(iris$Sepal.Length, iris$Sepal.Width)
