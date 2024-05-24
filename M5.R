# Mandala 5 - Capa do Livro
# Criada com a curva lemniscata de Gerono 
# Coloração sequencial com base nas reduções

nrot = 13
rotacao = seq(0, pi, pi/nrot)
step = 0.005; contracao = seq(0.1, 1., by = step);
length(contracao)
cor = colors()[1:length(contracao)]
p = MandalaColorida(curva="lemniscata", rotacao, contracao,cor)
p


# Utilizando a função criada
MandalaColorida <- function(curva = "lemniscata", rotacao, contracao, cor) {
  require(ggplot2)
  n <- 700
  size <- 0.25
  theta <- seq(0, 2 * pi, length.out = n)  
  if (curva == "astroide") {
    x <- 3 * cos(theta)^3
    y <- 3 * sin(theta)^3
  } else if (curva == "deltoide") {
    x <- 2 * cos(theta)+ cos(2*theta)
    y <- 2*sin(theta)-sin(2*theta)
  } else if (curva == "cardioide") {
    x <- 1 - cos(theta)
    y <- sin(theta) * (1 + cos(theta))
  } else if (curva == "elipse") {
    a <- 2
    b <- 1
    x <- a * cos(theta)
    y <- b * sin(theta)
  } else if (curva == "circunferencia") {
    r <- 1
    x <- r * cos(theta)
    y <- r * sin(theta)
  } else {
    x <- sin(theta)
    y <- sin(theta) * cos(theta)
  }
  
  xt <- x
  yt <- y
  
  for (i in 1:length(rotacao)) {
    xt <- c(xt, x[1:n] * cos(rotacao[i]) - y[1:n] * sin(rotacao[i]))
    yt <- c(yt, x[1:n] * sin(rotacao[i]) + y[1:n] * cos(rotacao[i]))
  }
  
  p <- ggplot() + coord_fixed() + theme_void()
  
  for (i in 1:length(contracao)) {
    xt2 <- c(xt * contracao[i])
    yt2 <- c(yt * contracao[i])
    dt2 <- tibble::tibble(xt2, yt2)
    p <- p + geom_point(data = dt2, aes(x = xt2, y = yt2), color = cor[i], size = size)
  }
  
  return(p)
}
