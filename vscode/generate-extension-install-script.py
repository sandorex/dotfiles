#!/usr/bin/env python3
#
# (https://github.com/sandorex/dotfiles)
# generate-extension-install-script.py - generates extension installation script
#
# Copyright 2020 Aleksandar Radivojevic
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

OUTPUT_FILE = 'install-extensions.{hostname}.sh'

HEADER = """#!/bin/sh
#
# GENERATED: {time}
# RUN '{file}' TO UPDATE THE SCRIPT

EXE=${{1:-code}}

command -v "$EXE" > /dev/null
if [ $? -gt 0 ]; then
   echo
   echo "unable to find vscode executable '$EXE'"
   echo
   echo "Usage: $0 [<EXE_PATH>]"
   exit 1
fi
"""

import sys, os, subprocess, datetime, socket, shutil

def get_extensions(vscode):
   return subprocess.run([vscode, "--list-extensions"], stdout=subprocess.PIPE).stdout.decode('utf-8').splitlines()

def create_install_command(extensions):
   # should create long command like
   # "$VSCODE" --install-extension extension1 --install-extension extension2 ...
   return '"$VSCODE" --install-extension ' + ' --install-extension '.join(extensions)

name = sys.argv[1] if len(sys.argv) > 1 else 'code'
path = shutil.which(name)

if path is None:
   print(f"cannot find vscode executable with name '{name}'")
   sys.exit(1)

extensions = get_extensions(path)
output_file = OUTPUT_FILE.format(hostname=socket.gethostname().lower())

with open(output_file, 'w') as file:
   file.write(HEADER.format(file=__file__, time=datetime.datetime.now().strftime(r'%Y-%m-%d_%H-%M-%S')))
   file.write('\n')
   file.write(create_install_command(extensions))
   file.write('\n')

print(f"install script is saved as '{output_file}'")
