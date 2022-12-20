#!/bin/bash

converte_imagem(){

    local caminho_imagem=$1
    local imagem_sem_extensao=$(ls $caminho_imagem | awk -F. '{ print $1 }')
    convert $imagem_sem_extensao.jpg $imagem_sem_extensao.png
}

varrer_diretorio(){
    
    cd $1
    #Varrendo todo diretorio
    for arquivo in *
    do 
        local caminho_arquivo=$(find ~/bash-script/imagens-novos-livros -name $arquivo)
        #Verificando se é um diretorio
        if [ -d $caminho_arquivo ]
        then
            #Entrar no diretorio e fazer a varredura do conteudo
        varrer_diretorio $caminho_arquivo
        else
            #Conversao jpg para png
            converte_imagem $caminho_arquivo
        fi
    done
}

varrer_diretorio ~/bash-script/imagens-novos-livros
if [ $? -eq 0 ]
then
    echo "Conversão realizada com sucesso"
else
    echo "Houve um problema na conversão"
fi
