{
  "nbformat": 4,
  "nbformat_minor": 0,
  "metadata": {
    "colab": {
      "provenance": []
    },
    "kernelspec": {
      "name": "ir",
      "display_name": "R"
    },
    "language_info": {
      "name": "R"
    }
  },
  "cells": [
    {
      "cell_type": "code",
      "source": [
        "# Carregar o arquivo de texto em um dataframe\n",
        "dados <- read.csv(\"movie.txt\")"
      ],
      "metadata": {
        "id": "EKFdd_rvVxQ6"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "code",
      "source": [
        "# Usando a função names()\n",
        "colunas <- names(dados)\n",
        "print(colunas)\n",
        "\n",
        "# Visualizar as primeiras 5 linhas do resultado\n",
        "print(head(dados, 2))\n",
        "\n",
        "# Verificar a estrutura do dataframe\n",
        "str(dados)"
      ],
      "metadata": {
        "colab": {
          "base_uri": "https://localhost:8080/"
        },
        "id": "1cRs0vDPXhIr",
        "outputId": "2f2a9d9c-ad49-4231-c914-94634a6b3237"
      },
      "execution_count": null,
      "outputs": [
        {
          "output_type": "stream",
          "name": "stdout",
          "text": [
            "[1] \"movieId\" \"title\"   \"age\"     \"genres\" \n",
            "[1] \"movieId\" \"title\"   \"age\"     \"genres\" \n",
            "  movieId     title  age                                      genres\n",
            "1       1 Toy Story 1995 Adventure|Animation|Children|Comedy|Fantasy\n",
            "2       2   Jumanji 1995                  Adventure|Children|Fantasy\n",
            "'data.frame':\t37027 obs. of  4 variables:\n",
            " $ movieId: chr  \"1\" \"2\" \"3\" \"4\" ...\n",
            " $ title  : chr  \"Toy Story\" \"Jumanji\" \"Grumpier Old Men\" \"Waiting to Exhale\" ...\n",
            " $ age    : chr  \"1995\" \"1995\" \"1995\" \"1995\" ...\n",
            " $ genres : chr  \"Adventure|Animation|Children|Comedy|Fantasy\" \"Adventure|Children|Fantasy\" \"Comedy|Romance\" \"Comedy|Drama|Romance\" ...\n"
          ]
        }
      ]
    },
    {
      "cell_type": "code",
      "source": [
        "# Converter as colunas movieId e age para numérico\n",
        "dados$movieId <- as.numeric(dados$movieId)\n",
        "dados$age <- as.numeric(dados$age)\n",
        "\n",
        "# Verificar a estrutura do dataframe após a conversão\n",
        "str(dados)\n"
      ],
      "metadata": {
        "colab": {
          "base_uri": "https://localhost:8080/"
        },
        "id": "CzLjhQMdd2-d",
        "outputId": "37789afc-01b3-4e8d-d7a8-29e39bd140d7"
      },
      "execution_count": null,
      "outputs": [
        {
          "output_type": "stream",
          "name": "stderr",
          "text": [
            "Warning message in eval(expr, envir, enclos):\n",
            "“NAs introduced by coercion”\n",
            "Warning message in eval(expr, envir, enclos):\n",
            "“NAs introduced by coercion”\n"
          ]
        },
        {
          "output_type": "stream",
          "name": "stdout",
          "text": [
            "'data.frame':\t37027 obs. of  4 variables:\n",
            " $ movieId: num  1 2 3 4 5 6 7 8 9 10 ...\n",
            " $ title  : chr  \"Toy Story\" \"Jumanji\" \"Grumpier Old Men\" \"Waiting to Exhale\" ...\n",
            " $ age    : num  1995 1995 1995 1995 1995 ...\n",
            " $ genres : chr  \"Adventure|Animation|Children|Comedy|Fantasy\" \"Adventure|Children|Fantasy\" \"Comedy|Romance\" \"Comedy|Drama|Romance\" ...\n"
          ]
        }
      ]
    },
    {
      "cell_type": "code",
      "source": [
        "# Excluir a primeira coluna\n",
        "dados <- dados[, -1]\n",
        "\n",
        "# Visualizar as primeiras 5 linhas do resultado\n",
        "print(head(dados, 5))"
      ],
      "metadata": {
        "colab": {
          "base_uri": "https://localhost:8080/"
        },
        "id": "pI87HpsYXlMq",
        "outputId": "4a16d8c8-c287-46e1-b63e-4c8da19e84b5"
      },
      "execution_count": null,
      "outputs": [
        {
          "output_type": "stream",
          "name": "stdout",
          "text": [
            "                        title  age                                      genres\n",
            "1                   Toy Story 1995 Adventure|Animation|Children|Comedy|Fantasy\n",
            "2                     Jumanji 1995                  Adventure|Children|Fantasy\n",
            "3            Grumpier Old Men 1995                              Comedy|Romance\n",
            "4           Waiting to Exhale 1995                        Comedy|Drama|Romance\n",
            "5 Father of the Bride Part II 1995                                      Comedy\n"
          ]
        }
      ]
    },
    {
      "cell_type": "code",
      "source": [
        "# Ordenar o dataframe pelo valor da coluna \"age\"\n",
        "dados <- dados[order(as.numeric(dados$age)), ]\n",
        "\n",
        "# Visualizar as primeiras 5 linhas do resultado\n",
        "print(head(dados, 10))\n"
      ],
      "metadata": {
        "colab": {
          "base_uri": "https://localhost:8080/"
        },
        "id": "IRQJxd49XoFi",
        "outputId": "87e3e884-ee4d-4394-9e0f-62768b02c763"
      },
      "execution_count": null,
      "outputs": [
        {
          "output_type": "stream",
          "name": "stdout",
          "text": [
            "                                       title  age                genres\n",
            "10873                                      1    2                     3\n",
            "27516                                      3    2  1... Frankie Go Boom\n",
            "1144                                   1-900    6                  1994\n",
            "32108                                      8    8              the Play\n",
            "28670                              Sixtynine   69                  1969\n",
            "826                                      301  302               301/302\n",
            "36758                       Dickson Greeting 1891     (no genres listed\n",
            "26744                       Blacksmith Scene 1893     (no genres listed\n",
            "24475 Edison Kinetoscopic Record of a Sneeze 1894           Documentary\n",
            "26574        Dickson Experimental Sound Film 1894               Musical\n"
          ]
        }
      ]
    },
    {
      "cell_type": "code",
      "source": [
        "# Contar a frequência de cada valor único na coluna \"age\"\n",
        "freq_age <- table(dados$age)\n",
        "\n",
        "# Classificar as frequências em ordem decrescente\n",
        "freq_age_sorted <- sort(freq_age, decreasing = TRUE)\n",
        "\n",
        "# Selecionar os 10 números mais frequentes\n",
        "top_10_numeros <- names(freq_age_sorted)[1:10]\n",
        "\n",
        "# Obter as contagens dos 10 números mais frequentes\n",
        "contagens_top_10 <- freq_age_sorted[1:10]\n",
        "\n",
        "# Exibir os 10 números mais frequentes e suas contagens formatados como lista\n",
        "cat(\"Top 10 números mais frequentes na coluna 'age' e suas contagens:\\n\")\n",
        "for (i in 1:10) {\n",
        "  cat(\"\\n\", i, \". Ano mais frequente: \", top_10_numeros[i], \"\\n\")\n",
        "  cat(\"   - Citado tantas vezes: \", contagens_top_10[i], \"\\n\")\n",
        "}\n"
      ],
      "metadata": {
        "colab": {
          "base_uri": "https://localhost:8080/"
        },
        "id": "XTDJHdudXsZi",
        "outputId": "3dd4aec9-fade-4e64-e5c9-d5d9dce945d8"
      },
      "execution_count": null,
      "outputs": [
        {
          "output_type": "stream",
          "name": "stdout",
          "text": [
            "Top 10 números mais frequentes na coluna 'age' e suas contagens:\n",
            "\n",
            " 1 . Ano mais frequente:  2013 \n",
            "   - Citado tantas vezes:  777 \n",
            "\n",
            " 2 . Ano mais frequente:  2009 \n",
            "   - Citado tantas vezes:  734 \n",
            "\n",
            " 3 . Ano mais frequente:  2012 \n",
            "   - Citado tantas vezes:  729 \n",
            "\n",
            " 4 . Ano mais frequente:  2011 \n",
            "   - Citado tantas vezes:  695 \n",
            "\n",
            " 5 . Ano mais frequente:  2008 \n",
            "   - Citado tantas vezes:  647 \n",
            "\n",
            " 6 . Ano mais frequente:  2010 \n",
            "   - Citado tantas vezes:  637 \n",
            "\n",
            " 7 . Ano mais frequente:  2014 \n",
            "   - Citado tantas vezes:  622 \n",
            "\n",
            " 8 . Ano mais frequente:  2007 \n",
            "   - Citado tantas vezes:  610 \n",
            "\n",
            " 9 . Ano mais frequente:  2006 \n",
            "   - Citado tantas vezes:  539 \n",
            "\n",
            " 10 . Ano mais frequente:  2005 \n",
            "   - Citado tantas vezes:  477 \n"
          ]
        }
      ]
    },
    {
      "cell_type": "code",
      "source": [
        "# Criar um dataframe com os dados dos 10 anos mais frequentes e suas contagens\n",
        "dados_top_10 <- data.frame(Ano = top_10_numeros, Contagem = contagens_top_10)\n",
        "\n",
        "# Exibir a tabela\n",
        "print(dados_top_10)\n"
      ],
      "metadata": {
        "id": "Fu1ZtJUhXvAc",
        "colab": {
          "base_uri": "https://localhost:8080/"
        },
        "outputId": "8d792097-1402-4973-f5aa-1f2ed3feb60d"
      },
      "execution_count": null,
      "outputs": [
        {
          "output_type": "stream",
          "name": "stdout",
          "text": [
            "    Ano Contagem.Var1 Contagem.Freq\n",
            "1  2013          2013           777\n",
            "2  2009          2009           734\n",
            "3  2012          2012           729\n",
            "4  2011          2011           695\n",
            "5  2008          2008           647\n",
            "6  2010          2010           637\n",
            "7  2014          2014           622\n",
            "8  2007          2007           610\n",
            "9  2006          2006           539\n",
            "10 2005          2005           477\n"
          ]
        }
      ]
    },
    {
      "cell_type": "code",
      "source": [
        "# Dividir os gêneros em cada entrada e criar uma lista de todos os gêneros\n",
        "todos_generos <- unlist(strsplit(dados$genres, \"\\\\|\"))\n",
        "\n",
        "# Contar a frequência de cada gênero\n",
        "freq_generos <- table(todos_generos)\n",
        "\n",
        "# Ordenar os gêneros em ordem decrescente de frequência\n",
        "freq_generos_ordenados <- sort(freq_generos, decreasing = TRUE)\n",
        "\n",
        "# Selecionar os 10 gêneros mais citados\n",
        "top_10_generos <- names(freq_generos_ordenados)[1:10]\n",
        "\n",
        "# Obter as contagens dos 10 gêneros mais citados\n",
        "contagens_top_10_generos <- freq_generos_ordenados[1:10]\n",
        "\n",
        "# Criar um dataframe com os dados dos 10 gêneros mais citados e suas contagens\n",
        "dados_top_10_generos <- data.frame(Gênero = top_10_generos, Contagem = contagens_top_10_generos)\n",
        "\n",
        "# Exibir a tabela com os 10 gêneros mais citados\n",
        "print(dados_top_10_generos)\n"
      ],
      "metadata": {
        "colab": {
          "base_uri": "https://localhost:8080/"
        },
        "id": "24ux3cwBgWRl",
        "outputId": "737dc75a-1936-4672-cb29-cef785d2ded7"
      },
      "execution_count": null,
      "outputs": [
        {
          "output_type": "stream",
          "name": "stdout",
          "text": [
            "        Gênero Contagem.todos_generos Contagem.Freq\n",
            "1        Drama                  Drama          7888\n",
            "2       Comedy                 Comedy          5693\n",
            "3     Thriller               Thriller          2735\n",
            "4      Romance                Romance          2670\n",
            "5       Action                 Action          2318\n",
            "6        Crime                  Crime          1897\n",
            "7  Documentary            Documentary          1813\n",
            "8       Horror                 Horror          1685\n",
            "9    Adventure              Adventure          1501\n",
            "10      Sci-Fi                 Sci-Fi          1211\n"
          ]
        }
      ]
    },
    {
      "cell_type": "code",
      "source": [
        "# Encontrar o ano mais frequente\n",
        "ano_mais_frequente <- names(freq_age_sorted)[1]\n",
        "\n",
        "# Filtrar o dataframe para incluir apenas as entradas que correspondem ao ano mais frequente\n",
        "dados_ano_mais_frequente <- dados[dados$age == ano_mais_frequente, ]\n",
        "\n",
        "# Dividir os gêneros em cada entrada e criar uma lista de todos os gêneros para esse ano\n",
        "todos_generos_ano_mais_frequente <- unlist(strsplit(dados_ano_mais_frequente$genres, \"\\\\|\"))\n",
        "\n",
        "# Contar a frequência de cada gênero para esse ano\n",
        "freq_generos_ano_mais_frequente <- table(todos_generos_ano_mais_frequente)\n",
        "\n",
        "# Encontrar o gênero mais frequente para esse ano\n",
        "genero_mais_frequente_ano_mais_frequente <- names(which.max(freq_generos_ano_mais_frequente))\n",
        "\n",
        "# Verificar quantas vezes o gênero mais frequente ocorreu no ano mais frequente\n",
        "freq_genero_mais_frequente_ano_mais_frequente <- freq_generos_ano_mais_frequente[genero_mais_frequente_ano_mais_frequente]\n",
        "\n",
        "# Exibir o resultado\n",
        "print(paste(\"No ano de\", ano_mais_frequente, \"foi o ano mais frequente, e nesse ano o genero mais frequente foi\", genero_mais_frequente_ano_mais_frequente, \"e ocorreu\", freq_genero_mais_frequente_ano_mais_frequente, \"vezes.\"))\n"
      ],
      "metadata": {
        "colab": {
          "base_uri": "https://localhost:8080/"
        },
        "id": "lzrjn8SPhSzV",
        "outputId": "41e4363f-269e-4459-c00e-4b9fad3f0b89"
      },
      "execution_count": null,
      "outputs": [
        {
          "output_type": "stream",
          "name": "stdout",
          "text": [
            "[1] \"No ano de 2013 foi o ano mais frequente, e nesse ano o genero mais frequente foi Drama e ocorreu 320 vezes.\"\n"
          ]
        }
      ]
    },
    {
      "cell_type": "code",
      "source": [
        "# Filtrar o dataframe para incluir apenas os filmes de drama em 2013\n",
        "filmes_drama_2013 <- subset(dados, grepl(\"Drama\", genres) & age == \"2013\")\n",
        "\n",
        "# Selecionar 10 filmes aleatórios (se quiser) ou os 10 primeiros\n",
        "# Use sample_n(filmes_drama_2013, 10) para selecionar aleatoriamente\n",
        "filmes_drama_2013_10 <- head(filmes_drama_2013, 10)\n",
        "\n",
        "# Exibir o dataframe com os filmes de drama em 2013\n",
        "print(filmes_drama_2013_10)\n"
      ],
      "metadata": {
        "colab": {
          "base_uri": "https://localhost:8080/"
        },
        "id": "A7mUTJKziCF-",
        "outputId": "14c55075-74e1-47f2-d702-aa94fb2e313f"
      },
      "execution_count": null,
      "outputs": [
        {
          "output_type": "stream",
          "name": "stdout",
          "text": [
            "                    title  age                       genres\n",
            "28120            Addicted 2013                        Drama\n",
            "28264      Gangster Squad 2013           Action|Crime|Drama\n",
            "28354         Broken City 2013         Crime|Drama|Thriller\n",
            "28545        Side Effects 2013 Crime|Drama|Mystery|Thriller\n",
            "28575           DrogÃ³wka 2013           Comedy|Crime|Drama\n",
            "28589 Beautiful Creatures 2013        Drama|Fantasy|Romance\n",
            "28610          Safe Haven 2013        Drama|Mystery|Romance\n",
            "28642      Saving Lincoln 2013                        Drama\n",
            "28654     Before Midnight 2013                Drama|Romance\n",
            "28667              Snitch 2013        Action|Drama|Thriller\n"
          ]
        }
      ]
    },
    {
      "cell_type": "code",
      "source": [
        "#Dataframe Criados para Analises dos Dados\n",
        "#dados_top_10\n",
        "\n",
        "#dados_top_10_generos\n",
        "\n",
        "#filmes_drama_2013_10\n",
        "\n",
        "install.packages(\"ggplot2\")\n",
        "library(ggplot2)\n"
      ],
      "metadata": {
        "id": "BIms8cBOiW7u",
        "colab": {
          "base_uri": "https://localhost:8080/"
        },
        "outputId": "3d23714f-4cd1-491f-bd4d-92d9663095e9"
      },
      "execution_count": null,
      "outputs": [
        {
          "output_type": "stream",
          "name": "stderr",
          "text": [
            "Installing package into ‘/usr/local/lib/R/site-library’\n",
            "(as ‘lib’ is unspecified)\n",
            "\n"
          ]
        }
      ]
    },
    {
      "cell_type": "markdown",
      "source": [
        "# **# Converter os top 10 anos mais frequentes para grafico**"
      ],
      "metadata": {
        "id": "07_fNqDjkyy-"
      }
    },
    {
      "cell_type": "code",
      "source": [
        "# Converter os top 10 números para números inteiros\n",
        "top_10_numeros_int <- as.integer(top_10_numeros)\n",
        "\n",
        "# Gráfico de dispersão\n",
        "ggplot(dados_top_10, aes(x = top_10_numeros_int, y = contagens_top_10)) +\n",
        "  geom_point(color = \"blue\") +\n",
        "  geom_smooth(method = \"lm\", se = FALSE, color = \"red\") +\n",
        "  labs(title = \"Relação entre Ano e Contagem de Filmes\",\n",
        "       x = \"Ano\",\n",
        "       y = \"Contagem\") +\n",
        "  theme_minimal()\n",
        "\n"
      ],
      "metadata": {
        "colab": {
          "base_uri": "https://localhost:8080/",
          "height": 89
        },
        "id": "luTP6e3ZiZXm",
        "outputId": "0c09498b-9af4-4ad8-a71f-ce695fb3642f"
      },
      "execution_count": null,
      "outputs": [
        {
          "output_type": "error",
          "ename": "ERROR",
          "evalue": "Error in ggplot(dados, aes(x = top_10_numeros_int, y = contagens_top_10)): could not find function \"ggplot\"\n",
          "traceback": [
            "Error in ggplot(dados, aes(x = top_10_numeros_int, y = contagens_top_10)): could not find function \"ggplot\"\nTraceback:\n"
          ]
        }
      ]
    },
    {
      "cell_type": "code",
      "source": [
        "# Gráfico de barras\n",
        "ggplot(dados_top_10, aes(x = reorder(top_10_numeros, contagens_top_10), y = contagens_top_10)) +\n",
        "  geom_bar(stat = \"identity\", fill = \"skyblue\") +\n",
        "  labs(title = \"Top 10 Anos Mais Citados\",\n",
        "       x = \"Ano\",\n",
        "       y = \"Contagem\") +\n",
        "  theme(axis.text.x = element_text(angle = 45, hjust = 1))\n"
      ],
      "metadata": {
        "id": "0ERXtdIVkmBG"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "markdown",
      "source": [
        "# **Análises para dados_top_10_generos**"
      ],
      "metadata": {
        "id": "tDT5kAt0k8qO"
      }
    },
    {
      "cell_type": "code",
      "source": [
        "# Gráfico de barras\n",
        "ggplot(dados_top_10_generos, aes(x = reorder(Gênero, Contagem), y = Contagem)) +\n",
        "  geom_bar(stat = \"identity\", fill = \"green\") +\n",
        "  labs(title = \"Top 10 Gêneros Mais Citados\",\n",
        "       x = \"Gênero\",\n",
        "       y = \"Contagem\") +\n",
        "  theme(axis.text.x = element_text(angle = 45, hjust = 1))\n"
      ],
      "metadata": {
        "id": "zmXtFLO5lBWA"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "code",
      "source": [
        "# Gráfico de pizza\n",
        "ggplot(dados_top_10_generos, aes(x = \"\", y = Contagem, fill = Gênero)) +\n",
        "  geom_bar(stat = \"identity\", width = 1) +\n",
        "  coord_polar(\"y\", start = 0) +\n",
        "  labs(title = \"Distribuição dos 10 Gêneros Mais Citados\",\n",
        "       x = NULL,\n",
        "       y = NULL,\n",
        "       fill = \"Gênero\") +\n",
        "  theme_void() +\n",
        "  theme(legend.position = \"right\")\n"
      ],
      "metadata": {
        "id": "PNlmJJY2lF8-"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "code",
      "source": [
        "# Gêneros mais citados por ano\n",
        "ggplot(dados_top_10_generos_por_ano, aes(x = Ano, y = Contagem, fill = Gênero)) +\n",
        "  geom_bar(stat = \"identity\", position = \"stack\") +\n",
        "  labs(title = \"Top 10 Gêneros Mais Citados por Ano\",\n",
        "       x = \"Ano\",\n",
        "       y = \"Contagem\",\n",
        "       fill = \"Gênero\") +\n",
        "  theme(axis.text.x = element_text(angle = 45, hjust = 1))\n"
      ],
      "metadata": {
        "id": "ku7yx3c4lHYG"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "markdown",
      "source": [
        "# **Análises para filmes_drama_2013_10**"
      ],
      "metadata": {
        "id": "oQw--4vYlI3e"
      }
    },
    {
      "cell_type": "code",
      "source": [
        "# Gráfico de barras\n",
        "ggplot(filmes_drama_2013_10, aes(x = reorder(title, movieId))) +\n",
        "  geom_bar() +\n",
        "  labs(title = \"Distribuição de Filmes de Drama em 2013\",\n",
        "       x = \"Filme\") +\n",
        "  theme(axis.text.x = element_text(angle = 45, hjust = 1))\n"
      ],
      "metadata": {
        "id": "BasgbkI7lIsG"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "code",
      "source": [
        "# Gráfico de dispersão\n",
        "ggplot(filmes_drama_2013_10, aes(x = movieId, y = movieId)) +\n",
        "  geom_point() +\n",
        "  labs(title = \"Distribuição de Filmes de Drama em 2013\",\n",
        "       x = \"Movie ID\",\n",
        "       y = \"Movie ID\")\n"
      ],
      "metadata": {
        "id": "m-tw3O_ylMXv"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "code",
      "source": [
        "# Filtrar dados para apenas filmes de drama\n",
        "filmes_drama <- subset(dados, grepl(\"Drama\", genres))\n",
        "\n",
        "# Contagem de filmes de drama por ano\n",
        "contagem_por_ano <- table(filmes_drama$age)\n",
        "\n",
        "# Criar dataframe\n",
        "dados_drama_por_ano <- data.frame(Ano = as.numeric(names(contagem_por_ano)),\n",
        "                                  Contagem = as.numeric(contagem_por_ano))\n",
        "\n",
        "# Gráfico de linhas\n",
        "ggplot(dados_drama_por_ano, aes(x = Ano, y = Contagem)) +\n",
        "  geom_line() +\n",
        "  labs(title = \"Contagem de Filmes de Drama ao Longo dos Anos\",\n",
        "       x = \"Ano\",\n",
        "       y = \"Contagem\")\n"
      ],
      "metadata": {
        "id": "QbeGlDxtlPw2"
      },
      "execution_count": null,
      "outputs": []
    }
  ]
}