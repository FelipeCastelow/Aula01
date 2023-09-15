
#CARREGANDO PACOTES
pacman::p_load(
  janitor,
  ade4,
  arules,
  forcats, 
  dplyr
)

facebook <- read.table(
  "https://raw.githubusercontent.com/hugoavmedeiros/ciencia_politica_com_r/master/bases_originais/dataset_Facebook.csv", 
  sep=";", 
  header = T)

str(facebook)

#CONVERSÃO EM FATORES
for(i in 2:7) {
  facebook[,i] <- as.factor(facebook[,i]) } 

facebook %>% str()

#TIPOS DE DADOS

factorsFacebook <- unlist(lapply(facebook, is.factor))  
facebookFactor <- facebook[ , factorsFacebook]
str(facebookFactor)

#DISCRETIZAÇÃO

inteirosFacebook <- unlist(lapply(facebook, is.integer))  
facebookInteiros <- facebook[, inteirosFacebook]
facebookInteiros %>% str()

#CATEGORIZAÇÃO DE FATORES
categorize_factors <- function(factor_vector) {
  
  #CONTAGEM DE MAIS FREQUENTES
  level_counts <- table(factor_vector)
  
  #ORDENAR POR DECRESCENTES
  sorted_levels <- names(sort(level_counts, decreasing = TRUE))
  
  #CATEGORIZAR POR NIVEL
  categorized_vector <- case_when(
    factor_vector %in% sorted_levels[1] ~ "Mais frequente",
    factor_vector %in% sorted_levels[2] ~ "Segundo mais frequente",
    TRUE ~ "Outros"
  )
  
  return(categorized_vector)
}

#FUNÇÃO DE CATEGORIZAÇÃO
facebookFactorCategorized <- facebookFactor %>%
  mutate(across(everything(), categorize_factors))


str(facebookFactorCategorized)
