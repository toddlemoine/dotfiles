# dotfiles

Dotfiles that follow me from system to system. 

## git Setup

1. cp git/gitconfig ~/.gitconfig
2. cp git/gitignore_global ~/.gitignore_global
3. git config --global core.excludesfile '~/.gitignore_global'

## Vim Setup

1. cp vimrc ~/.vimrc
2. vim and then execute `PlugInstall`
3. Edit the Highlighting.vim file and change 3a3a3a to #3a3a3a
