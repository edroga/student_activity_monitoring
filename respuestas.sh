# !/usr/bin/env bash
directorio=$1
outputs=$(for a in $(ls -d $directorio*); do python3 $a; done)
scripts=$(ls -l $directorio | tr -s ' ' , | cut -d "," -f 6,7,8,9 | sed "1d")
paste <(echo "$scripts") <(echo "$outputs") -d "," > Resultados.csv
sed  -i '1i month,day,hour,script,output' Resultados.csv