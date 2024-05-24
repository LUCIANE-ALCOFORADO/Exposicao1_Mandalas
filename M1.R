# Mandala 1
# Criada com a curva lemniscata de gerono.
# Coloração sequencial com base nas reduções
 
require(ggplot2)
n = 1000
theta = seq(0, 2*pi, length.out = n)
x = sin(theta)
y = sin(theta)*cos(theta)
rotacao = c(pi/4, pi/2, 3*pi/4, pi, 3*pi/2)
xt = x; yt = y
        for(i in 1:length(rotacao)){
        xt = c(xt, x[1:n]*cos(rotacao[i])-y[1:n]*sin(rotacao[i]))
        yt = c(yt, x[1:n]*sin(rotacao[i])+y[1:n]*cos(rotacao[i]))
        }
p = ggplot()+ coord_fixed()+ theme_void()
dt=tibble::tibble(xt,yt)
p = p + geom_point(data=dt, aes(x=xt, y=yt), color="red",size=size)
step = 0.0075
contracao = seq(0.1, 1, by = step); size = 0.25
        for(i in 1:length(contracao)){
        xt2 = c(xt*contracao[i])
        yt2 = c(yt*contracao[i])
        dt2 = tibble::tibble(xt2,yt2)
        p = p + geom_point(data = dt2, aes(x = xt2, y = yt2), color = colors()[i], size = size)
        }
p 
