# dotfiles installer

# minimal config with only scripts and shell cfg
TERMINAL				:= bin init bash micro

# full config with everything that i really use
DEFAULT				:= $(TERMINAL) fish vscode emacs

# full config but with graphics configuration
DESKTOP				:= $(DEFAULT) mce-remote radeon compton

# paths where configs are contained
OTHER_PATH			:= ./other
SYSTEM_PATH			:=	$(OTHER_PATH)/system
USER_PATH			:= $(OTHER_PATH)/user

## -- DO NOT EDIT ANYTHING PAST THIS LINE -- ##
FIND_FLAGS			:= ! -path "./.git" ! -path "."
STOW_FLAGS			:= -v

EUID 					:= $(shell id -u -r)
LOCAL 				:= $(shell find . -maxdepth 1 -type d ${FIND_FLAGS} ! -path "${OTHER_PATH}" -exec basename {} \;)
USER 					:= $(shell find ${USER_PATH} -maxdepth 1 -type d ${FIND_FLAGS} -exec basename {} \;)
SYSTEM 				:= $(shell find ${SYSTEM_PATH} -maxdepth 1 -type d ${FIND_FLAGS} -exec basename {} \;)

.DEFAULT_GOAL 		:= configs

# TODO skip all hidden folders
# TODO RESTOW!!

# include makefiles
-include $(USER_PATH)/*/install.mk

ifeq ($(EUID),0)
-include $(SYSTEM_PATH)/*/install.mk
endif

.PHONY: $(LOCAL) $(USER) $(SYSTEM)

terminal: $(TERMINAL)
default: $(DEFAULT)
desktop: $(DESKTOP)

# normal stow
$(LOCAL): % :
	/usr/bin/stow $(STOW_FLAGS) $@
#@echo "symlinking '$@' using /usr/bin/stow"

# stow user config
$(USER): % :
	/usr/bin/stow $(STOW_FLAGS) --dir="$(USER_PATH)" --target="$(PWD)/.." $@
#@echo "user symlinking '$(basename $@)' using /usr/bin/stow"

# stow system config
$(SYSTEM): % :
ifeq ($(EUID),0)
	/usr/bin/stow $(STOW_FLAGS) --dir="$(SYSTEM_PATH)" --target="/" $@
	#@echo "system symlinking '$(basename $@)' using /usr/bin/stow"
else
	@echo "skipping '$(basename $@)', not root"
endif

.PHONY: configs install uninstall

# list available configs
configs:
	@echo -e "$(LOCAL)\n"

	@echo "user:"
	@echo -e "   $(USER)\n"

	@echo "system: (REQUIRES ROOT)"
	@echo -e "   $(SYSTEM)"

# install
install: $(TERMINAL)

# uninstall
uninstall:
	@echo "removing configs using stow"

	@echo "removing user configs using stow"

ifeq ($(EUID),0)
	@echo "removing system configs using stow"
endif
