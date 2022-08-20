# Dockerfile from 
# https://github.com/ROCmSoftwarePlatform/rocAutomation/blob/jenkins-pipelines/pytorch/manylinux_rocm_wheels/Dockerfiles/Dockerfile.ubuntu20.04_py3.x_pip3.x 

PYTHON_VERSION?=3.9



py${PYTHON_VERSION}: 
	docker build \
		--no-cache \
		--build-arg PYTHON_VERSION=${PYTHON_VERSION} \
		-t ub20-py${PYTHON_VERSION}-test .

# py3.8:
#	docker build \
#		--no-cached \
#		--build-arg PYTHON_VERSION=${PYTHON_VERSION?} \
#		-t ub20-py${PYTHON_VERSION}-test .


