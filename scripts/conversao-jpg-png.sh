#!/bin/bash

cd ~/bash-script/imagens-livros

#verificando se o diretorio png existe
if [ ! -d png ]
then
    mkdir png
fi

for imagem in *.jpg
do
  imagem_sem_extensao=$(ls $imagem | awk -F. '{print $1 }')
	convert $imagem_sem_extensao.jpg png/$imagem_sem_extensao.png
done
