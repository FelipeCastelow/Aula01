
library(data.table)
pacman:: p_load (corrplot, dplyr, ggplot2)

almoxarifado <- fread("estoquealmoxarifado.csv")
str(almoxarifado)

# ETL
#Remover os caracteres não numéricos (R$, espaços, vírgulas) da coluna "preco e valor_total" convertendo para númerico.
almoxarifado$preco <- as.numeric(gsub("[^0-9.]", "", almoxarifado$preco))
almoxarifado$valor_total <- as.numeric(gsub("[^0-9.]", "", almoxarifado$valor_total))
almoxarifado$saldo <- as.numeric(gsub("[^0-9.]", "", almoxarifado$saldo))

str(almoxarifado)

almoxarifado2 <- almoxarifado %>% select (preco, valor_total, saldo)

cor(almoxarifado2)

pairs(almoxarifado2)

almoxarifadocor <- cor(almoxarifado2)
corrplot(almoxarifadocor, method = "number", 
         order = "AOE")

corrplot(almoxarifadocor, order="FPC")
