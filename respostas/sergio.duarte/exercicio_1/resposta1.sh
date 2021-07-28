#!/bin/bash
# Sergio de Sousa Duarte - 117110814
# exercicio_1

# Copio o arquivo .txt.gz em /questoes para a pasta local e depois descompacto
cp ../../../questoes/exercicio_1/jan_95.txt.gz ./

gunzip jan_95.txt.gz

cat jan_95.txt | grep '[local][remote]' > saida.txt

qtLocal=`grep -wc local saida.txt`
qtRemoto=`grep -wc remote saida.txt`

echo qtLocal $qtLocal
echo qtRemoto $qtRemoto
rm ./saida.txt


