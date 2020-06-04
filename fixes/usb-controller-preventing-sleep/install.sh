#!/bin/sh
if [ "$(id -u)" != "0" ]; then
    exec sudo -E "$0" "$@"
fi

cp ./suspend-fix.service ./resume-fix.service /etc/systemd/system/
systemctl enable suspend-fix.service resume-fix.service

echo "Done!"
