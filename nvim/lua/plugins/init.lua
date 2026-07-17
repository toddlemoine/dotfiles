return {
	-- ==========================================
	-- 1. LOOK & FEEL
	-- ==========================================
	-- {
	--   "shaunsingh/nord.nvim",
	--   lazy = false,
	--   priority = 1000,
	--   config = function() vim.cmd([[colorscheme nord]]) end
	-- },
	-- {
	-- 	"AlexvZyl/nordic.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("nordic").setup({
	-- 			-- You can further customize contrast here
	-- 			override = {
	-- 				-- Example: make the background even darker if you want
	-- 				-- MainBackground = { bg = "#0d0f14" },
	-- 			},
	-- 		})
	-- 		vim.cmd.colorscheme("nordic")
	-- 	end,
	-- },
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {
	-- 		style = "moon", -- The variant you want
	-- 		transparent = false, -- Set to true if you want your terminal background to show through
	-- 		terminal_colors = true,
	-- 		styles = {
	-- 			sidebars = "dark", -- Sets darker background for Nvim-Tree
	-- 			floats = "dark", -- Sets darker background for popups/Telescope
	-- 		},
	-- 		on_colors = function(colors)
	-- 			-- Optional: If you find it still isn't punchy enough,
	-- 			-- you can manually darken the background here:
	-- 			-- colors.bg = "#1a1b26"
	-- 		end,
	-- 	},
	-- 	config = function(_, opts)
	-- 		require("tokyonight").setup(opts)
	-- 		vim.cmd([[colorscheme tokyonight-moon]])
	-- 	end,
	-- },

	-- Modern status line to replace your massive airline config
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({ options = { theme = "nord" } })
		end,
	},

	-- File Explorer (Modern NERDTree)
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("nvim-tree").setup()
			vim.keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>")
			vim.keymap.set("n", "<leader>N", ":NvimTreeFindFile<CR>")
		end,
	},

	-- ==========================================
	-- 2. FUZZY FINDING & SEARCH (Replaces FZF, Ack, & BufExplorer)
	-- ==========================================
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fc", builtin.git_commits, {})
			vim.keymap.set("n", "<leader>p", builtin.buffers, {})
			vim.keymap.set("n", "<leader>rg", builtin.live_grep, {}) -- Instant ripgrep search
		end,
	},

	-- ==========================================
	-- 3. TREESITTER (Syntax Parsing Engine)
	-- ==========================================
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "javascript", "typescript", "elixir", "lua", "json", "html", "css" },
				highlight = { enable = true },
			})
		end,
	},
	-- ==========================================
	-- 4. NATIVE LSP & AUTO-COMPLETION (Modern 0.12+ Style)
	-- ==========================================
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = { "vtsls", "elixirls", "lua_ls" },
			})

			-- bridge completion capabilities
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- NEW NEVOM 0.12+ PATTERN:
			-- Instead of require('lspconfig').server.setup(), we use vim.lsp.enable()

			-- JS/TS
			vim.lsp.enable("vtsls", { capabilities = capabilities })

			-- Elixir
			vim.lsp.enable("elixirls", {
				capabilities = capabilities,
				cmd = { "elixir-ls" },
			})

			-- Lua
			vim.lsp.enable("lua_ls", {
				capabilities = capabilities,
				settings = { Lua = { diagnostics = { globals = { "vim" } } } },
			})

			-- Global Diagnostic/LSP Mappings (Modern API)
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local opts = { buffer = args.buf }
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "gh", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gi", vim.diagnostic.open_float, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

					-- Format on save
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = args.buf,
						callback = function()
							vim.lsp.buf.format({ async = false })
						end,
					})
				end,
			})

			-- [Keep your existing nvim-cmp setup below this]
		end,
	},

	-- ==========================================
	-- 5. UTILITIES & CLASSICS
	-- ==========================================
	{ "tpope/vim-surround" },
	{ "tpope/vim-commentary" },
	{ "tpope/vim-repeat" },
	{ "airblade/vim-gitgutter" },
	{ "bkad/CamelCaseMotion" },

	-- ==========================================
	-- 6. INTUITIVE FAST JUMPING (Modern Sneak)
	-- ==========================================
	{
		url = "https://codeberg.org/andyg/leap.nvim",
		config = function()
			local leap = require("leap")

			-- Define the classic 2-character sneak mappings
			vim.keymap.set("n", "s", "<Plug>(leap-forward)", { desc = "Leap Forward" })
			vim.keymap.set("n", "S", "<Plug>(leap-backward)", { desc = "Leap Backward" })

			-- Optional: Allow leaping across split windows seamlessly
			leap.opts.max_phase_one_targets = 0
			leap.add_default_mappings(false) -- Prevents it from overriding your preferred keys
		end,
	},
}
