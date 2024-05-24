# Mandala 7 - Composição

# Mandala Astroide com lemniscata
# Mesmo esquema de cores em ambas as composições

Composição parte 1 - Astroide

nrot = 13
rotacao = seq(0,pi,pi/nrot)#
step = 0.0125; contracao = seq(0, 1.0, by = step);
cor = colors()[1:length(contracao)]
p1 = MandalaColorida(curva="astroide",rotacao,contracao,cor)
p1

Composição parte 2 - Lemniscata de Gerono

p2 = MandalaColorida(curva="lemniscata",rotacao,contracao,cor)
p2

#A mandala final foi produzinda com a sobreposição de p2 no centro de p1, com ajuste manual.
