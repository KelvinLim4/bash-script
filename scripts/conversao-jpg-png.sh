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

converte_imagem

#verifica se a função converte_imagem funcionou 1 = true & 0 = false
if [ $? -eq 0 ]
then
  echo "Conversao realizada com sucesso"
else
  echo "Houve uma falha no processo"
fi