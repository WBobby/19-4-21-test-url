docker tag \
	compute-artifactory.amd.com:5000/rocm-plus-docker/framework/release-public:rocm5.2_ubuntu20.04_py3.7_pytorch_rocm5.2_internal_testing \
	rocm/pytorch:rocm5.2_ubuntu20.04_py3.7_pytorch_staging

docker tag \
	compute-artifactory.amd.com:5000/rocm-plus-docker/framework/release-public:rocm5.2_ubuntu20.04_py3.7_pytorch_release-1.9_atomicAddNoReturn_41 \
	rocm/pytorch:rocm5.2_ubuntu20.04_py3.7_pytorch_1.9.0

docker tag \
	compute-artifactory.amd.com:5000/rocm-plus-docker/framework/release-public:rocm5.2_ubuntu20.04_py3.7_pytorch_release-1.10_42 \
	rocm/pytorch:rocm5.2_ubuntu20.04_py3.7_pytorch_1.10.0

docker tag \
	compute-artifactory.amd.com:5000/rocm-plus-docker/framework/release-public:rocm5.2_ubuntu20.04_py3.7_pytorch_release-1.11_43 \
	rocm/pytorch:rocm5.2_ubuntu20.04_py3.7_pytorch_1.11.0

docker tag \
	compute-artifactory.amd.com:5000/rocm-plus-docker/framework/release-public:rocm5.2_centos7.5.1804_py3.7_pytorch_rocm5.2_internal_testing \
	rocm/pytorch:rocm5.2_centos7_py3.7_pytorch_staging

# retag latest
docker tag rocm/pytorch:rocm5.2_ubuntu20.04_py3.7_pytorch_staging rocm/pytorch:latest

docker tag rocm/pytorch:rocm5.2_ubuntu20.04_py3.7_pytorch_1.11.0 rocm/pytorch:latest-release

# retag base
docker tag \
	compute-artifactory.amd.com:5000/rocm-plus-docker/framework/release-public:rocm5.2_ubuntu20.04_py3.7_pytorch_rocm5.2_internal_testing_base \
	rocm/pytorch:latest-base 

docker tag \
	compute-artifactory.amd.com:5000/rocm-plus-docker/framework/release-public:rocm5.2_ubuntu20.04_py3.7_pytorch_release-1.11_43_base \
	rocm/pytorch:rocm5.2_ubuntu20.04_py3.7_pytorch_1.11.0_base
