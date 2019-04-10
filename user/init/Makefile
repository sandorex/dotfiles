.PHONY: init
init:
	systemctl --user enable "$(CURDIR)/user-init.service"

.PHONY: uninstall.init
init.uninstall:
	systemctl --user disable user-init.service
