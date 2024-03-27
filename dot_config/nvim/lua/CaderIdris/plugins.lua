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
	'ruff_lsp',
	'htmx',
	'gleam'
}

vim.g.coq_settings = { auto_start = 'shut-up' }

local gruvbox_baby_toggle = function()
	vim.g.gruvbox_baby_transparent_mode = not vim.g.gruvbox_baby_transparent_mode
	vim.cmd.colorscheme("gruvbox-baby")
end

plugins = {
	{
	  "folke/which-key.nvim",
	  event = "VeryLazy",
	  opts = {
	  }
	},
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
	{ "norcalli/nvim-colorizer.lua" },
	{
		'luisiacc/gruvbox-baby',
		lazy = false,
		init = function()
			local wk = require("which-key")
			wk.register(
				{
					["<leader>ct"] =  {gruvbox_baby_toggle, "Toggle transparency"}
				}
			)
		end,
		config = function()
			vim.g.gruvbox_baby_background_color = "dark"
			vim.g.gruvbox_baby_transparent_mode = true
			vim.g.gruvbox_baby_telescope_theme = 1
			vim.cmd.colorscheme("gruvbox-baby")
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = function(_, opts)
			return require("indent-rainbowline").make_opts(
				opts,
				{
					color_transparency = 0.35,
					colors = { 0xfb4934, 0xfabd2f, 0xd4879c, 0x98971a, 0xb16286, 0xd65d0e, 0x458488 },
				}
			)
		end,
		dependencies = {
			"TheGLander/indent-rainbowline.nvim",
		},
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
		},
		init = function()
			local wk = require("which-key")
			wk.register(
				{
					["<leader>fb"] = {":Neotree<CR>", "Open Neotree"}
				}
			)
		end,
	},

	--  Telescope
	{
		"nvim-telescope/telescope.nvim",
		lazy = false,
		init = function()
			local wk = require("which-key")
			wk.register(
				{
					["<leader>ff"] = {":Telescope find_files<CR>", "Tscope: List files in cwd"},
					["<leader>fg"] = {":Telescope git_files<CR>", "Tscope: Fuzzy search git files in curent repo"},
					["<leader>fs"] = {":Telescope grep_string<CR>", "Tscope: Search for selected string in cwd"}, {mode = "v"},
					["<leader>fl"] = {":Telescope live_grep<CR>", "Tscope: Search files in cwd"},
					["<leader>hc"] = {":Telescope command_history<CR>", "Tscope: Search cmd history"},
					["<leader>hf"] = {":Telescope oldfiles<CR>", "Tscope: Search file history"},
					["<leader>tt"] = {":Telescope tags<CR>", "Tscope: Search tags"},
					["<leader>vk"] = {":Telescope keymaps<CR>", "Tscope: Keymaps"},
					["<leader>vo"] = {":Telescope vim_options<CR>", "Tscope: Vim options"},
					["<leader>vr"] = {":Telescope registers<CR>", "Tscope: View registers"},
					["<leader>vm"] = {":Telescope marks<CR>", "Tscope: View marks"},
					["<leader>gc"] = {":Telescope git_commits<CR>", "Tscope: View git commits"},
					["<leader>gb"] = {":Telescope git_branches<CR>", "Tscope: View git branches"},

				}
			)
		end,
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
		init = function()
			local wk = require("which-key")
			wk.register(
				{
					["<leader>vd"] = {":DataViewer<CR>", "Open DataViewer"}
				}
			)
		end,
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

	-- Tagbar
	{
		"preservim/tagbar",
		init = function()
			local wk = require("which-key")
			wk.register(
				{
					["<leader>wt"] = {":TagbarToggle<CR>", "Toggle Tagbar"},
				}
			)
		end,
		lazy = false
	},
	-- EasyNavigator replacement

	{
		"phaazon/hop.nvim",
		config = function()
			require("hop").setup()
		end,
		init = function()
			local wk = require("which-key")
			wk.register(
				{
					["<leader>h"] = {
						name = "Hop",
						w = {":HopWord<CR>", "Hop to word"},
						a = {":HopAnywhere<CR>", "Hop anywhere"},
						l = {":HopLineStart<CR>", "Hop to a line"},
					}
				}
			)
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
				theme = 'gruvbox-baby'
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
		init = function()
			local wk = require("which-key")
			wk.register(
				{
					["<leader>ie"] = {":IconPickerNormal<CR>", "Add emoji"},
				}
			)
		end,
		config = function()
			require("icon-picker").setup({ disable_legacy_commands = true })
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
	-- Snippets
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp"
	},
	-- Neoformat
	{
		"sbdchd/neoformat",
		init = function()
			local wk = require("which-key")
			wk.register(
				{
					["<leader>nf"] = {":Neoformat<CR>", "Neoformat"},
				}
			)
		end,
	},
	-- Silicon
	{
		"michaelrommel/nvim-silicon",
		lazy = true,
		cmd = "Silicon",
		config = function()
			require("silicon").setup({
				-- Configuration here, or leave empty to use defaults
				font = "JetBrainsMono Nerd Font=34;Twemoji=34",
				theme = "gruvbox-dark",
			})
		end,
		init = function()
			local wk = require("which-key")
			wk.register(
				{
					["<leader>SC"] = {":Silicon<CR>", "Take Snapshot"}, {mode="v"},
				}
			)
		end,
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
	},
	-- ChatGPT Plugin
	{
		"jackMort/ChatGPT.nvim",
		event = "VeryLazy",
		config = function()
		require("chatgpt").setup(
			{
				api_key_cmd = "pass keys/openai/neovim_chatgpt",
			}
		)
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"folke/trouble.nvim",
			"nvim-telescope/telescope.nvim"
		}
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


