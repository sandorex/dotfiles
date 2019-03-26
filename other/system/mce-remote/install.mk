mce-remote: bin mce-remote-override
mce-remote-override:
	@echo "enabling lircd service"
	@echo ">systemctl enable lircd.service"

	@echo "enabling irexec user service (TODO)"
	@echo ">systemctl enable --user $(SYSTEM_PATH)/mce-remote/irexec-user.service"
