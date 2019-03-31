# make file that is included if it exists
MAKEFILE_INCLUDE_FILE		?= include.mk

# file that is made using 'touch' to mark directory as installed
INSTALL_FLAG_FILE 			?= .installed

# flags passed to make when there is a makefile
MAKE_FLAGS						?= --no-print-directory

# flags passed to stow
STOW_FLAGS						?= -v --ignore="\.mk$$" --ignore="\.md$$"

# disables modification to filesystem with exception of flag file
SIMULATION						:= true

ifdef SIMULATION
# add simulate flag to stow
STOW_FLAGS 						+= --simulate

# add prefix for include files
SIMULATION_TARGET_PREFIX 	:= sim.
endif

# if simulation prepend target prefix
# this allows custom makefiles to simulate changes too
INSTALL_TARGET_PREFIX 		:= $(SIMULATION_TARGET_PREFIX)install.
REINSTALL_TARGET_PREFIX 	:= $(SIMULATION_TARGET_PREFIX)reinstall.
UNINSTALL_TARGET_PREFIX 	:= $(SIMULATION_TARGET_PREFIX)uninstall.

ifdef SIMULATION
undefine SIMULATION_TARGET_PREFIX
endif

define FIND
$(patsubst ./%/,%,$(filter-out ./,$(dir $(wildcard $1))))
endef
export FIND

# if ran as root home path must be passed
# which is used as install target for stow
# when for configs that reside in home
ifeq ($(shell id -u -r),0)
ifndef USER_HOME
$(error user is not defined, please run 'make USER_HOME=/home/<USER>' as root)
endif
else
# it can also be set by user if wanted
USER_HOME		?= /home/$(USER)
endif

# rule that checks for root account
require_root:
	@[ $$EUID -eq 0 ] || { echo "root is required, please run 'sudo make USER_HOME=/home/$(USER)'"; exit 1; }
