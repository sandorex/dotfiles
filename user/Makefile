include ../include.mk

# find all
INSTALLED			:= $(call FIND,./*/$(INSTALL_FLAG_FILE))
INSTALLABLE			:= $(filter-out $(INSTALLED),$(call FIND,./*/))

# set target for stow
STOW_FLAGS 			+= --target="$(USER_HOME)"

# set default target
.DEFAULT_GOAL 		:= list-all

# include
-include ./*/$(MAKEFILE_INCLUDE_FILE)

# list targets, mostly for external scripts
.PHONY: list-installable
list-installable:
	@echo "$(INSTALLABLE)"

.PHONY: list-installed
list-installed:
	@echo "$(INSTALLED)"

.PHONY: list-all
list-all:
	@echo "$(sort $(INSTALLABLE) $(INSTALLED))"

# install
.PHONY: $(INSTALLABLE)
$(INSTALLABLE): % : $(INSTALL_TARGET_PREFIX)%
	@[ -f "./$@/Makefile" ] && { 						\
		echo "installing '$@'"; 						\
		$(MAKE) $(MAKE_FLAGS) -C "./$@" install	\
		&& touch "./$@/$(INSTALL_FLAG_FILE)";		\
	} || { 													\
		echo "stowing '$@'";								\
		stow $(STOW_FLAGS) $(STOW_FLAGS_$@) "$@" 	\
		&& touch "./$@/$(INSTALL_FLAG_FILE)";		\
	}

# reinstall
.PHONY: $(INSTALLED)
$(INSTALLED): % : $(REINSTALL_TARGET_PREFIX)%
	@[ -f "./$@/Makefile" ] && { 									\
		echo "reinstalling '$@'"; 									\
		$(MAKE) $(MAKE_FLAGS) -C "./$@" reinstall				\
		&& touch "./$@/$(INSTALL_FLAG_FILE)";					\
	} || { 																\
		echo "restowing '$@'";										\
		stow $(STOW_FLAGS) $(STOW_FLAGS_$@) --restow "$@"	\
		&& touch "./$@/$(INSTALL_FLAG_FILE)";					\
	}

# reinstall installed targets
.PHONY: reinstall
reinstall: $(INSTALLED)

# uninstall installed targets
.PHONY: uninstall
uninstall: $(addprefix $(UNINSTALL_TARGET_PREFIX),$(INSTALLED))
ifneq ($(addprefix $(UNINSTALL_TARGET_PREFIX),$(INSTALLED)),)
	@echo "done"
else
	@echo "nothing to uninstall"
endif

# uninstall installed target
.PHONY: $(addprefix $(UNINSTALL_TARGET_PREFIX),$(INSTALLED))
$(addprefix $(UNINSTALL_TARGET_PREFIX),$(INSTALLED)): $(UNINSTALL_TARGET_PREFIX)% :
	@[ -f "./$*/Makefile" ] && { 									\
		@echo "uninstalling '$*'";									\
		$(MAKE) $(MAKE_FLAGS) -C "./$*" uninstall				\
		&& rm -f "./$*/$(INSTALL_FLAG_FILE)";					\
	} || { 																\
		echo "unstowing '$*'";										\
		stow $(STOW_FLAGS) $(STOW_FLAGS_$@) --delete "$*"	\
		&& rm -f "./$*/$(INSTALL_FLAG_FILE)";					\
	}

# these allow adding dependencies while using stow
.PHONY: $(addprefix $(INSTALL_TARGET_PREFIX),$(INSTALLABLE))
$(addprefix $(INSTALL_TARGET_PREFIX),$(INSTALLABLE)): $(INSTALL_TARGET_PREFIX)% : ;

.PHONY: $(addprefix $(REINSTALL_TARGET_PREFIX),$(INSTALLED))
$(addprefix $(REINSTALL_TARGET_PREFIX),$(INSTALLED)): $(REINSTALL_TARGET_PREFIX)% : ;

