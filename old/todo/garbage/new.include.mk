TEMP_DIR		:= $(realpath ./.temp)
SUDO			:= sudo

define backup
	@echo "saving $1 as $(TEMP_DIR)/$(notdir $1)"
	$2 cp -r "$1" "$(TEMP_DIR)/$(notdir $1)"
endef

define restore
	@echo "restoring $(TEMP_DIR)/$(notdir $1) as $1"
	$2 cp -r "$(TEMP_DIR)/$(notdir $1)" "$1"
endef

define install
	@echo "installing $1 as $2"
	@mkdir -p "$2"
	cp -r "$1" "$2"
endef

