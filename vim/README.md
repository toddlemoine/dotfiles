# vim dotfiles

Just what I use for my vim configuration. All of the .vim stuff is taken from 
Oliver Caldwell's [ invaluable post on the subject ](http://oli.me.uk/2015/06/17/wrangling-javascript-with-vim/)
and his own dotfiles repo.

## Installation

From the `vim` folder here:

```
cp vimrc ~/.vimrc
```

## Vim Plugins

```sh
mkdir -p ~/.vim/autoload ~/.vim/backup ~/.vim/bundle
cd ~/.vim/bundle

git clone https://github.com/tpope/vim-pathogen.git
git clone https://github.com/w0rp/ale.git
git clone https://github.com/junegunn/fzf.vim
git clone https://github.com/jremmen/vim-ripgrep.git
git clone https://github.com/Raimondi/delimitMate
git clone https://github.com/guns/vim-sexp
git clone https://github.com/mxw/vim-jsx
git clone https://github.com/pangloss/vim-javascript
git clone https://github.com/tpope/vim-commentary
git clone https://github.com/tpope/vim-dispatch
git clone https://github.com/tpope/vim-repeat
git clone https://github.com/tpope/vim-sensible
git clone https://github.com/tpope/vim-sexp-mappings-for-regular-people
git clone https://github.com/tpope/vim-surround
git clone https://github.com/tpope/vim-vinegar
git clone https://github.com/vim-airline/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes
git clone https://github.com/vim-scripts/SyntaxComplete
git clone https://github.com/mhartington/oceanic-next
git clone https://github.com/airblade/vim-gitgutter
git clone https://github.com/scrooloose/nerdtree
git clone https://github.com/bkad/CamelCaseMotion

cp ~/.vim/bundle/vim-pathogen/autoload/pathogen.vim ~/.vim/autoload
```
