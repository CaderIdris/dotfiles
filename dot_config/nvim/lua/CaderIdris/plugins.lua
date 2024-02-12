lsp_servers = {
	'bashls',
	'cssls',
	'html',
	'jsonls',
	'arduino_language_server',
	'eslint',
	'marksman',
	'rust_analyzer',
	'clangd',
	'lua_ls',
	'pyright',
	'taplo',
	'yamlls',
	'texlab',
	'yamlls',
	'taplo',
	'esbonio',
	'dockerls',
	'ruff_lsp'
}

vim.g.coq_settings = { auto_start = 'shut-up' }

plugins = {
	{ "nvim-lua/plenary.nvim" },
	-- Required by some plugins for symbols
	{ "kyazdani42/nvim-web-devicons" },

	-- Fidget. Shows lsp progress
	{
		"j-hui/fidget.nvim",
		event = "LspAttach",
		opts = {
			-- options
		},
	},
	-- Colour things in
	{ "norcalli/nvim-colorizer.lua" },
	-- Theme
	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		dependencies = { "norcalli/nvim-colorizer.lua" },
		config = function()
			require("gruvbox").setup()
			vim.cmd('set background=dark')
			vim.cmd('colorscheme gruvbox')
		end,
	},

	-- File tree
	{
		"kyazdani42/nvim-tree.lua",
		lazy = false
	},

	--  Telescope
	{
		"nvim-telescope/telescope.nvim",
		lazy = false
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		lazy = false
	},
	{
		"nvim-telescope/telescope-symbols.nvim",
		lazy = false
	},
	{
		"karb94/neoscroll.nvim",
		lazy = false
	},
	-- csv viewer
	{
		'vidocqh/data-viewer.nvim',
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
      			"kkharji/sqlite.lua"
		},
		config = function()
			require("data-viewer").setup()
		end,
	},

	-- More surround commands
	{
		"tpope/vim-repeat",
		lazy = false
	},
	{
		"tpope/vim-surround",
		lazy = false
	},

	-- More word objects
	{
		"AndrewRadev/splitjoin.vim",
		lazy = false
	},

	-- Autopairs
	{
		"windwp/nvim-autopairs",
		lazy = false
	},

	-- Tagbar
	{
		"preservim/tagbar",
		lazy = false
	},
	-- EasyNavigator replacement

	{
		"phaazon/hop.nvim",
		config = function()
			require("hop").setup()
		end,
		lazy = false
	},


	{
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				icons_enabled = true,
				component_separators = { left = "", right = "" },
				section_separators   = { left = "", right = "" },
				theme = 'gruvbox_dark' 
			},
			tabline = { lualine_a = { "tabs" } },
		},
	},

	{
		"lewis6991/gitsigns.nvim",
	},

	{ 
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = "all",
				highlight = { enable = true },
				indent    = { enable = true },
			})
			vim.opt.foldmethod = "expr"
			vim.opt.foldexpr   = "nvim_treesitter#foldexpr()"
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("nvim-treesitter.configs").setup({
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
						},
					},
				},
			})
		end,
	},

	{
		"junegunn/vim-emoji",
	},

	-- LSP
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup {
				ensure_installed = lsp_servers
			}
		end,
	},
	{
		"ms-jpq/coq_nvim",
		branch = 'coq'
	},
	{
		"ms-jpq/coq.artifacts",
		branch = 'artifacts'
	},
	{
		"ms-jpq/coq.thirdparty",
		branch = '3p'
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			for _, server in ipairs(lsp_servers) do
				if server:find('jedi_language_server', 1, true) then
					require("lspconfig")[server].setup {
						settings = {
							require("coq").lsp_ensure_capabilities {
								jedi = {
									workspace = {
										environmentPath = '~/.local/share/virtualenvs/datblygiad'
									}
								}
							}
						}
					}
				else
					require("lspconfig")[server].setup(require("coq").lsp_ensure_capabilities())
				end
			end
		end,
	},
	{
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
		require("neorg").setup {
		load = {
			["core.defaults"] = {}, -- Loads default behaviour
			["core.concealer"] = {}, -- Adds pretty icons to your documents
			["core.dirman"] = { -- Manages Neorg workspaces
				config = {
					workspaces = {
						general = "~/Notes/General",
						work = "~/Notes/Work",
						phd = "~/Notes/PhD",
					},
					default_workspace = "phd"
						},
					},
				},
			}
		end,
	}
}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup(plugins, opts)


