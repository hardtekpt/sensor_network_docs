#!/bin/bash 

PROJECT=sensor_network

PACKETS=( node gateway_serial)
PACKETS_NAME=( Node Gateway )
length=${#PACKETS[@]}

for (( j=0; j<length; j++ ));
do
    cd /$PROJECT/${PACKETS[$j]}/docs

    BASE_URL=/${PACKETS_NAME[$j]}/
    rm -r * 
    # fix
    doxygen ../../docs/Doxyfile

    doxybook2 --input xml \
              --output . \
              --config ../../docs/doxybook_conf.json \
              --config-data '{"baseUrl": "'$BASE_URL'"}'
    #echo /$PROJECT/$i/docs
done




#mkdocs

#touch teste


