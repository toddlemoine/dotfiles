# dotfiles

Dotfiles that follow me from system to system.

## App setup

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew install neovim git nvm postgres diff-so-fancy zsh fzf ripgrep yarn python ruby elixir
brew cask install font-fira-code docker slack

# Start postgres
brew services start postgres
```

## git Setup

```
cp git/gitconfig ~/.gitconfig
cp git/gitignore_global ~/.gitignore_global
git config --global core.excludesfile '~/.gitignore_global'
```

## Vim Setup

```
cp vimrc ~/.vimrc
vim and then execute `PlugInstall`
# Edit the Highlighting.vim file and change 3a3a3a to #3a3a3a
```

## Neovim Setup

```sh
cp vimrc ~/.config/nvim/init.vim
# cd ~/.config/nvim/bundle
while read plugin; do git clone $plugin ~/.config/nvim/bundle; done < vimplugins.txt
```
