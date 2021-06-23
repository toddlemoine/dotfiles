execute pathogen#infect()

" This option stops vim from behaving in a strongly vi -compatible way.
set nocompatible

" turn on syntax highlighting
syntax enable

" Disable concealing
set cole=0
au FileType * setl cole=0

" vim 7
set t_Co=256

" vim 8
set termguicolors

set background=dark
"
" let g:airline_theme='iceberg'
" colorscheme blueberry
"
let g:airline_theme='nord'
colorscheme nord
" colorscheme bluewery

" change cursor based on mode
if $TERM_PROGRAM =~ "iTerm"
  let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
  let &t_SR = "\<Esc>]50;CursorShape=2\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
  if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  endif
else
  " Use a blinking vertical bar cursor in insert mode, and a blinking block in normal
  if &term == 'xterm-256color' || &term == 'screen-256color'
    let &t_SI = "\<Esc>[5 q"
    let &t_EI = "\<Esc>[1 q"
  endif
endif

" Skinny guides
let g:indent_guides_guide_size = 1

" Avoid warnings about unable to undo
set undolevels=1000

" Auto reload buffers when file changes
set autoread

" if a given file type (perl, ruby, python, c, etc) has its own special auto-indentation rules, use them
filetype plugin indent on

" Set file encoding
set encoding=utf-8

" Use relative path completion, not current working dir
" :set autochdir

" clipboard 
set clipboard=unnamed

" Show line numbers
set number
set relativenumber

"  add a line / column display in the bottom right-hand section of the screen.
set ruler

" --- Whitespace stuff ---
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" backspace should delete over line breaks and such
set backspace=indent,eol,start

" Do not display whitespace (list/nolist)
set nolist

" --- Search related ---
set hlsearch   " highlight search matches
set incsearch  " enable incremental searching
set ignorecase " searching is not case sensitive
set smartcase  " When 'ignorecase' and 'smartcase' are both on, if a pattern contains an uppercase letter, it is case sensitive, otherwise, it is not.
set gdefault   " search globally by default

" --- command line completion ----
" Pressing Tab (repeatedly) will autocomplete in command mode
set wildmenu
set wildmode=list:longest,list:full
"do not autocomplete the following
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*,node_modules

" allow switching away from modified buffers. will keep the changes to the buffer without writing them to the file
set hidden

" Status bar - always show
set laststatus=2

" lightly highlight the current line on which the cursor is placed (turn this off if it gets annoying)
set cursorline

" lightly highlight the current column in which the cursor is placed (turn this off if it gets annoying)
" set cursorcolumn

" enable mouse support - sometimes handy
set mouse=a

" tell vim to scan the file for a modeline that contains in-line vim commands and options, just for that file
set modeline
set modelines=10

" Enable indent folding
set foldenable
set fdm=indent
set nofoldenable
set foldnestmax=10
set foldlevel=1

" Force vim to make backup copy and overwrite original
set backupcopy=yes

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" When vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc

" Show (partial) command in the status line
set showcmd

let mapleader=","

" Move linewise
:nmap j gj
:nmap k gk

" Super easy saves
map <leader>s :w<CR>

" Use jj to leave insert mode
inoremap jj <Esc>

" Use v to leave insert mode while in visual mode
vnoremap v <esc>

" NOTE: single escape causes vim to start in insert mode on debian9.
" unhilight on escape escape
nnoremap <esc><esc> :nohl<cr>

" Delete word means delete a word
nmap <silent>dw daw

" CamelCaseMotion support
map <leader>b <Plug>CamelCaseMotion_b
map <leader>w <Plug>CamelCaseMotion_w

" Easier quoting with custom vim surround remaps
map <leader>' ysiw'
map <leader>" ysiw"
map <leader>{ ysiw{
map <leader>( ysiw(
map <leader>[ ysiw[

" Better split pane navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Auto-highlight json
autocmd BufNewFile,BufRead *.json set ft=json

" Map Ctrl+Y and Ctrl+E to move Quarter page up/down respectively
" this overrides normal view scrolling behavior, but I never use that
" function! ScrollQuarter(move)
"   let height=winheight(0)

"   if a:move == 'up'
"     let key="k"
"   else
"     let key="j"
"   endif

"   execute 'normal! ' . height/4 . key
" endfunction

" nnoremap <C-Y> <up> :call ScrollQuarter('up')<CR>
" nnoremap <C-E> <down> :call ScrollQuarter('down')<CR>

" --- NERDTree ---
" map leader+n to toggle the tree
map <Leader>N :NERDTreeFind<CR>
map <Leader>n :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', '__pycache']
let g:NERDTreeNodeDelimiter = "\u00a0"

" --- Buffer switching ---
" map <Leader>bf :bnext<cr>
" map <Leader>bb :bprevious<cr>
" map <Leader>bc :Bclose<cr>

" Search for 2 chars with easy motion
nmap s <Plug>(easymotion-s2)

" Use silver searcher with ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" map leader+ff to fuzzy find files
map <Leader>bb :SelectBuf<CR>

" To open a new empty buffer
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>q :bp <BAR> bd #<CR>

" Copy and paste to system clipboard
map <leader>c "*y
map <leader>v "*p

" Treat jsx like js
augroup FiletypeGroup
  autocmd!
  au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END

"--- FZF ---
" set rtp+=/usr/local/bin/fzf
" set rtp+=~/.fzf
set rtp+=/usr/local/opt/fzf
" set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf

" map leader+ff to fuzzy find files
map <Leader>ff :Files<CR>

" map leader+fc to find commits
map <Leader>fc :Commits<CR>

map <Leader>p :BufExplorer<CR>

"--- vim-javascript ---
" do not syntax highlight jsdocs
let g:javascript_plugin_jsdoc = 0

" --- vim-jsx ---
" jsx extension is not required for syntax highlighting and indenting
let g:jsx_ext_required = 0

" vim-commentary
 autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.jsx

" -- vim-elixir hack --
" au BufRead,BufNewFile *.ex,*.exs set filetype=elixir
" au BufRead,BufNewFile *.eex set filetype=eelixir
"

let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

" Format with Prettier on save
" let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
"

" auto format elixir files
autocmd BufWritePost \*.exs silent :!mix format %
autocmd BufWritePost \*.ex silent :!mix format %

" Shortcut for pipe operator
ia pp \|>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" set filetypes as typescriptreact
" autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
"
" YATS requires this
set re=0

" nvim 0.5.0 stuff
" lua <<EOF
" require'lspconfig'.tsserver.setup{}

" require'nvim-treesitter.configs'.setup {
"   ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
"   ignore_install = { "c", "scala", "php" }, -- List of parsers to ignore installing
"   highlight = {
"     enable = true,              -- false will disable the whole extension
"     disable = {},  -- list of language that will be disabled
"   },
" }
" EOF

" nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
" nnoremap <silent> gh     <cmd>lua vim.lsp.buf.hover()<CR>
" nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
" nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
" nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
" nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
" nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
" nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>

