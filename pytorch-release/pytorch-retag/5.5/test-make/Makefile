IMG_FL := list.conf
IMGS := $(shell cat ${IMG_FL})


#$(info ${IMGS})
.PHONY: all build clean

define pull
for img in ${IMGS}; do echo "${img}"; done
endef

pull_docker:
	$(call pull)
#
all:
