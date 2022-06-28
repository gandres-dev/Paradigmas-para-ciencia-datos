library(plot3D)
library(car)

# Dataset Ginzsberg esta dentro del package car
x <- Ginzberg$fatalism
y <- Ginzberg$simplicity
z <- Ginzberg$depression

# ~ : significa que se ajusta
# Le dice que es una combinacion lineal de x y y
fit <- lm(z ~ x + y)

grid_lines <- 26

x_pred <- seq(min(x), max(x), length.out=grid_lines)
y_pred <- seq(min(x), max(x), length.out=grid_lines)
xy <- expand.grid(x=x_pred, y=y_pred)

z_pred <- matrix(predict(fit, newdata=xy),
                 nrow=grid_lines, ncol=grid_lines)

fitpoints <- predict(fit)

# Con esto no lo puedo mover, por eso tenemos
# que ir variando la teta
scatter3D(x, y, z, pch=18, cex=2,
          theta=20, phi=20, ticktype='detailed',
          xlab='fatalis', ylab='simplicity',
          zlab='depression',
          surf=list(x=x_pred,y=y_pred, z=z_pred,
                    facets=NA, fit=fitpoints,
                    main='Ginzberg'))

