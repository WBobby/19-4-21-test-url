#!/bin/bash


IMAGE_LIST=($(grep -v -e '^$' -e '^#' list.conf))
D_RUN="docker pull"

for img in "${IMAGE_LIST[@]}"; do
    echo "=============================Pulling ${img}=============================="
    eval "${D_RUN} $img"
    echo "=============================Finish  ${img}=============================="
    echo -e "\n\n"
done

