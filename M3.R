require(ggplot2)
        n = 1200; theta = seq(0, 2*pi, length.out = n)
        x = cos(theta)^3; y = sin(theta)^3
        dt = tibble::tibble(x,y,z)
        step = pi/4 
        rotacao = c(seq(0,pi,step))
        xt = x; yt = y
        p = ggplot()+coord_fixed()+theme_void()
        for(i in 1:length(rotacao)){
        xt = c(xt,x[1:n]*cos(rotacao[i])-y[1:n]*sin(rotacao[i]))
        yt = c(yt,x[1:n]*sin(rotacao[i])+y[1:n]*cos(rotacao[i]))}
        red = c(seq(0.2,1,0.0175)) #c(.125,0.25, 0.5, 0.75,.9,.95,.975,1.)
        for(i in 1:length(red)){
        xtt = c(xt*red[i])
        ytt = c(yt*red[i])
        dt = data.frame(x=c(xt, xtt), y=c(yt, ytt), z="astroide")        
        p=p+geom_point(data=dt, aes(x=x, y=y), color=colors()[i],size=0.05)
        }
        
        p 
