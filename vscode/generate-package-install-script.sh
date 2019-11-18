#!/bin/sh

OUT_FILE=install-packages.sh

cat << EOF > "$OUT_FILE"
#!/bin/sh
#
# GENERATED: $(date +"%Y-%0m-%0d_%0H-%0M-%0S")
# RUN '$0' TO UPDATE THE SCRIPT
EOF

cat << 'EOF' >> "$OUT_FILE"

if [ -z "$1" ]; then
   echo "please provide path to vscode (name also works if the executable is in the \$PATH)"
   exit 1
fi

EOF

if [ -z "$1" ]; then
   echo "please provide path to vscode (name also works if the executable is in the \$PATH)"
   exit 1
fi

"$1" --list-extensions | xargs -L 1 echo \"\$1\" --install-extension >> "$OUT_FILE"
