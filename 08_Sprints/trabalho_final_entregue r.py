# -*- coding: utf-8 -*-
"""Trabalho Final Entregue.ipynb

Automatically generated by Colab.

Original file is located at
    https://colab.research.google.com/drive/18P_QL2BwBszHGr8B3u9QqiuKyyLGzewY

Nesta entrega final seu objetivo deve ser focado em uma extração de dados público e a sua análise utilizando
a programação em R para apresentação no dia.


Exemplo de uma situação problema com base na extração de dados públicos:
------------------------------------------------

Em uma região urbana, a qualidade da água é uma preocupação fundamental para garantir a saúde e o bem-estar
dos residentes. Uma autoridade local responsável pela gestão de recursos hídricos coletou dados sobre a qualidade
da água de diferentes fontes de abastecimento na região.

O conjunto de dados contém informações sobre parâmetros de qualidade da água, como pH, turbidez, níveis de cloro, temperatura, entre outros, coletados em diferentes pontos de abastecimento ao longo de um período de tempo.
Carregar os dados de qualidade da água no R.
Visualizar as primeiras linhas do conjunto de dados para entender sua estrutura.
Verificar se há valores ausentes ou inconsistentes nos dados e lidar com eles, se necessário.
Realizar uma análise descritiva dos diferentes parâmetros de qualidade da água, incluindo média, mínimo, máximo e quartis.Identificar quaisquer tendências ou padrões nos dados ao longo do tempo ou entre os diferentes pontos de abastecimento.
Criar gráficos ou visualizações para representar a qualidade da água em diferentes pontos de abastecimento.
Avaliar se os níveis de qualidade da água atendem aos padrões regulatórios estabelecidos e identificar quaisquer áreas que exijam intervenção ou melhoria.
"""

# Trabalho Final
# Trabalho em grupo com análise de dados de gasolina no mês de março de 2024.
# As informações iniciais são apresentado os dados básico e outros gráficos.

# base de dados - dados_gasolina txt.txt
# head =  Visualizar as primeiras linhas do conjunto de dados
# Verificar se há valores ausentes ou inconsistentes = neste caso foi convertido (.) em (,) nos dados Valor.de.Venda
# Indicar média, mínimo, máximo e quartis.
# Identificar quaisquer tendências ou padrões nos dados ao longo do tempo
# Criar gráficos ou visualizações para representar a qualidade da água em diferentes pontos de abastecimento.
# Avaliar os valores da gaslina por região
# Sei que tem variações de valores devido impostos, mas neste momento não localizei os % dos impostos para plotar os padrões regulatórios dos impostos
# Identificar quaisquer áreas que exijam intervenção ou melhoria - para este ciclo de estudo deixo expectativas futuras de estudo do imposto.

install.packages ("ggplot2")

# Carregando as bibliotecas para análisar os dados
library (ggplot2)

library(tidyr)

library(dplyr)

# Aplicando  o read leu os dados
dados <- read.csv("dados_gasolina txt.txt", sep = ";", header = TRUE, row.names = NULL)

# Lê os dados das colunas
colunas <- names(dados)

# Visualiza as colunas
print(colunas)

# Visualizar os dados da planilha
summary(dados)

print(head(dados, 2))

cat(paste(colunas, collapse = "\t"))

cat("Nomes das Colunas:\n")

# str - Na ciência da computação chamamos uma sequência de caracteres de string. E neste caso apresenta os dados
str(dados)

cat("\nEstrutura do DataFrame:\n")
str(dados)

cat("\n")

# Carregar as bibliotecas necessárias
library(dplyr) # Para manipulação de dados

# Converter a coluna "Valor.de.Venda" para numérico
dados$Valor.de.Venda <- as.numeric(gsub(",", ".", dados$Valor.de.Venda))

# Excluir a coluna "Data.da.Coleta"
dados <- select(dados, -Data.da.Coleta)

# Excluir a coluna "Unidade.de.Medida"
dados <- select(dados, -Unidade.de.Medida)

