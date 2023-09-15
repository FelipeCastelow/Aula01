
library(data.table)

almoxarifado <- fread("estoquealmoxarifado.csv")
str(almoxarifado)

# ETL
#Remover os caracteres não numéricos (R$, espaços, vírgulas) da coluna "preco e valor_total" convertendo para númerico.
almoxarifado$preco <- as.numeric(gsub("[^0-9.]", "", almoxarifado$preco))
almoxarifado$valor_total <- as.numeric(gsub("[^0-9.]", "", almoxarifado$valor_total))

str(almoxarifado)

#calcular a correlação
correlacao <- cor(almoxarifado$saldo, almoxarifado$preco)

print(correlacao)
