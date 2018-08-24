#!/bin/bash
set -eu
mkdir -p ~/.gnupg
brew install \
    cmake \
    coreutils \
    gpg \
    macvim \
    pass \
    pwgen
vim +PluginInstall +qall
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
