#!/usr/bin/env python3
#
# (https://github.com/sandorex/scripts)
# generate-batch-wrappers.py - creates batch wrappers for scripts
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

import os, sys, shutil, datetime

from pathlib import Path

if os.name != 'nt':
   print('this script was not meant to be ran on non-windows systems')
   sys.exit(1)

LANGUAGES = {}
def define_lang(extensions, shebang, script):
   for i in extensions:
      LANGUAGES[i] = script

   for i in shebang:
      LANGUAGES[i] = script

## CONFIGURATION ##
WARN_UNKNOWN_LANGUAGE = False
SCRIPTS_PATHS = [ '../shell' ]
GENERATED_PATH = '../generated/batch'

# how to run each supported language
define_lang([ '.sh'], [ 'sh' ], 'sh "{script_path}"')
define_lang([ ], [ 'bash' ], 'bash "{script_path}"')
define_lang([ '.py' ], [ 'python', 'python3' ], 'python "{script_path}"')
define_lang([ '.rb' ], [ 'ruby' ], 'ruby "{script_path}"')
## CONFIGURATION ##

# magic to use paths relative to the file itself
CWD = Path(__file__).parent.resolve()
GENERATED_PATH = Path(os.path.join(CWD, GENERATED_PATH)).resolve()
SCRIPTS_PATHS = [ Path(os.path.join(CWD, x)).resolve() for x in SCRIPTS_PATHS ]
DATE = datetime.datetime.now().strftime(r'%Y-%m-%d_%H-%M-%S')

def generate_wrapper(script_path):
   shebang = read_shebang(script_path)
   script_name = os.path.basename(script_path)
   wrapper_name, extension = os.path.splitext(script_name)

   template = LANGUAGES.get(shebang)

   if template is None:
      template = LANGUAGES.get(extension)

      if template is None:
         if WARN_UNKNOWN_LANGUAGE:
            print(f"language template has not been found for file '{script_path}' with shebang '{shebang}'")
         return

   wrapper_path = os.path.join(GENERATED_PATH, wrapper_name + '.cmd')

   if os.path.exists(wrapper_path):
      print(f"wrapper '{wrapper_name}' already exists at '{wrapper_path}', skipping..")
      return

   with open(wrapper_path, 'w') as file:
      file.write(f"""@echo off
rem
rem AUTOMATICALLY GENERATE BATCH WRAPPER
rem INPUT {script_path}
rem OUTPUT {wrapper_path}
rem GENERATED AT {DATE}
rem
""")
      file.write(template.format(**locals()))
      file.write('\n')

def read_shebang(filepath):
   # linux has shebang limit of 128 bytes
   SHEBANG_LIMIT = 128

   with open(filepath, 'r') as file:
      shebang = file.readline(SHEBANG_LIMIT + 1)

   if shebang.startswith('#!'):
      if len(shebang) > SHEBANG_LIMIT:
         print(f"shebang of file {filepath} exceeds limit of {SHEBANG_LIMIT} characters")
         return None

      # remove '#!'
      shebang = shebang[2:]

      # remove '/usr/bin/env' if it exists
      shebang = shebang.replace('/usr/bin/env', '').strip()

      # get basename ('sh' from '/bin/sh')
      shebang = os.path.basename(shebang)

      # in case of arguments get only things before whitespace
      if ' ' in shebang:
         shebang = shebang.split()[0]

      return shebang

   return None

def main():
   shutil.rmtree(GENERATED_PATH, ignore_errors = True)
   os.makedirs(GENERATED_PATH)

   for script_path in SCRIPTS_PATHS:
      for file in os.listdir(script_path):
         if not os.path.isdir(file):
            generate_wrapper(os.path.join(script_path, file))

   # generate wrapper for this script as well
   generate_wrapper(Path(__file__).resolve())

if __name__ == "__main__":
   main()
