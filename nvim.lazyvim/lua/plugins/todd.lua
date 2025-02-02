return {
  -- { "jlanzarotta/bufexplorer" },

  -- Colorscheme
  { "atelierbram/Base2Tone-nvim" },
  -- Sneak
  {
    "justinmk/vim-sneak",
    opts = {
      highlight_options = {
        ctermfg = "red",
        ctermbg = "yellow",
        guifg = "red",
        guibg = "yellow",
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "base2tone_sea_dark",
      -- colorscheme = "base2tone_lake_dark",
      -- colorscheme = "base2tone_meadow_dark",
      -- colorscheme = "base2tone_forest_dark",
      -- colorscheme = "base2tone_pool_dark",
      -- colorscheme = "base2tone_field_dark",
      -- colorscheme = "base2tone_space_dark",
      -- colorscheme = "base2tone_drawbridge_dark",
    },
  },

  -- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
  -- treesitter, mason and typescript.nvim. So instead of the above, you can use:
  { import = "lazyvim.plugins.extras.lang.typescript" },

  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },
}
