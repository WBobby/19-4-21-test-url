#!/bin/bash


IMAGE_LIST=($(grep -v -e '^$' -e '^#' list.conf))
D_RUN="docker pull"


for img in "${IMAGE_LIST[@]}"; do
    eval "${D_RUN} $img" 
done 

