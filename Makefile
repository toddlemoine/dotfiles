current_dir = $(shell pwd)
current_user = $(shell whoami)

default:
	@echo "Available tasks: home, homebrew, apps, cli, runtimes, gui, services, work, git, ssh, vim, xcode, download, code, shell, claude"
	@echo "current dir $(current_dir)"

home:
	mkdir ~/repos
	mkdir ~/projects
	mkdir ~/bin
	mkdir ~/prefs
	defaults write com.apple.screencapture location ~/Downloads

homebrew:
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

apps: cli runtimes gui
	@echo "Core setup complete. Run 'make services' to start local services. Run 'make work' for work-specific tools."

cli: FORCE
	brew install --formula ast-grep bat git-delta direnv eza fd fzf gh git glow lazygit neovim pure ripgrep rtk switchaudio-osx tldr uv yarn yq zsh

runtimes: FORCE
	brew install --formula nvm pyenv rbenv deno
	@echo "After install: nvm install --lts && nvm use --lts"
	@echo "Install Go: https://go.dev/dl/"
	@echo "Install Java via sdkman: curl -s https://get.sdkman.io | bash"

gui: FORCE
	brew install --cask docker slack jordanbaird-ice
	@echo "Manual downloads: see README for Bartender, CleanShot X, Rectangle, 1Password, etc."

services: FORCE
	@echo "Do nothing -- install via Docker"
	# brew install --formula postgresql redis
	# brew services start postgresql
	# brew services start redis

work: FORCE
	brew install --formula awscli gradle jira-cli k9s kafka kubernetes-cli

git: FORCE
	cp git/gitconfig ~/.gitconfig
	cp git/gitconfig-personal ~/.gitconfig-personal
	cp git/gitconfig-work ~/.gitconfig-work
	cp git/gitignore_global ~/.gitignore_global
	git config --global core.excludesfile '~/.gitignore_global'
	@echo "Edit .gitconfig-personal and .gitconfig-work and replace email address."
	@echo "Set up your ssh key if necessary with `make ssh`."

ssh:
	open https://github.com/settings/keys

shell:
	git clone git@github.com:rupa/z.git ~/repos/z 
	cp zsh/zshrc ~/.zshrc 

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
	@echo "CleanShot X:          https://cleanshot.com/"
	@echo "Clipy:                https://clipy-app.com/"
	@echo "Code:                 https://code.visualstudio.com/Download"
	@echo "Kap:                  https://getkap.co/"
	@echo "Kensington Trackball: https://www.kensington.com/software/kensingtonworks/"
	@echo "Quitter:              http://marco.org/appcasts/Quitter.zip"
	@echo "Rectangle:            https://rectangleapp.com/"
	@echo "Sourcetree:           https://www.sourcetreeapp.com/"

claude: FORCE
	@echo "Installing Claude Code..."
	npm install -g @anthropic-ai/claude-code
	@echo "Installing RTK (token optimizer)..."
	brew install rtk
	@echo "Copying Claude config..."
	mkdir -p ~/.claude/skills
	cp claude/CLAUDE.md ~/.claude/CLAUDE.md
	cp claude/RTK.md ~/.claude/RTK.md
	cp claude/settings.json ~/.claude/settings.json
	cp claude/settings.local.json ~/.claude/settings.local.json
	cp -r claude/skills/effect_ts ~/.claude/skills/
	cp -r claude/skills/grill-me ~/.claude/skills/
	cp -r claude/skills/improve-codebase-architecture ~/.claude/skills/
	cp -r claude/skills/tdd ~/.claude/skills/
	@echo "Done. Launch Claude Code and re-install plugins (caveman, atlassian, figma, etc.) on first run."

FORCE: ;
