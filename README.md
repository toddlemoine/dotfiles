# dotfiles

Bootstrap scripts for a new Mac.

## Quick Start

```
make homebrew    # install Homebrew
make xcode       # Xcode command line tools
make home        # create ~/repos, ~/projects, ~/bin, ~/prefs
make apps        # CLI tools + runtimes + GUI apps
make services    # start local services (postgres, redis)
make git         # copy git config
make shell       # copy zsh config
make code        # copy VS Code config
make claude      # install Claude Code + copy config
```

Work machines only:

```
make work        # jira-cli, k9s, awscli, kafka, gradle, kubectl
```

---

## CLI Tools (`make cli`)

| Tool | Description |
|------|-------------|
| ast-grep | Structural code search (grep, but AST-aware) |
| bat | `cat` with syntax highlighting |
| delta | Git diff pager with syntax highlighting |
| direnv | Auto-loads `.envrc` files per directory |
| eza | Modern `ls` replacement |
| fd | Fast file finder (replaces `find`) |
| fzf | Fuzzy finder |
| gh | GitHub CLI |
| git | Version control |
| glow | Render markdown in terminal |
| lazygit | Terminal UI for git |
| neovim | Text editor |
| pure | Minimal zsh prompt |
| ripgrep (rg) | Fast content search (replaces `grep`) |
| rtk | Token optimizer proxy for Claude Code |
| switchaudio-osx | Switch audio output from CLI |
| tldr | Simplified man pages |
| uv | Fast Python package manager (replaces pip/pipx) |
| yarn | Node package manager |
| yq | YAML query tool (same syntax as jq) |
| zsh | Shell |

## Runtimes (`make runtimes`)

| Tool | Description | Notes |
|------|-------------|-------|
| nvm | Node.js version manager | Run `nvm install --lts` after |
| pyenv | Python version manager | |
| rbenv | Ruby version manager | |
| deno | JS/TS runtime | |
| Go | Go runtime | Manual: https://go.dev/dl/ |
| Java | JDK | Via sdkman: https://sdkman.io/ |

## Services (`make services`)

| Service | Description |
|---------|-------------|
| PostgreSQL | Relational database |
| Redis | In-memory cache / message broker |

## Work Tools (`make work`)

| Tool | Description |
|------|-------------|
| awscli | AWS command line interface |
| gradle | Java/Kotlin build tool |
| jira-cli | Jira from the terminal |
| k9s | Kubernetes cluster UI |
| kafka | Message streaming platform |
| kubectl | Kubernetes CLI |

## GUI Apps (`make gui`)

Installed via Homebrew cask:

| App | Description |
|-----|-------------|
| Docker | Container runtime |
| Slack | Team communication |
| Ice | Menu bar manager (free) |

Manual downloads:

| App | URL |
|-----|-----|
| 1Password | https://1password.com/downloads/mac/ |
| Bartender | https://www.macbartender.com/ (paid menu bar manager) |
| CleanShot X | https://cleanshot.com/ (paid screenshot tool) |
| Kap | https://getkap.co/ |
| Kensington TrackBall | https://www.kensington.com/software/kensingtonworks/ |
| Quitter | http://marco.org/appcasts/Quitter.zip |
| Rectangle | https://rectangleapp.com/ |
| Sourcetree | https://www.sourcetreeapp.com/ |
