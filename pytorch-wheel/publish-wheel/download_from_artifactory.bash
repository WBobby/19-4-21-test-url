#!/bin/bash

set -x

if [ -z "${__DOWNLOAD_URL}" ]; then
    artifactory_url="http://compute-artifactory.amd.com/artifactory/compute-pytorch-rocm"
    job_name=${1:-'compute-rocm-rel-5.4'}
    build_id=${2:-96}
    file_type=${3:-whl}
    __DOWNLOAD_URL="${artifactory_url}/${job_name}/${build_id}"
else
    build_id=$(basename ${__DOWNLOAD_URL})
    job_name=$(basename $(dirname ${__DOWNLOAD_URL}))
    file_type=${1:-whl}
fi

echo "__DOWNLOAD_URL=${__DOWNLOAD_URL}"
work_space=${job_name}-${build_id}
echo "work_space=${work_space}"

download_from_artifactory(){
	echo "Start downloading ${file_type} files from the artifactory..."
	mkdir -p ${work_space} && cd ${work_space} 
	wget -r --level=1 -np -nd --reject="index.html*" $2
	echo "Finish downloading ${1} files..."
}

rm -rf ${work_space}

download_from_artifactory "${file_type}" "${__DOWNLOAD_URL}" "${work_space}"

