#!/usr/bin/env python3
#
# (https://github.com/sandorex/scripts)
# bootstrap.py - clones the dotfiles repository and sets it up
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

import os, sys, subprocess, importlib

## CONFIGURATION ##
TARGET_PATH = '$HOME/.dotfiles'
TARGET_PATH_WINDOWS = 'Config'

MAIN_REPOSITORY = 'git@github.com:sandorex/dotfiles.git'
REPOSITORIES = [ 'git@github.com:sandorex/scripts.git' ]
## CONFIGURATION ##

WINDOWS = bool(os.name == 'nt')

def clone(repo, path = None):
   args = [ 'git', 'clone', repo ]

   if path:
      args.append(path)

   if subprocess.run(args).returncode != 0:
      print(f"error while cloning '{repo}'", file = sys.stderr)
      sys.exit(1)

def setup():
   def run_module(filename):
      importlib.import_module(f'bootstrap.{filename}', 'bootstrap').main()

   # generate wrappers for windows
   if WINDOWS:
      run_module('generate-batch-wrappers')

   # run path setup
   run_module('path-setup')

# use different path for windows
if WINDOWS:
   TARGET_PATH = TARGET_PATH_WINDOWS

# use argument if supplied
if len(sys.argv) > 1 and sys.argv[1]:
   TARGET_PATH = sys.argv[1]

# ask for confirmation
answer = input(f"Config will be cloned to '{TARGET_PATH}', continue ? (Y/n): ")
if answer.lower() not in [ 'yes', 'y' ]:
   print('Cancelled')
   sys.exit(0)

clone(MAIN_REPOSITORY, TARGET_PATH)

cwd = os.getcwd()
os.chdir(TARGET_PATH)

for repo in REPOSITORIES:
   clone(repo)

setup()

os.chdir(cwd)
