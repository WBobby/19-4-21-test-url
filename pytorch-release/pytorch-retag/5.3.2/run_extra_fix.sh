#!/bin/bash


IMAGE_LIST=($(grep -v -e '^$' -e '^#' list.conf))
CMD="sed -i 's/ubuntu/focal/' /etc/apt/sources.list.d/rocm.list"


for img in "${IMAGE_LIST[@]}"; do
    __docker_container_id=$(docker run -d $img bash -c "${CMD}")
    docker container inspect "${__docker_container_id}" | grep ExitCode
    docker commit ${__docker_container_id} ${img}_$(date '+%m-%d')
    echo "${__docker_container_id} is committed to:"
    echo "${img}_$(date '+%m-%d')"
    docker container rm ${__docker_container_id}
    echo "container ${__docker_container_id} is removed"
done

