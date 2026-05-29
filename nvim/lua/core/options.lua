local opt = vim.opt

-- The Big Fix
opt.wrap = false

-- UI Improvements
opt.termguicolors = true
opt.background = "dark"
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.laststatus = 3   -- Global statusline
opt.cmdheight = 1    -- Keeps the bottom clean
opt.showmode = false -- Lualine shows the mode, no need for the text hint below

-- Search & System
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.clipboard = "unnamedplus"
opt.mouse = "a"
opt.undolevels = 1000
opt.updatetime = 300

-- Tabs & Indent
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true

-- Modern Folding (Treesitter powered)
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldenable = false -- Don't fold everything by default when opening a file
opt.foldlevel = 99     -- Start with all folds open
