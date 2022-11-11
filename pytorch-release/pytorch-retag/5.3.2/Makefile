SHELL = /bin/bash

DOCKER_IMGS = $(shell cat docker.env)

#CMD_RUN = "sed -i 's/ubuntu/focal/' /etc/apt/sources.list.d/rocm.list"

CMD_RUN = "cd pytorch; git branch" 

# run to modify the docker container before tagging it
prefix_script: R_${DOCKER_IMGS}
	echo "run to fix docker before tagging"
	echo DOCKER_IMGS=$<

R_$(DOCKER_IMGS):

