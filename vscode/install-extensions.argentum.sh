#!/bin/sh
#
# GENERATED: 2020-02-05_18-47-46
# RUN '.\generate-install-script.py' TO UPDATE THE SCRIPT

EXE=${1:-code}

command -v "$EXE" > /dev/null
if [ $? -gt 0 ]; then
   echo
   echo "unable to find vscode executable '$EXE'"
   echo
   echo "Usage: $0 [<EXE_PATH>]"
   exit 1
fi

"$VSCODE" --install-extension bungcip.better-toml --install-extension christian-kohler.path-intellisense --install-extension CoenraadS.bracket-pair-colorizer --install-extension DotJoshJohnson.xml --install-extension dracula-theme.theme-dracula --install-extension EditorConfig.EditorConfig --install-extension emilast.LogFileHighlighter --install-extension fabiospampinato.vscode-highlight --install-extension firefox-devtools.vscode-firefox-debug --install-extension helixquar.asciidecorator --install-extension jeff-hykin.polacode-2019 --install-extension ms-python.python --install-extension ms-vscode-remote.remote-wsl --install-extension ms-vscode.cmake-tools --install-extension ms-vscode.cpptools --install-extension ms-vscode.Go --install-extension ritwickdey.LiveServer --install-extension runarsf.platform-settings --install-extension rust-lang.rust --install-extension slevesque.vscode-autohotkey --install-extension twxs.cmake --install-extension vscode-snippet.snippet --install-extension xoronic.pestfile
