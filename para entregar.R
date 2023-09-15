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


multi.cor <- function(x, y) {
  c(
    cor = cor(x, y), # Correlação
    dcor = dcor(x, y), # Distance correlation
    cosine = cosine(x, y), # Distância do Cosseno 
    maxCor = maxCorProj(x, y), # Maximal correlation
    MIC = mine (x, y) #  Maximal Information Coefficient
  )
}

# Exemplo de análise com as variáveis da base de dados
# Vamos usar as colunas "saldo", "preco" e "valor_total" como exemplo
x <- almoxarifado$saldo
y <- almoxarifado$preco

# Plotar o gráfico
plot(x, y)

# Calcular medidas de associação
corList <- multi.cor(x, y)
names(corList)
corList <- corList[c("cor", "dcor", "cosine", "maxCor", "MIC")]
corList
