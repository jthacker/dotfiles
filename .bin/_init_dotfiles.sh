#!/bin/bash
set -eu
mkdir -p ~/.gnupg
brew install \
    bash \
    bash-completion@2 \
    cmake \
    coreutils \
    gpg \
    macvim \
    pass \
    pwgen
echo /usr/local/bin/bash | sudo tee -a /etc/shells
chsh -s /usr/local/bin/bash
vim +PluginInstall +qall
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
git config --global core.excludesfile ~/.gitignore_global
