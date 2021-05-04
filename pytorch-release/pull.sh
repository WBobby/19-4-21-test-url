components=(
compute-artifactory.amd.com:5000/rocm-plus-docker/framework/compute-rocm-rel-4.2:21_centos7.5.1804_py3.6_caffe2_rocm4.2_internal_testing_30a6f3d_152
compute-artifactory.amd.com:5000/rocm-plus-docker/framework/compute-rocm-rel-4.2:21_ubuntu18.04_py3.6_caffe2_rocm4.2_internal_testing_30a6f3d_152
compute-artifactory.amd.com:5000/rocm-plus-docker/framework/compute-rocm-rel-4.2:21_centos7.5.1804_py3.6_pytorch_rocm4.2_internal_testing_30a6f3d_152
compute-artifactory.amd.com:5000/rocm-plus-docker/framework/compute-rocm-rel-4.2:21_ubuntu18.04_py3.6_pytorch_rocm4.2_internal_testing_30a6f3d_152
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
