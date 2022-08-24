#!/bin/bash 

PROJECT=sensor_network

PACKETS=( node gateway_serial)
PACKETS_NAME=( Node Gateway )
length=${#PACKETS[@]}

for (( j=0; j<length; j++ ));
do
    cd /$PROJECT/${PACKETS[$j]}
    mkdir docs
    cd docs

    BASE_URL=/${PACKETS_NAME[$j]}/
    #rm -r * 
    # fix
    doxygen ../../docs/Doxyfile

    echo "Generated xml and html documentation for '${PACKETS_NAME[$j]}'"

    doxybook2 --input xml \
              --output . \
              --config ../../docs/doxybook_conf.json \
              --config-data '{"baseUrl": "'$BASE_URL'"}'\
              -q

    echo "Generated markdown documentation for '${PACKETS_NAME[$j]}'"
done

cd /$PROJECT
git remote rm origin
git remote add origin https://hardtekpt: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@github.com/hardtekpt/sensor_network_docs.git
mkdocs gh-deploy -q

echo "Done !!"

rm -r site

for (( j=0; j<length; j++ ));
do
    cd /$PROJECT/${PACKETS[$j]}
    rm -r docs
done




