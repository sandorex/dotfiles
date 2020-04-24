#!/usr/bin/env python3
#
# (https://github.com/sandorex/dotfiles)
# generate-extension-list.py - reads extensions installed in firefox profile
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

# file output
FILE_OUT = 'extensions.txt'

# schema version that is read
# used to warn the user if different schema is used
SCHEMA_TARGET = 31

## -- END OF CONFIGURATION -- ##

import json, sys, os, configparser, datetime

from os.path import (join as path_join, normpath as path_normalize, expandvars
                     as path_expand)

HEADER = """# GENERATED: {time}
# RUN '{file}' TO UPDATE THE SCRIPT

"""

# file that contains extension names
EXTENSIONS_FILE = 'extensions.json'


def get_schema_version(data):
   return data['schemaVersion']


def get_extensions(data):
   extensions = []

   for extension in data['addons']:
      # skip themes and such
      if extension["type"] != "extension":
         continue

      # skip builtin extensions
      if extension["location"] != "app-profile":
         continue

      extensions.append((extension["defaultLocale"]["name"].strip(),
                         extension["defaultLocale"]["description"].strip()))

   return extensions


profile_path = sys.argv[1] if len(sys.argv) > 1 else None

if profile_path is None:
   print('please enter the path to the profile')
   sys.exit(1)

profile_path = path_normalize(profile_path)

if not os.path.exists(profile_path):
   print(f"error path does not exist '{profile_path}'")
   sys.exit(1)

if not os.path.isdir(profile_path):
   print(f"error path is not a directory '{profile_path}'")
   sys.exit(1)

with open(path_join(profile_path, EXTENSIONS_FILE), encoding='utf8') as f:
   data = json.load(f)

schema_version = get_schema_version(data)
if SCHEMA_TARGET != schema_version:
   print('error schema version is different {} != {}'.format(
       SCHEMA_TARGET, schema_version))
   sys.exit(1)

extensions = get_extensions(data)
with open(FILE_OUT, 'w') as f:
   f.write(
       HEADER.format(
           file=__file__,
           time=datetime.datetime.now().strftime(r'%Y-%m-%d_%H-%M-%S')))

   for name, desc in extensions:
      f.write(name)
      f.write('\n')
      f.write(desc)
      f.write('\n\n')
