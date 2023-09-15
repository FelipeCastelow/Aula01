#pacotes
pacman::p_load(
  ggplot2,
  dplyr, 
  data.table,
  ggplotly
)

instagram_unifafire <- fread('https://raw.githubusercontent.com/hugoavmedeiros/ciencia_politica_com_r/master/bases_tratadas/instagram_unifafire.csv')

str(instagram_unifafire)

#HISTOGRAMA
instagram_unifafire %>% 
  ggplot(aes(x=Comentários)) + geom_histogram()

#DENSIDADE
instagram_unifafire %>% 
  ggplot(aes(x=Curtidas)) + geom_density()

#GRAFICO DE CAIXAS MULTIVARIADO
instagram_unifafire %>% 
  ggplot(aes(Y=Curtidas, x=Comentários)) + geom_boxplot()


