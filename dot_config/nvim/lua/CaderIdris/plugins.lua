local function manage_plugins()
    local plugins = {
        ["https://github.com/faerryn/plogins.nvim.git"] = {},
	["https://github.com/nvim-lua/plenary.nvim.git"] = {},
	-- Required by some plugins for symbols
	["https://github.com/kyazdani42/nvim-web-devicons.git"] = {},

	-- Fidget. Shows lsp progress
	["https://github.com/j-hui/fidget.nvim.git"] = {
		packadd_hook = function()
			require('fidget').setup()
		end,
	},

	-- Colour things in
	["https://github.com/norcalli/nvim-colorizer.lua.git"] = {
		packadd_hook = function()
			require('colorizer').setup()
		end,
	},

	-- File tree
	["https://github.com/kyazdani42/nvim-tree.lua.git"] = {
		packadd_hook = function()
			require('nvim-tree').setup()
		end,
	},

	--  Telescope
	["https://github.com/nvim-telescope/telescope.nvim"] = {},
	["https://github.com/nvim-telescope/telescope-fzf-native.nvim"] = {},
	["https://github.com/nvim-telescope/telescope-symbols.nvim"] = {},
	["https://github.com/karb94/neoscroll.nvim"] = {},

	-- More surround commands
	["https://github.com/tpope/vim-repeat"] = {},
	["https://github.com/tpope/vim-surround"] = {},

	-- More word objects
	["https://github.com/AndrewRadev/splitjoin.vim"] = {},

	-- Autopairs
	["https://github.com/windwp/nvim-autopairs"] = {},

	-- Tagbar
	["https://github.com/preservim/tagbar"] = {},

	-- EasyNavigator replacement
	["https://github.com/phaazon/hop.nvim.git"] = {
		packadd_hook = function()
			require('hop').setup()
		end,
	},


        ["https://github.com/nvim-lualine/lualine.nvim.git"] = {
		packadd_hook = function()
			require("lualine").setup {
				options = {
					icons_enabled = true,
					component_separators = { left = "", right = "" },
					section_separators   = { left = "", right = "" },
					theme = 'gruvbox_dark' 
				},
			    tabline = { lualine_a = { "tabs" } },
			}
		    end,
        },

        ["https://github.com/lewis6991/gitsigns.nvim.git"] = {
            packadd_hook = function()
                require("gitsigns").setup()
            end,
        },

        ["https://github.com/nvim-treesitter/nvim-treesitter.git"] = {
            packadd_hook = function()
                require("nvim-treesitter.configs").setup({
                    ensure_installed = "all",
                    highlight = { enable = true },
                    indent    = { enable = true },
                })
                vim.opt.foldmethod = "expr"
                vim.opt.foldexpr   = "nvim_treesitter#foldexpr()"
            end,
            upgrade_hook = function()
                require("nvim-treesitter.install").update()
            end,
        },

        ["https://github.com/nvim-treesitter/nvim-treesitter-textobjects.git"] = {
            packadd_after = { ["https://github.com/nvim-treesitter/nvim-treesitter.git"] = true },
            packadd_hook = function()
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

	["https://github.com/junegunn/vim-emoji.git"] = {},
	-- Theme
	["https://github.com/ellisonleao/gruvbox.nvim.git"] = {
        	packadd_after = { ["https://github.com/norcalli/nvim-colorizer.lua.git"] = true },
		packadd_hook = function()
			require("gruvbox").setup()
			vim.cmd('set background=dark')
			vim.cmd('colorscheme gruvbox')
		end,
	},

	-- LSP
	["https://github.com/williamboman/mason.nvim.git"] = {
		packadd_hook = function()
			require("mason").setup()
		end,
	},

	["https://github.com/williamboman/mason-lspconfig.nvim.git"] = {
        	packadd_after = { ["https://github.com/williamboman/mason.nvim.git"] = true },
		packadd_hook = function()
			require("mason-lspconfig").setup {
				ensure_installed = {
					'bashls',
					'cssls',
					'html',
					'jsonls',
					'arduino_language_server',
					'eslint',
					'jedi_language_server',
					'marksman',
					'rust_analyzer',
					'ltex',
					'yamlls',
					'pyright',
					'taplo',
					'esbonio',
					'dockerls' 
				}
			}
		end,
	},

	["https://github.com/neovim/nvim-lspconfig.git"] = {
        	packadd_after = { ["https://github.com/williamboman/mason-lspconfig.nvim.git"] = true },
		packadd_hook = function()
			require("lspconfig").setup()
		end,
	},

	["https://github.com/ms-jpq/coq_nvim.git"] = {},
	["https://github.com/ms-jpq/coq.artifacts.git"] = {},
	["https://github.com/ms-jpq/coq.thirdparty.git"] = {},

	["https://github.com/dense-analysis/ale.git"] = {},
    }

    local manager = require("plogins").manage(plugins)

    vim.api.nvim_create_user_command("PloginsUpgrade",    manager.upgrade,    {})
    vim.api.nvim_create_user_command("PloginsAutoremove", manager.autoremove, {})
end

local plogins_source = "https://github.com/faerryn/plogins.nvim.git"
local plogins_name = plogins_source:gsub("/", "%%")
local plogins_dir = ("%s/site/pack/plogins/opt/%s"):format((vim.fn.stdpath("data")), plogins_name)
if not vim.loop.fs_stat(plogins_dir) then
    vim.loop.spawn("git", { args = { "clone", "--depth", "1", plogins_source, plogins_dir } }, function(code, signal)
        vim.defer_fn(function()
            vim.cmd(("packadd %s"):format(vim.fn.fnameescape(plogins_name)))
            manage_plugins()
        end, 0)
    end)
else
    vim.cmd(("packadd %s"):format(vim.fn.fnameescape(plogins_name)))
    manage_plugins()
end
