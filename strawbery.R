setwd("D:/METOPEL UAS/ZAHRA METOPEL")
library(readxl)
library(tidyverse)
library(kableExtra)
read_excel("strawbery.xlsx")
dat <- read_excel("strawbery.xlsx")
kbl(dat) %>%
  kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive"))

# regresi
reg1<-lm(ekspor~impor+kurscny,data=dat)
summary(reg1)

# Plot 
plot(dat$tahun,dat$ekspor,xlab="Tahun",ylab="Nilai FOB Ekspor Total Indonesia ")
plot(dat$tahun,dat$impor,xlab="Tahun",ylab="Nilai FOB Sawit")
plot(dat$tahun,dat$kurscny,xlab="Tahun",ylab="Nilai FOB Bidang Perminyakan")

# Plot Error

dat$m<-resid(reg1)
plot(dat$ekspor,dat$m,xlab="Nilai Ekspor Jeruk Mandarin",ylab="error")
abline(h=0) # membuat garis horizontal di y=0

dat$m<-resid(reg1)
plot(dat$impor,dat$m,xlab="Nilai Impor Strawbery",ylab="error")
abline(h=0) # membuat garis horizontal di y=0

dat$m<-resid(reg1)
plot(dat$kurscny,dat$m,xlab="Nilai Tukar CNY/USD",ylab="error")
abline(h=0) # membuat garis horizontal di y=0
