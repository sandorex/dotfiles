#!/bin/sh
#
# (https://github.com/sandorex/dotfiles)
# generate-extension-list.sh - reads extensions installed in firefox profile
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

OUT_FILE=extensions.list

# addons.json contains extensions while extensions.json contains
# extensions, themes, and builtins
EXTENSIONS_FILE=addons.json

# TODO read default profile in the profiles.ini

if [ -z "$1" ]; then
   echo "Please provide a path to the profile"
   exit 1
fi

# add header
cat << EOF > "$OUT_FILE"
# GENERATED: $(date +"%Y-%0m-%0d_%0H-%0M-%0S")
# RUN '$0 <PROFILE>' TO UPDATE THE LIST

EOF

# write extensions
cat "$1/$EXTENSIONS_FILE" |
python -c 'import json, sys
for x in json.load(sys.stdin)["addons"]:
   print(x["name"])
   print(x["reviewURL"][:-len("reviews/")])
   print()' >> "$OUT_FILE"

