# dotfiles installer

define find_packages
$(filter-out $1,$(patsubst %/,%,$(dir $(wildcard $1/*/$2))))
endef

SHELL := /bin/bash

INSTALLED_PATH := ./.installed
OTHER_PATH 	:= other
MANUAL_PATH := manual

PACKAGES 			:= $(filter-out $(OTHER_PATH) $(MANUAL_PATH) ./,$(patsubst ./%/,%,$(dir $(wildcard ./*/))))
PACKAGES_OTHER 	:= $(call find_packages,$(OTHER_PATH),Makefile)
PACKAGES_MANUAL 	:= $(call find_packages,$(MANUAL_PATH),README.md)

# all: bin bash fish nvim micro

all:
	@echo "$(PACKAGES)"
	@echo "$(PACKAGES_OTHER)"
	@echo "$(PACKAGES_MANUAL)"

.PHONY: $(PACKAGES)
$(PACKAGES): % :
	stow "$@"
	@ln -s "../$@" "$(INSTALLED_PATH)/$(notdir $@)"

.PHONY: $(PACKAGES_MANUAL)
$(PACKAGES_MANUAL): % :
ifndef SKIP_MANUAL
	@cat "$@/README.md"
endif

.PHONY: $(PACKAGES_OTHER)
$(PACKAGES_OTHER): % :
	$(MAKE) -C "$@"
	@ln -s "../$@" "$(INSTALLED_PATH)/$(notdir $@)"

.PHONY: uninstall
uninstall:
	@{ \
		for pkg in $(INSTALLED_PATH)/*; do \
			if [[ -L "$$pkg" ]]; then \
				if [[ ! "$$(readlink -f $$pkg)" =~ $$PWD/* ]]; then \
					echo "foreign package '$$pkg'"; \
					exit 1; \
				elif [[ -e "$$pkg" ]]; then \
					echo "removing package '$$(readlink -f $$pkg)'"; \
				else \
					echo "broken link '$$pkg'"; \
					exit 1; \
				fi \
			elif [[ -d "$$pkg" ]]; then \
				for innerPkg in $$pkg/*; do \
					if [[ -L "$$pkg" ]]; then \
						if [[ ! "$$(readlink -f $$pkg)" =~ $$PWD/* ]]; then \
							echo "foreign package '$$pkg'"; \
							exit 1; \
						elif [[ -e "$$pkg" ]]; then \
							echo "removing package '$$(readlink -f $$pkg)'"; \
						else \
							echo "broken link '$$pkg'"; \
							exit 1; \
						fi \
					else \
						echo "foreign file '$$pkg'"; \
						exit 1;
					fi \
				done \
			fi \
		done \
	}

# @{
# 	for pkg in $(INSTALLED_PATH)/*; do
# 		if [ -L "$$pkg" ]; then
# 			if [ ! -e "$$pkg"]; then \
# 				echo "broken link '$$pkg'" \
# 			else if [[ "$$(readlink -f \"$$pkg\")" =~ $$PWD/* ]]; then \
# 				echo "removing '$$pkg'" \
# 			else \
# 				echo "foreign package '$$pkg'"; \
# 			fi \
# 		else if [ -d "$$pkg" ]; then
# 			for innerPkg in $$pkg/*; do
# 				echo "$$innerPkg"
# 			done;
# 		fi
# 	done;
# }
