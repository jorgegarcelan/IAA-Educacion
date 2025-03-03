### Script for Introduction to R

# List of loaded and installed packages

search()
library()
installed.packages()

#Complete list of contributed packages: http://cran.r-project.org/web/packages/

# Help related to a function or command

?c
?t.test()

# Get and set the working directory

getwd()
setwd("C:\\Users\\pedmume\\Documents")
getwd()

# Data types

class(7.45)
class(1)
class (16e-3)
class (3+4i)
class("red")
class("True")
class(False)
class(TRUE)
7+3

# Variable assignment and access

x=7.6
x
x=as.integer(x)
class(x)
y=5.4
class(y)
y=as.integer(y)
class(y)


#Vectors

nombre=c("john","marc", "mary", "peter", "sophie", "sarah", "rachel", "stephanie","ralf")
nombre[3]
nombre[4]="simon"
nombre
class(nombre)
class(nombre[3])
class(noexistance)
nombre2=c(nombre, nombre, nombre, "Pedro")
nombre2
ids=1:9
ids


#Case study: Grades in 2 different activities

class(ids)
gender=c("man", "man", "woman", "man", "woman", "woman", "woman", "woman", "man")
score_act_1=c(7.2, 9.3, 10.3, 5.6, 4.0, 3.2, 5.5, 6.3, 8.2)
score_act_2=c(7.5, 9.6, 10.5, NA, 4.3, 3.2, 5.4, 7.6, NA)

#Lists
list1=c(gender, score_act_1, NA, TRUE)

#Matrixes

M <- matrix(c(1:9),nrow = 2, ncol = 3)
M <- matrix(c(1:10),nrow = 2, ncol = 3)
M <- matrix(c(1:10),nrow = 2, ncol = 5)

#Data frames

d1=data.frame(1:3,c(TRUE, FALSE, TRUE))
d1[1,2]
d1[1,2]=FALSE
d1
nrow(d1)
ncol(d1)
names(d1)
row.names(d1)
edit(d1)
d1=data.frame(d1, 2)
d1=data.frame(d1, 2*d1$X1.3)

# Grades in two different activities in a data frame


s=data.frame(nombre, ids, gender, score_act_1, score_act_2)
s
names(s)
names(s)[1]
names(s)[1]="names"
s
edit(s)
s=edit(s)

s=data.frame(s, TRUE)
names(s)[6]="valid"
score_act<-2*s$score_act_2+s$score_act_1
score_act
s=data.frame(s, score_act)
score_act

#subset of data from a data frame

subset(s,gender=="man")
subset(s,gender=="man" & score_act_1>8)
subset(s,gender=="man" & score_act_1>8, select=score_act_1:score_act)
subset(s,gender=="man" & score_act_1>8, select=c(score_act_1, score_act_2, score_act))

#Read data from files to store them in a data frame

engagement=read.table("engagement.txt", header = TRUE)
engagement
View(engagement)
class(engagement)
engagement2=read.csv("engagement.txt", header = TRUE, sep = "")
class(engagement2)
engagement2
names(engagement2)
LG=read.csv("learning_gains.txt", header = TRUE)
LG
LG2=read.csv("learning_gains.txt")
LG2
