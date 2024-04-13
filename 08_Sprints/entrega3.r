# -*- coding: utf-8 -*-
"""Entrega3.ipynb

Automatically generated by Colab.

Original file is located at
    https://colab.research.google.com/drive/1LmZ_7Nz2gsWmEDdF7TnH40YC7TbH8O8A

Programa em Linguagem R do dia 10/04/2024
"""

dados <- read.csv("movie.csv")
print(dados)

View(dados)

print(is.data.frame(dados))
print(ncol(dados))
print(nrow(dados))

dados_1995 <- subset(dados, grepl("\\(1995\\)", title))

head(dados_1995)

dados_2000 <- subset(dados, grepl("\\(2000\\)", title))

head(dados_2000)

filmes_comedia <- subset(dados, grepl("Comedy", genres))
View(filmes_comedia)

filmes_comedia <- subset(dados, grepl("Western", genres))
View(filmes_comedia)

library(ggplot2)

# Adicionar uma nova coluna chamada "ano_lancamento" contendo apenas o ano do título
dados$ano_lancamento <- as.integer(gsub(".*\\((\\d+)\\)", "\\1", dados$title))
print(dados)

library(ggplot2)
# Converter o ano de lançamento para formato de data
dados$ano_lancamento <- as.Date(paste0(dados$ano, "-01-01"))

# Criar um gráfico de histograma da contagem de filmes por ano de lançamento
grafico_histograma_filmes <- ggplot(data = dados, aes(x = ano_lancamento)) +
  geom_histogram(binwidth = 1, fill = "blue", color = "black") +
  labs(title = "Histograma da Contagem de Filmes por Ano de Lançamento", x = "Ano de Lançamento", y = "Contagem de Filmes")

# Imprimir o gráfico
print(grafico_histograma_filmes)

dados$ano_lancamento <- as.integer(gsub(".*\\((\\d+)\\)", "\\1", dados$title))
ano <- dados
print(ano)