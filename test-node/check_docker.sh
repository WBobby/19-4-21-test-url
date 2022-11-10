#!/bin/bash

set -x

DOCKER_IMG=$1

sudo docker run \
	--rm -v $PWD:/root/whl \
	--shm-size 8G \
	--cap-add=SYS_PTRACE \
	--privileged  \
	--security-opt seccomp=unconfined \
	--network=host \
	--device=/dev/kfd \
	--device=/dev/dri \
	--group-add video \
	${DOCKER_IMG} \
	bash -xc \
	"if [ ! -d pytorch-micro-benchmarking ]; then git clone https://github.com/ROCmSoftwarePlatform/pytorch-micro-benchmarking.git; fi \
	&& cd pytorch-micro-benchmarking && python3 micro_benchmarking_pytorch.py --network resnet50"
echo "rtn=$?"
