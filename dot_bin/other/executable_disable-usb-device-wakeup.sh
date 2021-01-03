#!/bin/bash

if [ "$(id -u)" != "0" ]; then
	exec sudo "$0" "$@"
fi

# simple check for vendor id argument
if [ -z "$1" ]; then
	echo "Please provide vendor and product id as arguments"
	echo -e "\t$0 XXXX:YYYY"
	echo -e "\t$0 XXXX YYYY"
	echo "(where X is vendor id and Y is product id)"
	echo
	exit 1
fi

# get the product id
if [ -n "$2" ]; then
	PRODUCT_ID="$2"
else
	# hacky but works :D
	exec "$0" $(echo "$1" | tr ':' ' ')
fi

VENDOR_ID="$1"

for i in /sys/bus/usb/devices/*; do
    if [ ! -f "$i"/idProduct ] || [ ! -f "$i"/idVendor ]; then
		continue
    fi

	if [ "$(cat "$i"/idVendor)" == "$VENDOR_ID" ] && [ "$(cat "$i"/idProduct)" == "$PRODUCT_ID" ]; then
		if [ "$(cat "$i"/power/wakeup)" != "disabled" ]; then
			echo "Disabled wakeup by '$i'"
			echo 'disabled' > "$i"/power/wakeup
		else
			echo "Wakeup by '$i' already disabled"
		fi

		exit 0
	fi
done

echo "Cannot find the device '${VENDOR_ID}:${PRODUCT_ID}'"
exit 1

