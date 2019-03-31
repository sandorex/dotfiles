# dotfiles installer

# directory used to track installed packages
INSTALLED_DIR	?= ./.installed

# directories to look for configurations
OTHER_DIRS		?= ./other ./manual

define FIND_FLAGS
-maxdepth 1 												\
-type d 														\
! -path . 													\
! -path "./.*" 											\
$(foreach dir,$(OTHER_DIRS),! -path "$(dir)") 	\
-exec basename {} \;
endef

define find
$(shell find -L $1 $(FIND_FLAGS))
endef
export find

define mark_installed
@[ ! -d $(INSTALLED_DIR) ] && mkdir -p $(INSTALLED_DIR)

@[ -e "$(INSTALLED_DIR)/$(notdir $1)" ] && { \
	[ ! -L "$(INSTALLED_DIR)/$(notdir $1)" ] && { \
		echo "invalid link '$(notdir $1)'"; \
		exit 1; \
	} || { \
		echo "'$(notdir $1)' is already installed"; \
		exit 1; \
	} \
}

@echo "marking '$(notdir $1)' as installed";
ln -s $1 $(INSTALLED_DIR)/;
endef

define is_installed
$(shell [[ -e "$(INSTALLED_DIR)/$1" && -L "$(INSTALLED_DIR)/$1" ]] && printf 1)
endef

BASIC := $(call find,.)
OTHER :=
$(foreach dir,$(OTHER_DIRS),$(eval OTHER_$(notdir $(dir)) = $(call find,$(dir))) $(eval OTHER += $(OTHER_$(notdir $(dir)))))

.PHONY: $(BASIC)
$(BASIC): % :
	@echo "stowing basic $@"
	@echo "$(OTHER)"

.PHONY: info
info:
	@echo -e "$(BASIC)\n"

	@$(foreach dir,$(OTHER_DIRS),echo -e "$(dir):\n   $(OTHER_$(notdir $(dir)))\n";)

.PHONY: uninstall
uninstall:
	@$(foreach cfg,$(wildcard $(INSTALLED_DIR)/*),\
		[[ -e "$(cfg)" && -L "$(cfg)" ]] && {
			[[ "$(readlink -f '$(cfg)')" ]]
		} || {
			echo "file is not a link '$(notdir $(cfg))'"
			exit 1
		}
		echo "$(cfg)";\
	)
