lsp_servers = {
	'bashls',
	'cssls',
	--'html',
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
	--'htmx',
	'jinja_lsp'
	--'gleam'
}


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
	{
		"rcarriga/nvim-notify",
		event = "VeryLazy",
		config = function()
			require("notify").setup(
				{
					 background_colour = "#000000"
				}
			)
		end,

	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("noice").setup(
				{
					routes = {
							{ filter = { event = "msg_show", find = "search hit" }, skip = true },
					},
					cmdline = {
					      view = "cmdline",
					},
				}
			)
		end,
	},
	{ "nvim-lua/plenary.nvim" },

	-- Fidget. Shows lsp progress
	{
		"j-hui/fidget.nvim",
		event = "LspAttach",
		opts = {
			-- options
		},
	},
	-- Theme
--	{
--		"ellisonleao/gruvbox.nvim",
--		lazy = false,
--		dependencies = { "norcalli/nvim-colorizer.lua" },
--		config = function()
--			require("gruvbox").setup()
--			vim.cmd('set background=dark')
--			vim.cmd('colorscheme gruvbox')
--		end,
--	},
	{ "norcalli/nvim-colorizer.lua" },
	{
		'luisiacc/gruvbox-baby',
		lazy = false,
		init = function()
			local wk = require("which-key")
			wk.register(
				{
					["<leader>c"] = {
						name = "Colourscheme",
						t = {gruvbox_baby_toggle, "Toggle transparency"}
					}
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
		"stevearc/oil.nvim",
		config = function()
			require("oil").setup(
				{
					columns = {"icon", "permissions", "size", "mtime"},
					delete_to_trash = true,
					skip_confirm_for_simple_edits = false,
					view_options = {
						show_hidden = true
					}
				}
			)
		end,
		init = function()
			local wk = require("which-key")
			wk.register(
				{
					["-"] = {":Oil<CR>", "Open Oil"},
					--["<leader>-"] = {require("oil").toggle_float "Open Oil as floating window"},
				}
			)
		end,
	},
	{
		"lewis6991/satellite.nvim",
		config = function()
			require("satellite").setup(
				{

				}
			)
		end,
	},
	-- Debugging and Testing
--	{
--		"mfussenegger/nvim-dap",
--		dependencies = {
--			"mfussenegger/nvim-dap-python",
--			"rcarriga/nvim-dap-ui",
--			"theHamsta/nvim-dap-virtual-text",
--			"nvim-neotest/nvim-nio",
--			"williamboman/mason.nvim",
--		},
--		config = function()
--			local dap = require("dap")
--			local ui = require("dapui")
--
--			ui.setup()
--			require("dap-python").setup("~/.local/share/virtualenvs/datblygiad/bin/python")
--			require("nvim-dap-virtual-text").setup()
--			dap.listeners.before.attach.dapui_config = function()
--			ui.open()
--			end
--			dap.listeners.before.launch.dapui_config = function()
--			ui.open()
--			end
--			dap.listeners.before.event_terminated.dapui_config = function()
--			ui.close()
--			end
--			dap.listeners.before.event_exited.dapui_config = function()
--			ui.close()
--			end
--		end,
--		init = function()
--			local wk = require("which-key")
--			local dap = require("dap")
--			local ui = require("dapui")
--			wk.register(
--				{
--					["<Leader>d"] = {
--						name = "Dap me up",
--						b = {dap.toggle_breakpoint, "Toggle breakpoint"},
--						r = {dap.run_to_cursor, "Run to cursor"},
--						["?"] = {function() ui.eval(nil, { enter = true }) end, "Evaluate variable"},
--						["<F1>"] =  {dap.continue, "Continue"},
--						["<F2>"] =  {dap.step_into, "Step into"},
--						["<F3>"] =  {dap.step_over, "Step over"},
--						["<F4>"] =  {dap.step_out, "Step out"},
--						["<F5>"] =  {dap.step_back, "Step back"},
--						["<F12>"] =  {dap.restart, "Restart"},
--					}
--				}
--			)
--		end,
--	},
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-neotest/neotest-python",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter"
		},
		config = function()
			require("neotest").setup(
				{
					adapters = {
						require("neotest-python")(
							{
								runner="pytest",
								python=".venv/bin/python",
								args = {"--log-level", "DEBUG"}
							}
						)
					}
				}
			)
		end,
		init = function()
			local wk = require("which-key")
			local nt = require("neotest")
			wk.register(
				{
					["<Leader>t"] = {
						name = "Neotest",
						r = {function() nt.run.run() end, "Run single test"},
						a = {function() nt.run.run(vim.fn.expand("%")) end, "Run all tests"},
						--d = {function() nt.run.run({strategy = "dap"}) end, "Debug nearest test"},
						s = {function() nt.run.stop() end, "Stop nearest test"},
						j = {function() nt.run.attach() end, "Attach to nearest test"}
					}
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
					["<Leader>f"] = {
						name = "Telescope",
						f = {":Telescope find_files<CR>", "Tscope: List files in cwd"},
						g = {":Telescope git_files<CR>", "Tscope: Fuzzy search git files in curent repo"},
						s = {":Telescope grep_string<CR>", "Tscope: Search for selected string in cwd"}, {mode = "v"},
						l = {":Telescope live_grep<CR>", "Tscope: Search files in cwd"},
						h = {":Telescope command_history<CR>", "Tscope: Search cmd history"},
						o = {":Telescope oldfiles<CR>", "Tscope: Search file history"},
						t = {":Telescope tags<CR>", "Tscope: Search tags"},
						k = {":Telescope keymaps<CR>", "Tscope: Keymaps"},
						v = {":Telescope vim_options<CR>", "Tscope: Vim options"},
						r = {":Telescope registers<CR>", "Tscope: View registers"},
						m = {":Telescope marks<CR>", "Tscope: View marks"},
						c = {":Telescope git_commits<CR>", "Tscope: View git commits"},
						x = {":Telescope git_branches<CR>", "Tscope: View git branches"},
					}

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
	-- Scroll smoothly
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
					["<leader>v"] = {
						name = "DataViewer",
						d = {":DataViewer<CR>", "Open DataViewer"}
					}
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
		event = "VeryLazy"
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

	-- Split objects with Treesitter
	{
		'Wansmer/treesj',
		config = function()
			require('treesj').setup({})
		end,
		init = function()
			local wk = require("which-key")
			wk.register(
				{
					["<leader>j"] = {":TSJToggle<CR>", "Toggle multiline object"},
				}
			)
		end,
	},
	-- Tagbar
	{
		"preservim/tagbar",
		init = function()
			local wk = require("which-key")
			wk.register(
				{
					["<leader>b"] = {":TagbarToggle<CR>", "Toggle Tagbar"},
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
		config = function()
			require("lualine").setup(
				{
					sections = {
						lualine_x = {
							{
								require("noice").api.statusline.mode.get,
								cond = require("noice").api.statusline.mode.has,
								color = { fg = "#ff9e64" },
							},
						},
					},
				}
			)
		end,
	},

	{
		"lewis6991/gitsigns.nvim",
		opts = {}
	},

	{
		"nvim-treesitter/nvim-treesitter",
		event = "VeryLazy",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = "all",
				highlight = {
					enable = true,
					disable = { "html" }
				},
				indent    = {
					enable = true,
					disable = { "html" }
				},
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
	-- Emoji and Nerdfont picker
	{
	    "ziontee113/icon-picker.nvim",
		init = function()
			local wk = require("which-key")
			wk.register(
				{
					["<leader>i"] = {
						name = "Icon Picker",
						e = {":IconPickerNormal<CR>", "Add emoji"},
					}
				}
			)
		end,
		config = function()
			require("icon-picker").setup({ disable_legacy_commands = true })
		end
	},
	-- Completion and Snippets
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
		dependencies = { "rafamadriz/friendly-snippets" },
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
	{
		"andersevenrud/cmp-tmux"
	},
	{
		"petertriho/cmp-git"
	},
	{
		"hrsh7th/cmp-calc"
	},
	{
		"ray-x/cmp-treesitter"
	},
	{
		"lukas-reineke/cmp-under-comparator"
	},
	{
		"hrsh7th/cmp-nvim-lsp-document-symbol"
	},
	{
		"chrisgrieser/cmp-nerdfont"
	},
	{
		"kdheepak/cmp-latex-symbols"
	},
	{
		"saadparwaiz1/cmp_luasnip"
	},
	{
		"hrsh7th/cmp-emoji"
	},
	{
		"hrsh7th/cmp-nvim-lsp"
	},
	{
		"hrsh7th/cmp-buffer"
	},
	{
		"hrsh7th/cmp-path"
	},
	{
		"hrsh7th/cmp-cmdline"
	},
	{
		"micangl/cmp-vimtex"
	},
	{
		"rafamadriz/friendly-snippets"
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			cmp.setup(
				{
					snippet = {
						expand = function(args)
							require('luasnip').lsp_expand(args.body)
						end,
					},
					sources = cmp.config.sources(
						{
							{ name = 'nvim_lsp' },
							{ name = 'luasnip' },
							{ name = 'treesitter' },
							{ name = 'neorg' },
							{ name = 'buffer' },
							{ name = 'calc' },
							{ name = 'latex_symbols' },
							{ name = 'vimtex' },
							{
								name = 'tmux',
								option = {
									all_panes = false,
									capture_history = false,
								}
							},
							{ name = 'path' },
							{ name = 'emoji' },
							{ name = 'nerdfont' }
						}
					),
					mapping = cmp.mapping.preset.insert(
						{
							["<Tab>"] = cmp.mapping.select_next_item(),
							["<S-Tab>"] = cmp.mapping.select_prev_item(),
							["<CR>"] = cmp.mapping.confirm({select = false})
						}
					),
					sorting = {
						comparators = {
							cmp.config.compare.offset,
							cmp.config.compare.exact,
							cmp.config.compare.score,
							require("cmp-under-comparator").under,
							cmp.config.compare.kind,
							cmp.config.compare.sort_text,
							cmp.config.compare.length,
							cmp.config.compare.order,
						},
					},
				}
			)
			cmp.setup.filetype(
				'gitcommit',
				{
					sources = cmp.config.sources(
						{
							{ name = 'git' },
						}, {
							{ name = 'buffer' },
						}
					)
				}
			)

			cmp.setup.filetype(
				{'sql', 'mysql', 'plsql'},
				{
					sources = cmp.config.sources(
						{
							{ name = 'vim-dadbod-completion' },
						}
					)
				}
			)

			cmp.setup.cmdline(
				{ '/', '?' },
				{
					mapping = cmp.mapping.preset.cmdline(),
					sources = {
						{
							{ name = 'nvim_lsp_document_symbol' }
						},
						{
							{ name = 'buffer' }
						}
					}
				}
			)

			cmp.setup.cmdline(
				':',
				{
					mapping = cmp.mapping.preset.cmdline(),
					sources = cmp.config.sources(
						{
							{ name = 'path' }
						}, {
							{ name = 'cmdline' }
						}
					),
					matching = { disallow_symbol_nonprefix_matching = false }
				}
			)
		end,
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
		"neovim/nvim-lspconfig",
		config = function()
			for _, server in ipairs(lsp_servers) do
--				if server:find('jedi_language_server', 1, true) then
--					require("lspconfig")[server].setup {
--						settings = {
--							require("coq").lsp_ensure_capabilities {
--								jedi = {
--									workspace = {
--										environmentPath = '~/.local/share/virtualenvs/datblygiad'
--									}
--								}
--							}
--						}
--					}
--				else
				require("lspconfig")[server].setup(
					{
						--capabilities = require("cmp_nvim_lsp").default_capabilities()
					}
				)
				--end
			end
		end,
	},
	{
		"gelguy/wilder.nvim",
		opts = {
			modes = {':', '/', '?'}
		}
	},
	-- Neoformat
	{
		"sbdchd/neoformat",
		init = function()
			local wk = require("which-key")
			wk.register(
				{
					["<leader>n"] = {
						name = "Neoformat",
						f = {":Neoformat<CR>", "Neoformat"},
					}
				}
			)
		end,
	},
	-- Nvim-tmux navigation
	{
		'numToStr/Navigator.nvim',
		config = function()
			require('Navigator').setup(
				{
					auto_save = 'current',
					disable_on_zoom = true
				}
			)
		end,
		init = function()
			local wk = require("which-key")
			wk.register(
				{
					["<A-h>"] = {":NavigatorLeft<CR>", "Navigate Left"},
					["<A-j>"] = {":NavigatorDown<CR>", "Navigate Down"},
					["<A-k>"] = {":NavigatorUp<CR>", "Navigate Up"},
					["<A-l>"] = {":NavigatorRight<CR>", "Navigate Right"},
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
					["<leader>S"] = {
						name = "Silicon",
						c = {":Silicon<CR>", "Take Snapshot"}, {mode="v"},
					}
				}
			)
		end,
	},
	-- Neorg
	{
		"vhyrro/luarocks.nvim",
		priority = 1000,
		config = true
	},
	{
		"pysan3/pathlib.nvim"
	},
	{
		"nvim-neorg/neorg",
		dependencies = { "luarocks.nvim" },
		lazy = false,
		version = "*",
		config = function()
		require("neorg").setup {
			load = {
				["core.defaults"] = {}, -- Loads default behaviour
				["core.completion"] = {
						config = {
							engine = "nvim-cmp"
						}
					}, -- Completion behaviour
				["core.concealer"] = {}, -- Adds pretty icons to your documents
				["core.summary"] = {
						config = {

						}
					}, -- Generate a summary
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
	-- SQL Queries
	{
		"tpope/vim-dadbod",
		dependencies = {
			"kristijanhusak/vim-dadbod-ui",
			"kristijanhusak/vim-dadbod-completion"
		}
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


