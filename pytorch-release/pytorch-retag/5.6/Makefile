IMG_FL := list.conf
IMGS := $(shell cat ${IMG_FL})

#$(info ${IMGS})
.PHONY: all build clean

define make_rule =
$1:
	@echo Pulling $1
endef

$(eval $(foreach img,$(strip ${IMGS}),$(call make_rule,${img})))
#$(IMGS):
#	@echo "Pulling image $@"

pull: $(IMGS)
	:
all:
