#!/bin/bash


IMAGE_LIST=($(grep -v -e '^$' -e '^#' list.conf))
D_RUN="docker run --rm "
CMD='python -c "import torch; print(torch.__version__)"'

VER_FILE=pytorch.ver
#echo "${IMAGE_LIST[*]}"

for img in "${IMAGE_LIST[@]}"; do
    eval "${D_RUN} $img $CMD"
done >"$VER_FILE"

