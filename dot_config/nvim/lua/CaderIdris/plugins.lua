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
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = function(_, opts)
			-- Other blankline configuration here
			return require("indent-rainbowline").make_opts(opts)
		end,
		dependencies = {
			"TheGLander/indent-rainbowline.nvim",
		},
	},
	-- Theme
	--{
	--	"ellisonleao/gruvbox.nvim",
	--	lazy = false,
	--	dependencies = { "norcalli/nvim-colorizer.lua" },
	--	config = function()
	--		require("gruvbox").setup()
	--		vim.cmd('set background=dark')
	--		vim.cmd('colorscheme gruvbox')
	--	end,
	--},
	{
		'luisiacc/gruvbox-baby',
		lazy = false,
		config = function() 
			vim.g.gruvbox_baby_background_color = "dark"
			vim.g.gruvbox_baby_telescope_theme = 1
			vim.cmd.colorscheme("gruvbox-baby")
		end,
	},

	-- File tree
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			"3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		}
	},

	--  Telescope
	{
		"nvim-telescope/telescope.nvim",
		lazy = false,
		opts = {
			defaults = {
				borderchars = {
					prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
					results = { " " },
					preview = { " " },
				}
			}
		}
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
		config = function ()
			require('neoscroll').setup {}
		end,
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
		"kylechui/nvim-surround",
		lazy = false
	},

	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		opts = {}
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
		opts = {}
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
		"nvim-treesitter/nvim-treesitter-context",
		opts = {}
	},
	{
	  'stevearc/dressing.nvim',
	  opts = {},
	},

	{
	    "ziontee113/icon-picker.nvim",
	    config = function()
		require("icon-picker").setup({ disable_legacy_commands = true })

		local opts = { noremap = true, silent = true }

		vim.keymap.set("n", "<Leader><Leader>i", "<cmd>IconPickerNormal<cr>", opts)
		vim.keymap.set("n", "<Leader><Leader>y", "<cmd>IconPickerYank<cr>", opts) --> Yank the selected icon into register
		vim.keymap.set("i", "<C-i>", "<cmd>IconPickerInsert<cr>", opts)
	    end
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
		"gelguy/wilder.nvim",
		opts = {
			modes = {':', '/', '?'}
		}
	},
	-- Neorg
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


