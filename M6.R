# Mandala 6 - Cardióide Rosa
# Criada com a curva Cardióide
# Coloração paleta rosa com seleção aleatória

n=1000;theta=seq(0,2*pi, length.out = n);raio=1
x=c(2*raio*cos(theta)-raio*cos(2*theta))
y=c(2*raio*sin(theta)-raio*sin(2*theta))
xt=c(x+0);  yt=c(y)
n1=4;  rotacao=pi/n1*1:(2*n1)
xt1=xt; yt1=yt

for(i in 1:length(rotacao)){
  xt1=c(xt1,xt[1:n]*cos(rotacao[i])-yt[1:n]*sin(rotacao[i]))
  yt1=c(yt1,xt[1:n]*sin(rotacao[i])+yt[1:n]*cos(rotacao[i]))}
p= ggplot()+ coord_fixed()+ theme_void()
dt=tibble::tibble(xt1,yt1)
step=0.015; contracao = seq(.1,1,by=step);size=0.25
set.seed(10)
colores=c("indianred","lightcoral", "salmon", "lightsalmon","plum", "orchid", "pink", "violet", "hotpink")
cores=sample(colores,length(contracao),replace=T)
MinhasCores=rep(cores,floor(length(contracao)/length(cores)))

p=p+ geom_point(data=dt, aes(x=xt1, y=yt1), color="black",size=size)

for(i in 1:length(contracao)){
  xt2=c(xt1*contracao[i])
  yt2=c(yt1*contracao[i])
  dt2=tibble::tibble(xt2,yt2)
  p=p+geom_point(data=dt2, aes(x=xt2, y=yt2),color=MinhasCores[i],size=size) }
p
