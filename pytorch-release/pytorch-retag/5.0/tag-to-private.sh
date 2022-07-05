# retag docker images:
docker tag compute-artifactory.amd.com:5000/rocm-plus-docker/framework/release-public:rocm5.0_centos7.5.1804_py3.7_pytorch_94 \
    pytorch-private:rocm5.0_centos7_py3.7_pytorch_staging
docker tag compute-artifactory.amd.com:5000/rocm-plus-docker/framework/release-public:rocm5.0_ubuntu18.04_py3.7_pytorch_97 \
    pytorch-private:rocm5.0_ubuntu18.04_py3.7_pytorch_staging
# release/1.8_atomicAddNoReturn branch:
docker tag compute-artifactory.amd.com:5000/rocm-plus-docker/framework/release-public:rocm5.0_ubuntu18.04_py3.7_pytorch_33 \
    pytorch-private:rocm5.0_ubuntu18.04_py3.7_pytorch_1.8.1
# release/1.9_atomicAddNoReturn branch:
docker tag compute-artifactory.amd.com:5000/rocm-plus-docker/framework/release-public:rocm5.0_ubuntu18.04_py3.7_pytorch_34 \
    pytorch-private:rocm5.0_ubuntu18.04_py3.7_pytorch_1.9.0
#release/1.10 branch:
docker tag compute-artifactory.amd.com:5000/rocm-plus-docker/framework/release-public:rocm5.0_ubuntu18.04_py3.7_pytorch_35_base \
    pytorch-private:rocm5.0_ubuntu18.04_py3.7_pytorch_1.10.0_base
docker tag compute-artifactory.amd.com:5000/rocm-plus-docker/framework/release-public:rocm5.0_ubuntu18.04_py3.7_pytorch_35 \
    pytorch-private:rocm5.0_ubuntu18.04_py3.7_pytorch_1.10.0
