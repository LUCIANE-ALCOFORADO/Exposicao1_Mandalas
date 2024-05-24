# Mandala 4 
# Criada com a curva lemniscata de Bernoulli considerando meia volta
# Coloração sequencial com base nas reduções

require(ggplot2)
n = 500; theta = seq(0, pi, length.out = n)
x = cos(theta)/(1+(sin(theta))^2)       
y = sin(theta)*cos(theta)/(1+(sin(theta))^2)
dt = tibble::tibble(x,y)
step = pi/10
rotacao = c(seq(0,pi,step)); 
xt = x; yt = y
p = ggplot()+coord_fixed()+theme_void()
        for(i in 1:length(rotacao)){
        xt = c(xt,x[1:n]*cos(rotacao[i])-y[1:n]*sin(rotacao[i]))
        yt = c(yt,x[1:n]*sin(rotacao[i])+y[1:n]*cos(rotacao[i]))}
        red = c(seq(1,0,-0.0125))
        for(i in 1:length(red)){
        xtt=c(xt*red[i])
        ytt=c(yt*red[i])
        dt = data.frame(x = c(xt, xtt), y = c(yt, ytt))
        
        p = p+geom_point(data=dt, aes(x=x, y=y), color=colors()[i], size=0.15)
        }
        # p = p + theme(panel.background = element_rect(fill = "black")  )
        p 

