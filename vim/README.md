# vim dotfiles

Just what I use for my vim configuration. All of the .vim stuff is taken from 
Oliver Caldwell's [ invaluable post on the subject ](http://oli.me.uk/2015/06/17/wrangling-javascript-with-vim/)
and his own dotfiles repo.

## Installation

From the `vim` folder here:

```
cp vimrc ~/.vimrc
cp -R dotvim ~/.vim

# From within vim, install all plugins with:
:PlugInstall
```

## Vim Plugins

```sh
vim ~/.vim/plugins.vim

# Add your plugin using this format:
Plug 'someone/someplugin'

# Save, reload vim, and do 
:PlugInstall
```
