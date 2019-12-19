#!/bin/sh
#
# GENERATED: 2019-12-19_21-13-31
# RUN './generate-extension-install-script.sh' TO UPDATE THE SCRIPT

if [ -z "$1" ]; then
   echo "please provide path to vscode (name also works if the executable is in the \$PATH)"
   exit 1
fi

"$1" --install-extension christian-kohler.path-intellisense
"$1" --install-extension CoenraadS.bracket-pair-colorizer
"$1" --install-extension dracula-theme.theme-dracula
"$1" --install-extension emilast.LogFileHighlighter
"$1" --install-extension fabiospampinato.vscode-highlight
"$1" --install-extension firefox-devtools.vscode-firefox-debug
"$1" --install-extension jeff-hykin.polacode-2019
"$1" --install-extension ms-python.python
"$1" --install-extension ms-vscode-remote.remote-wsl
"$1" --install-extension ms-vscode.cmake-tools
"$1" --install-extension ms-vscode.cpptools
"$1" --install-extension ms-vscode.Go
"$1" --install-extension rust-lang.rust
"$1" --install-extension slevesque.vscode-autohotkey
"$1" --install-extension twxs.cmake
"$1" --install-extension vscode-snippet.snippet
