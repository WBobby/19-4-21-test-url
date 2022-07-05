components=(
compute-artifactory.amd.com:5000/rocm-plus-docker/framework/release-public:rocm4.3.1_centos7.5.1804_py3.6_pytorch_83
compute-artifactory.amd.com:5000/rocm-plus-docker/framework/release-public:rocm4.3.1_ubuntu18.04_py3.6_pytorch_83
compute-artifactory.amd.com:5000/rocm-plus-docker/framework/release-public:rocm4.3.1_ubuntu18.04_py3.6_pytorch_41
compute-artifactory.amd.com:5000/rocm-plus-docker/framework/release-public:rocm4.3.1_ubuntu18.04_py3.6_pytorch_44
compute-artifactory.amd.com:5000/rocm-plus-docker/framework/release-public:rocm4.3.1_ubuntu18.04_py3.6_pytorch_24
)


#echo "${components[0]}"
#echo "${components[1]}"
#echo "${components[2]}"
#echo "${components[2]}"

for img in "${components[@]}"
do
    echo "$img"
    docker pull "$img"
done
