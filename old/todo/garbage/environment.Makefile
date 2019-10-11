.PHONY: newer
newer:
	@[ ./environment -nt /etc/environment ] || exit 1

.PHONY: install
install:
	@[ -f /etc/environment ] && { \
		echo "saving old /etc/environment as $(shell realpath ../../.temp/environment)"; \
		sudo cp /etc/environment /etc/environment.bak; \
	}

	sudo cp ./environment /etc/environment

.PHONY: uninstall
uninstall:
	@[ -f /etc/environment.bak ] && { \
		echo "reusing /etc/environment.bak"; \
		sudo cp /etc/environment.bak /etc/environment; \
	}

