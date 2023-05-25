SHELL = /bin/bash

.PHONY: download

JOB_NAME?=compute-rocm-rel-5.5
JOB_NUM?=74

RADEON_SERV=10.255.8.5
RADEON_USR=rtgadmin

download:
	bash -x download_from_artifactory.bash ${JOB_NAME} ${JOB_NUM}

push:
	cd ${JOB_NAME}-${JOB_NUM} && \
	time rsync -aPz --delete * rtgadmin@10.255.8.5:~/bb/${JOB_NAME}-${JOB_NUM}/
