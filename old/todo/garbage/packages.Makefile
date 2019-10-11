INSTALL		?= pikaur -S --needed
UNINSTALL	?= pikaur -Runs

PACKAGES		:= ./packages.txt ./aur-packages.txt

.PHONY: install
install:
	$(INSTALL) $(shell cat $(PACKAGES) | tr '\n' ' ')

.PHONY: uninstall
uninstall:
	$(UNINSTALL) $(shell cat $(PACKAGES) | tr '\n' ' ')
