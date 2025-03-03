#Script sobre redes bayesianas

# Instalar y cargar el paquete grain

source("http://bioconductor.org/biocLite.R")
biocLite(c("graph", "RBGL", "Rgraphviz"))

install.packages("gRain")
library(gRain)
//Este paquete no está disponible en algunos mirrors

yn <- c("yes","no")

# Construir las diferentes tablas de probabilidad condicional y las probabilidades de los nodos sin nodos padre


a <- cptable(~asia, values=c(1,99),levels=yn)
s <- cptable(~smoke, values=c(50,50), levels=yn)

t.a <- cptable(~tub|asia, values=c(5,95,1,99),levels=yn)
l.s <- cptable(~lung|smoke, values=c(1,9,1,99), levels=yn)
b.s <- cptable(~bronc|smoke, values=c(60,40,30,70), levels=yn)

e.lt <- cptable(~either|lung:tub,values=c(1,0,1,0,1,0,0,1),levels=yn)
x.e <- cptable(~xray|either, values=c(98,2,5,95), levels=yn)
d.be <- cptable(~dysp|bronc:either, values=c(9,1,7,3,8,2,1,9), levels=yn)

# Construir la red bayesiana global

plist <- compileCPT(list(a, t.a, s, l.s, b.s, e.lt, x.e, d.be))
plist
net <- grain(plist)
net

class(plist)

plist$asia
plist$xray
plist$either

#Obtener las probabilidades de una variable o la distribución conjunta

querygrain(net, nodes=c("lung","bronc"), type="marginal")
querygrain(net,nodes=c("lung","bronc"), type="joint")

#Establecer las evidencias para la predicción de las variables

net_mod <- setEvidence(net, evidence=list(asia="yes", dysp="yes"))
net_mod

querygrain(net_mod, nodes=c("lung","bronc"), type="marginal")
querygrain(net_mod, nodes=c("lung","bronc"), type="joint")