components=(
compute-artifactory.amd.com:5000/rocm-plus-docker/framework/release-public:rocm5.4_centos7.5.1804_py3.8_pytorch_rocm5.4_internal_testing
compute-artifactory.amd.com:5000/rocm-plus-docker/framework/release-public:rocm5.4_ubuntu20.04_py3.8_pytorch_rocm5.4_internal_testing
compute-artifactory.amd.com:5000/rocm-plus-docker/framework/release-public:rocm5.4_ubuntu20.04_py3.8_pytorch_release-1.12
compute-artifactory.amd.com:5000/rocm-plus-docker/framework/release-public:rocm5.4_ubuntu20.04_py3.8_pytorch_release-1.11
compute-artifactory.amd.com:5000/rocm-plus-docker/framework/release-public:rocm5.4_ubuntu20.04_py3.8_pytorch_release-1.10
compute-artifactory.amd.com:5000/rocm-plus-docker/framework/release-public:rocm5.4_ubuntu20.04_py3.7_pytorch_release-1.12
compute-artifactory.amd.com:5000/rocm-plus-docker/framework/release-public:rocm5.4_ubuntu20.04_py3_tensorflow_release-r2.8-rocm-enhanced_horovod
compute-artifactory.amd.com:5000/rocm-plus-docker/framework/release-public:rocm5.4_ubuntu20.04_py3_tensorflow_release-r2.9-rocm-enhanced_horovod
compute-artifactory.amd.com:5000/rocm-plus-docker/framework/release-public:rocm5.4_ubuntu20.04_py3_tensorflow_release-r2.10-rocm-enhanced_horovod
)


for img in "${components[@]}"
do
    echo "Pulling $img"
    time docker pull "$img" &
done
