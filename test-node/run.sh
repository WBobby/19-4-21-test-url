#!/bin/bash

set -x

JOB_NAME=$1
JOB_NUM=$2
ART_SERVER=${ART_SERVER:-'compute-artifactory.amd.com'}
ART_URL="http://${ART_SERVER}/artifactory/list/compute-pytorch-rocm/${JOB_NAME}/${JOB_NUM}/"
#TORCH_WHL_VER='1.10.1'
TORCH_WHL_VER=$3
#VISION_WHL_VER='0.11.2'
VISION_WHL_VER=$4
PY_VER=$5

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
	compute-artifactory.amd.com:5000/rocm-plus-docker/framework/release-public:ub20-py${PY_VER}-test \
	bash -xc \
	"apt update && pip3 install --upgrade pip && \
	pip3 install --verbose --use-deprecated=legacy-resolver torch==${TORCH_WHL_VER} torchvision==${VISION_WHL_VER} -f ${ART_URL} --trusted-host ${ART_SERVER} && \
	cd /root/whl || true; \
	if [ ! -d pytorch-micro-benchmarking ]; then git clone https://github.com/ROCmSoftwarePlatform/pytorch-micro-benchmarking.git; fi \
	&& cd pytorch-micro-benchmarking && python3 micro_benchmarking_pytorch.py --network resnet50"
echo "rtn=$?"