# Verificar novamente a estrutura do dataframe após as conversões
str(dados)

cat(rep("=", 12), "\n") # Visualização melhorada com linha de separação

# Calculo do menor valor de venda
min(dados$Valor.de.Venda)

# Calculo do maior valor de venda
max(dados$Valor.de.Venda)

# Calculo do valor mediana do valor de venda
median(dados$Valor.de.Venda)

# Calculo do valor médio do valor de venda
mean(dados$Valor.de.Venda)

# Calculo do valor de venda e dos quatis
quantile(dados$Valor.de.Venda)

# Neste item estava colocando head ( dados_gasolina txt.txt) e apresentava erro e vou deixar como excemplo
# mas neste caso havia aplicado ao data.frame então os dados a serem lidos passou a ser dados e não arquivo.
head(dados)

# Neste código consigo visualizar as colunas e o total de linhas
# consigo verificar se o arquivo subu completo, pois durante estudo certa vez subiu só 30% do código
# Data.frame Y x X
# y = 49906
# X = 8
View(dados)

# Visualizando dados
str(dados)

head("dados$Regiao")

print(dados$Regiao)

View(dados$Bandeira)

View(dados$Data.da.Coleta)

View(dados$Estado)

View(dados$Produto)

View(dados$Municipio)

head(dados$Municipio)

library(dplyr) # Para manipulação de dados

library(dplyr)

# Região que mais e menos comprou
regiao_mais_menos_compraram <- dados %>%
  group_by(Regiao) %>%
  summarise(total_vendas = n()) %>%
  arrange(desc(total_vendas)) %>%
  slice(c(1, n())) %>%
  mutate(mais_ou_menos = ifelse(row_number() == 1, "mais", "menos"))

# 5 Estados que mais compraram
estados_mais_compraram <- dados %>%
  group_by(Estado) %>%
  summarise(total_vendas = n()) %>%
  arrange(desc(total_vendas)) %>%
  top_n(5)

# 5 Municípios que mais compraram
municipios_mais_compraram <- dados %>%
  group_by(Municipio) %>%
  summarise(total_vendas = n()) %>%
  arrange(desc(total_vendas)) %>%
  top_n(5)

# Produtos mais e menos vendidos
produtos_mais_menos_vendidos <- dados %>%
  group_by(Produto) %>%
  summarise(total_vendas = n()) %>%
  arrange(total_vendas) %>%
  slice(c(1, n()))

# Separando produtos mais e menos vendidos
produtos_mais_vendidos <- produtos_mais_menos_vendidos %>%
  filter(total_vendas == max(total_vendas))

produtos_menos_vendidos <- produtos_mais_menos_vendidos %>%
  filter(total_vendas == min(total_vendas))

# Maior e menor valor de venda por produto
maior_menor_valor_venda <- dados %>%
  group_by(Produto) %>%
  summarise(maior_valor_venda = max(Valor.de.Venda),
            menor_valor_venda = min(Valor.de.Venda))

# Bandeiras que mais compraram
bandeiras_mais_comprou <- dados %>%
  group_by(Bandeira) %>%
  summarise(total_vendas = n()) %>%
  arrange(desc(total_vendas)) %>%
  top_n(2)

# Lista de cores
minha_paleta_cores <- c("#1D3557", "#E63946", "#A8DADC", "#457B9D", "#F1FAEE")

#5 Estados que mais compraram:

# Ordenar os estados pelo total de vendas (do menor para o maior)
estados_mais_compraram <- estados_mais_compraram %>%
  arrange(total_vendas)

ggplot(estados_mais_compraram, aes(x = reorder(Estado, total_vendas), y = total_vendas, fill = Estado)) +
  geom_col() +  # Usar geom_col() para barras
  geom_point(color = "black", size = 2) +  # Adicionar pontos
  geom_line(aes(group = 1), color = "black") +  # Adicionar linhas
  scale_fill_manual(values = minha_paleta_cores) +
  labs(title = "5 Estados que mais compraram",
       x = "Estado",
       y = "Total de vendas") +
  theme_minimal()