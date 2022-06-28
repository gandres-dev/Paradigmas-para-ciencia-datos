library("car")
library(rgl)

options(rgl.printRglwidget=TRUE)
plot3d(depression ~ fatalism + simplicity,
       Ginzberg, xlim=c(0,3), zlim=c(0,3))

n <- 20
x <- y <- seq(0, 3, length=n)
region <- expand.grid(x=x, y=y)
# Son los valores obtenido de la regresion
z <- matrix(0.2027+0.4178 * region$x + 0.3795*region$y,
            n, n)
surface3d(x,y,z, back='line', front='line',
          col='red', lwd=1.5, alpha=0.4)
