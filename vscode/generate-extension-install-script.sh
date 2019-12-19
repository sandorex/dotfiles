#!/bin/sh
#
# (https://github.com/sandorex/dotfiles)
# generate-extension-install-script.sh - generates extension installation script
#
# Copyright 2019 Aleksandar Radivojevic
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# 	 http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

OUT_FILE=install-extensions.sh

if [ -z "$1" ]; then
   echo "please provide path to vscode (name also works if the executable is in the \$PATH)"
   exit 1
fi

# add header
cat << EOF > "$OUT_FILE"
#!/bin/sh
#
# GENERATED: $(date +"%Y-%0m-%0d_%0H-%0M")
# RUN '$0' TO UPDATE THE SCRIPT
EOF

# add logic
cat << 'EOF' >> "$OUT_FILE"

if [ -z "$1" ]; then
   echo "please provide path to vscode (name also works if the executable is in the \$PATH)"
   exit 1
fi

EOF

# append actualy extensions
"$1" --list-extensions | xargs -L 1 echo \"\$1\" --install-extension >> "$OUT_FILE"
