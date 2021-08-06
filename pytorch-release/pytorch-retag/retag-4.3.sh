#!/bin/bash

docker tag compute-artifactory.amd.com:5000/rocm-plus-docker/framework/release-public:rocm4.3_centos7.5.1804_py3.6_pytorch_64 rocm/pytorch:rocm4.3_centos7_py3.6_pytorch
docker tag compute-artifactory.amd.com:5000/rocm-plus-docker/framework/release-public:rocm4.3_ubuntu18.04_py3.6_pytorch_64 rocm/pytorch:rocm4.3_ubuntu18.04_py3.6_pytorch
docker tag compute-artifactory.amd.com:5000/rocm-plus-docker/framework/release-public:rocm4.3_ubuntu18.04_py3.6_pytorch_1.7.0_32 rocm/pytorch:rocm4.3_ubuntu18.04_py3.6_pytorch_1.7.0
docker tag compute-artifactory.amd.com:5000/rocm-plus-docker/framework/release-public:rocm4.3_ubuntu18.04_py3.6_pytorch_1.8.1_34 rocm/pytorch:rocm4.3_ubuntu18.04_py3.6_pytorch_1.8.1
docker tag compute-artifactory.amd.com:5000/rocm-plus-docker/framework/release-public:rocm4.3_ubuntu18.04_py3.6_pytorch_1.9.0_15 rocm/pytorch:rocm4.3_ubuntu18.04_py3.6_pytorch_1.9.0

docker tag rocm/pytorch:rocm4.3_ubuntu18.04_py3.6_pytorch rocm/pytorch:latest
