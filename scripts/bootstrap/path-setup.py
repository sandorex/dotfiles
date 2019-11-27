#!/usr/bin/env python3
#
# (https://github.com/sandorex/scripts)
# path-setup.py - currently only prints paths that need to be in PATH
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
import os

from pathlib import Path

## CONFIGURATION ##
WINDOWS_PATHS = [ '../powershell', '../batch', '../generated/batch' ]
LINUX_PATHS = [ '../shell' ]
## CONFIGURATION ##

# WINDOWS = bool(os.name == 'nt')
WINDOWS = False

CWD = Path(__file__).parent.resolve()

if WINDOWS:
   PATHS = [ Path(x).resolve() for x in WINDOWS_PATHS ]
else:
   PATHS = [ Path(x).resolve() for x in LINUX_PATHS ]

def main():
   if WINDOWS:
      print('Please add following paths to your path (ORDER IS IMPORTANT)')

      for path in PATHS:
         print(f"   '{path}'")
   else:
      print('Please add these to your shell rc file (ORDER IS IMPORTANT)\n')

      # TODO print path relative to home
      for path in PATHS:
         print(f"""export PATH=$PATH:\"{path}\"""")

if __name__ == "__main__":
   main()
