current_dir = $(shell pwd)
current_user = $(shell whoami)

default:
	@echo "Available tasks: home, homebrew, apps, services, git, ssh, vim, xcode, download, code"
	@echo "current dir $(current_dir)"

home:
	mkdir ~/repos
	mkdir ~/projects
	mkdir ~/bin
	mkdir ~/prefs

homebrew:
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

apps:
	brew install neovim git gh nvm postgres diff-so-fancy zsh fzf ripgrep yarn python ruby elixir pure
	brew cask install font-fira-code docker slack

services:
	brew services start postgres

git:
	cp git/gitconfig ~/.gitconfig
	cp git/gitconfig-personal ~/.gitconfig-personal
	cp git/gitconfig-work ~/.gitconfig-work
	cp git/gitignore_global ~/.gitignore_global
	git config --global core.excludesfile '~/.gitignore_global'
	@echo "Edit .gitconfig-personal and .gitconfig-work and replace email address."
	@echo "Set up your ssh key if necessary with `make ssh`."

ssh:
	open https://github.com/settings/keys

vim: FORCE
	cd ~/.config/nvim/bundle && while read plugin; do git clone git@github.com:$$plugin; done < $(current_dir)/nvim/plugins.txt
	cp nvim/init.vim ~/.config/nvim/init.vim
	@echo "Edit the Highlighting.vim file and change 3a3a3a to #3a3a3a."

code: FORCE
	cp vscode/settings.json /Users/$(current_user)/Library/Application\ Support/Code/User
	xargs -n1 code --install-extension < $(current_dir)/vscode/extensions.md

xcode:
	xcode-select --install
	@echo "Confirming install was successful..."
	xcode-select -p 

download:
	@echo "1Password:            https://1password.com/downloads/mac/"
	@echo "Clipy:                https://clipy-app.com/"
	@echo "Code:                 https://code.visualstudio.com/Download"
	@echo "Sourcetree:           https://www.sourcetreeapp.com/"
	@echo "Rectangle:            https://rectangleapp.com/"
	@echo "Quitter:              http://marco.org/appcasts/Quitter.zip"
	@echo "Bartender:            https://www.macbartender.com/"
	@echo "Kensington Trackball: https://www.kensington.com/software/kensingtonworks/"
	@echo "Kap:                  https://getkap.co/"

FORCE: ;
