#!/bin/bash

converte_imagem(){

cd ~/bash-script/imagens-livros

#verificando se o diretorio png existe
if [ ! -d png ]
then
    mkdir png
fi

for imagem in *.jpg
do
  local imagem_sem_extensao=$(ls $imagem | awk -F. '{print $1 }')
	convert $imagem_sem_extensao.jpg png/$imagem_sem_extensao.png
done

}
#ultilizando a função de conversão e caso ocorra um erro, sera salvo no arquivo erros_conversao.txt
converte_imagem 2>erros_conversao.txt

#verifica se a função converte_imagem funcionou 1 = true & 0 = false
if [ $? -eq 0 ]
then
  echo "Conversao realizada com sucesso"
else
  echo "Houve uma falha no processo"
fi