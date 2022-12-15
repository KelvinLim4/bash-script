#!/bin/bash

cd ~/bash-script/imagens-livros
for imagem in *.jpg
do
	convert $imagem $imagem.png
done
